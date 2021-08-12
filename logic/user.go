package logic

import (
	"errors"
	"fmt"
	"github.com/mojocn/base64Captcha"
	"github.com/spf13/viper"
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/dao/redis"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"go.study.com/hina/giligili/pkg/jwt"
	"go.study.com/hina/giligili/pkg/snowflake"
	"go.study.com/hina/giligili/settings"
	"go.study.com/hina/giligili/utils"
	"strconv"
	"time"
)

var (
	ErrorWithCode = errors.New("验证码错误")
)

func Login(p *models.ParamLogin) (data *models.LoginResponse, err error) {
	p.Password = utils.EncryptPassword(p.Password)
	if base64Captcha.DefaultMemStore.Verify(p.CodeId, p.Code, true) {
		user, err := mysql.Login(p)
		if err != nil {
			return nil, err
		}
		// 生成JWT
		token, err := jwt.GenToken(user.UserID, user.Username)
		if err != nil {
			return nil, err
		}
		// redis生成token 退出的时候用
		key := fmt.Sprintf("%s%d", settings.Conf.JwtPrefix, user.UserID)
		err = redis.SetToken(key, token, time.Duration(viper.GetInt("auth.jwt_expire"))*time.Hour)
		if err != nil {
			return nil, err
		}
		data = &models.LoginResponse{
			User:  user,
			Token: token,
		}
		return data, nil
	} else {
		return nil, ErrorWithCode
	}
}

func Logout(uid interface{}) (err error) {
	key := fmt.Sprintf("%s%d", settings.Conf.JwtPrefix, uid)
	err = redis.DelToken(key)
	return
}

func ChangePassword(user *request.ReqChangePassword, uid int64) (err error) {
	// 1.校验密码是否正确
	mdPassword := utils.EncryptPassword(user.Password)
	ok := mysql.CheckUserPasswordByUserId(uid, mdPassword)
	if !ok {
		return errors.New("用户名或密码错误")
	}
	// 2.修改密码
	newPassword := utils.EncryptPassword(user.NewPassword)
	err = mysql.ChangeUserPasswordByUserId(uid, newPassword)
	return

}

func DeleteUser(id uint, uid int64) error {
	user, err := mysql.GetUserByID(uid)
	if err != nil || user.ID == id {
		return errors.New("不可自杀")
	}
	return mysql.DeleteUser(id)
}

func SetUserInfo(reqUser models.SysUser) (user models.SysUser, err error) {
	return mysql.SetUserInfo(reqUser)
}

func buildOneUser(userInfo *models.SysUser) (data response.ResUser) {
	return response.ResUser{
		SysUser: *userInfo,
		Role:    []models.SysRole{userInfo.Role},
		Dept:    userInfo.Dept,
	}
}

func ExportAllUsers(page, size int64, m map[string]string) (data []*models.ExportUser, err error) {
	users, err := mysql.GetAllUsers(page, size, m)
	var d *models.ExportUser
	m1 := map[string]string{"0": "男", "1": "女", "2": "未知"}
	m2 := map[bool]string{true: "正常", false: "停用"}
	for _, user := range users {
		d = &models.ExportUser{
			ID:       user.ID,
			UserName: user.Username,
			Name:     user.Name,
			Email:    user.Email,
			Mobile:   user.Mobile,
			Gender:   m1[user.Gender],
			IsActive: m2[user.IsActive],
			DeptName: user.Dept.DeptName,
			Leader:   user.Dept.Leader,
		}
		data = append(data,d)
	}
	return
}

func GetAllUsers(page, size int64, m map[string]string) (data *response.ResUsers, err error) {
	if val, exists := m["is_active"]; exists {
		ok, _ := strconv.ParseBool(val)
		if ok {
			m["is_active"] = "1"
		} else {
			m["is_active"] = "0"
		}
	}
	users, err := mysql.GetAllUsers(page, size, m)
	us := make([]response.ResUser, 0, len(users))
	for _, user := range users {
		us = append(us, buildOneUser(user))
	}
	data = &response.ResUsers{
		Count:    len(users),
		Next:     "",
		Previous: "",
		Results:  us,
	}
	return
}

