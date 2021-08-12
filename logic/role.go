package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"strconv"
	"time"
)

func GetRoles(page, size int64, m map[string]string) (data *response.ResRoles, err error) {
	roles, err := mysql.GetARoles(page, size, m)
	var r *response.ResResult
	var detp []int32
	var menu []uint
	d := make([]*response.ResResult, 0, len(roles))
	for _, role := range roles {
		for _, d := range role.Depts {
			detp = append(detp, d.DeptId)
		}
		for _, m := range role.Menus {
			menu = append(menu, m.ID)
		}
		r = &response.ResResult{
			SysRole: *role,
			Dept:    detp,
			Menu:    menu,
		}
		d = append(d, r)
	}
	data = &response.ResRoles{
		Count:    len(roles),
		Next:     "",
		Previous: "",
		Result:   d,
	}

	return
}

func GetUserRole(pk int64) (data *response.ResResult, err error) {
	role, err := mysql.GetUserRole(pk)
	var detp []int32
	var menu []uint
	for _, d := range role.Depts {
		detp = append(detp, d.DeptId)
	}
	for _, m := range role.Menus {
		menu = append(menu, m.ID)
	}
	data = &response.ResResult{
		SysRole: *role,
		Dept:    detp,
		Menu:    menu,
	}
	return
}

func UpdateRole(r *request.ReqRole, pk int64) (data *models.SysRole, err error) {
	status, _ := strconv.ParseInt(r.Status, 10, 64)
	role := &models.SysRole{
		UpdatedAt: getTime(),
		RoleName:  r.RoleName,
		RoleKey:   r.RoleKey,
		RoleSort:  r.RoleSort,
		Status:    int8(status),
	}
	data, err = mysql.UpdateRole(role, r.Menu, r.Dept, pk)
	return
}

func getTime() models.MyTime {
	return models.MyTime(time.Now())
}

func CreateRole(r *request.ReqRole) (data *models.SysRole, err error) {
	now := time.Now()
	status, _ := strconv.ParseInt(r.Status, 10, 64)
	role := &models.SysRole{
		CreatedAt: models.MyTime(now),
		UpdatedAt: models.MyTime(now),
		RoleName:  r.RoleName,
		RoleKey:   r.RoleKey,
		RoleSort:  r.RoleSort,
		Status:    int8(status),
		Admin:     false,
	}
	data, err = mysql.CreateRole(role, r.Menu)
	return
}

func DeleteRole(id int32) error {
	return mysql.DeleteRole(id)
}
