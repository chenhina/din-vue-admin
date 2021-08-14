package mysql

import (
	"bytes"
	"fmt"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"strings"
)

// CheckUserExist 检查指定用户名是否存在
func CheckUserExist(username string) error {
	u := new(models.SysUser)
	d := db.Where("username = ?", username).First(u)

	if count := d.RowsAffected; count > 0 {
		return ErrorUserExist
	}
	return nil
}

func Login(p *models.ParamLogin) (user *models.SysUser, err error) {
	user = new(models.SysUser)
	err = db.Where("username = ? AND password = ?", p.Username, p.Password).Preload("Role").First(user).Error
	return
}

// GetUserByID 根据uid获取用户信息
func GetUserByID(uid int64) (user *models.SysUser, err error) {
	user = new(models.SysUser)
	err = db.Where("user_id = ?", uid).First(user).Error
	return
}

func CheckPassword(username, password string) bool {
	user := new(models.SysUser)
	res := db.Where("username = ? AND password = ?", username, password).First(user)
	err := res.Error
	row := res.RowsAffected
	if err != nil || row == 0 {
		return false
	}
	return true
}

func ChangePassword(u *request.ReqChangePassword, uid int64) (err error) {
	newUser := new(models.SysUser)
	err = db.Where("user_id = ? ", uid).First(newUser).Update("password", u.NewPassword).Error
	return err
}

func GetUserInfoList(limit, offset int) (err error, list interface{}, total int64) {
	var userList []models.SysUser
	err = db.Model(&models.SysUser{}).Count(&total).Error
	err = db.Limit(limit).Offset(offset).Preload("Role").Find(&userList).Error
	return err, userList, total
}

func DeleteUser(id uint) error {
	var user models.SysUser
	err := db.Where("id = ?", id).Delete(&user).Error
	return err
}

func SetUserInfo(reqUser models.SysUser) (user models.SysUser, err error) {
	err = db.Updates(&reqUser).Error
	return reqUser, err

}

func GetAllUsers(page, size int64, m map[string]string) (data []*models.SysUser, err error) {
	if len(m) > 0 {
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			if key == "username" || key == "mobile" {
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		queryStr = strings.Replace(queryStr, "deptId", "dept_id", 1)
		err = db.Where(queryStr, args...).Preload("Dept").Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	} else {
		err = db.Preload("Posts").Preload("Role").Preload("Dept").Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	}

	return
}

func DeptTreeSet(status int8) (data []*models.SysDept, err error) {
	err = db.Where("status = ?", status).Find(&data).Error
	return
}

func GetPosts() (data []*models.SysPost, err error) {
	err = db.Find(&data).Error
	return
}

func GetRoles() (data []*models.SysRole, err error) {
	err = db.Find(&data).Error
	return
}

func GetUserData(id int64) (data *models.SysUser, err error) {
	data = new(models.SysUser)
	err = db.Where("id = ?", id).Preload("Posts").Preload("Role").Preload("Dept").First(data).Error
	return
}

func CreateUser(user *models.SysUser, postIds []int) (err error) {
	err = db.Create(user).Error
	for _, id := range postIds {
		err = db.Exec(`insert into sys_user_post(sys_post_id, sys_user_id) values (?,?)`, id, user.ID).Error
	}
	return
}

func UpdateUser(user *models.SysUser, postsIds []int) (data *models.SysUser, err error) {
	err = db.Where("id = ?", user.ID).First(&models.SysUser{}).
		Select("CreatedAt", "Name", "Mobile", "Email", "IsActive", "Gender", "RoleId", "DeptId").
		Updates(user).Error
	err = db.Exec(`delete from sys_user_post where sys_user_id = ?`, user.ID).Error
	for _, id := range postsIds {
		err = db.Exec(`insert into sys_user_post(sys_post_id, sys_user_id) values (?,?)`, id, user.ID).Error
	}
	return user, err
}

func GetUserProfile(uid int64) (data *models.SysUser, err error) {
	err = db.Where("user_id = ?", uid).Preload("Posts").Preload("Role").Preload("Dept").First(&data).Error
	return
}

func UpdateUserProfile(user *models.SysUser, uid int64) (data *models.SysUser, err error) {
	err = db.Where("user_id = ?", uid).First(&models.SysUser{}).
		Select("UpdatedAt", "Name", "Email", "Mobile", "Gender", "Username").
		Updates(user).Error
	return user, err
}

func CheckUserPasswordByUserId(uid int64, password string) bool {

	res := db.Where("user_id = ? and password = ?", uid, password).First(&models.SysUser{})
	err := res.Error
	row := res.RowsAffected
	if err != nil || row == 0 {
		return false
	}
	return true
}

func ChangeUserPasswordByUserId(uid int64, newPassword string) error {
	err := db.Where("user_id = ?", uid).First(&models.SysUser{}).Update("password", newPassword).Error
	return err
}

func SaveAvatar(uid int64, fileName string) (err error) {
	fileName = strings.Replace(fileName, ".", "", 1)
	err = db.Where("user_id = ?", uid).First(&models.SysUser{}).Update("avatar", fileName).Error
	return
}

func GetUserIDbyUserName(username string) (userID int64) {
	var user *models.SysUser
	err := db.Where("username = ?",username).First(&user).Error
	if err != nil {
		return
	}
	return user.UserID
}