func GetPostRoles() (data map[string]interface{}, err error) {
	posts, err := mysql.GetPosts()
	roles, err := mysql.GetRoles()
	data = make(map[string]interface{})
	s1 := make([]interface{}, 0, len(posts))
	var p1 response.ResPost
	for _, post := range posts {
		p1 = response.ResPost{
			ID:       post.ID,
			PostCode: post.PostCode,
			PostName: post.PostName,
			Status:   post.Status,
		}
		s1 = append(s1, p1)
	}
	data["posts"] = s1
	s2 := make([]interface{}, 0, len(roles))
	var p2 response.ResRole
	for _, role := range roles {
		p2 = response.ResRole{
			ID:       role.RoleId,
			RoleKey:  role.RoleKey,
			RoleName: role.RoleName,
			Status:   role.Status,
		}
		s2 = append(s2, p2)
	}
	data["roles"] = s2
	return

}

func buildUser(userInfo *models.SysUser) *response.ResUser {
	return &response.ResUser{
		SysUser: *userInfo,
		Role:    []models.SysRole{userInfo.Role},
		Dept:    userInfo.Dept,
	}
}

func GetUserData(id int64) (data map[string]interface{}, err error) {
	userInfo, err := mysql.GetUserData(id)
	data = make(map[string]interface{})
	user := buildUser(userInfo)
	data["data"] = user
	postIds := make([]uint, 0)
	for _, post := range userInfo.Posts {
		postIds = append(postIds, post.ID)
	}
	data["postIds"] = postIds
	data["roleIds"] = []int32{userInfo.Role.RoleId}
	return
}

func CreateUser(user *request.Register) (data *models.SysUser, err error) {
	userId := snowflake.GenID()
	password := utils.EncryptPassword(user.Password)
	err = mysql.CheckUserExist(user.Username)
	if err != nil {
		return
	}
	data = &models.SysUser{
		BaseModel: models.BaseModel{
			CreatedAt: getTime(),
			UpdatedAt: getTime(),
		},
		UserID:   userId,
		Username: user.Username,
		Name:     user.Name,
		Password: password,
		IsActive: user.IsActive,
		Role:     models.SysRole{},
		RoleId:   user.RoleIds[0],
		DeptId:   user.DeptId,
		Mobile:   user.Mobile,
		Email:    user.Email,
		Gender:   user.Gender,
	}

	err = mysql.CreateUser(data, user.PostIds)
	return

}

func UpdateUser(pk int64, userInfo *request.ReqUpdateUser) (data *models.SysUser, err error) {
	user := &userInfo.SysUser
	user.RoleId = userInfo.RoleIds[0]
	user.UpdatedAt = getTime()
	data, err = mysql.UpdateUser(user, userInfo.PostIds)
	return
}

func GetUserProfile(uid int64) (data *response.ResUser, err error) {
	user, err := mysql.GetUserProfile(uid)
	if err != nil {
		return
	}
	data = &response.ResUser{
		SysUser: *user,
		Role:    []models.SysRole{user.Role},
		Dept:    user.Dept,
	}
	return
}

func CheckUserExist(username string) error {
	return mysql.CheckUserExist(username)
}

func UpdateUserProfile(r *request.ReqUpdateUser, uid int64) (data *response.ResUser, err error) {
	user := &models.SysUser{
		BaseModel: models.BaseModel{
			UpdatedAt: getTime(),
		},
		Username: r.Username,
		Name:     r.Name,
		Email:    r.Email,
		Mobile:   r.Mobile,
		Gender:   r.Gender,
	}
	user, err = mysql.UpdateUserProfile(user, uid)
	if err != nil {
		return
	}
	data = &response.ResUser{
		SysUser: *user,
		Role:    []models.SysRole{user.Role},
		Dept:    user.Dept,
	}
	return
}

func SaveAvatar(uid int64, fileName string) error {
	return mysql.SaveAvatar(uid, fileName)
}

func GetUserByUserID(pk int64) (*models.SysUser, error) {
	return mysql.GetUserByID(pk)
}
