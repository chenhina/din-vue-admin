package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/response"
	"strings"
)

func buildResUser(userInfo *models.SysUser) (data *response.ResInfoData) {
	var permission []string
	if userInfo.Role.Admin {
		permission = []string{"*:*:*"}
	} else {
		permission, _ = mysql.GetPermission(userInfo.RoleId)
	}
	roles := []string{userInfo.Role.RoleKey}
	user := response.ResUser{
		SysUser: *userInfo,
		Role:    []models.SysRole{userInfo.Role},
		Dept:    userInfo.Dept,
	}
	if permission == nil {
		permission = make([]string, 0)
	}
	data = &response.ResInfoData{
		Permissions: permission,
		Roles:       roles,
		User:        user,
	}
	return
}

func GetInfo(userId int64) (data *response.ResInfoData, err error) {
	userInfo, err := mysql.GetInfo(userId)
	data = buildResUser(userInfo)
	return
}

func GetRouters(uid int64) (data []*response.ResRouterData, err error) {
	user,err := mysql.GetUserByID(uid)
	if err != nil {
		return nil, err
	}
	res, err := mysql.GetRouters(user.RoleId)
	var redirect, compath string
	for _, v := range res {
		if v.IsFrame {
			redirect = v.WebPath
		} else {
			redirect = "noRedirect"
		}
		compath = strings.Replace(v.ComponentPath, "vadmin/", "", 1)
		if v.ComponentPath == "" {
			compath = "Layout"
		}
		data = append(data, &response.ResRouterData{
			ID:        v.ID,
			Name:      strings.Title(strings.Replace(v.WebPath, "/", "", 1)),
			Path:      v.WebPath,
			OrderNum:  v.OrderNum,
			Hinden:    false,
			Redirect:  redirect,
			Component: compath,
			Meta: response.Meta{
				Title:   v.Name,
				Icon:    v.Icon,
				NoCache: false,
			},
			ParentId: v.ParentId,
		})
	}
	return
}
