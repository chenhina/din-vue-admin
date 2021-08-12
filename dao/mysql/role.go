package mysql

import (
	"bytes"
	"encoding/json"
	"fmt"
	"go.study.com/hina/giligili/models"
	"strings"
)

func GetARoles(page, size int64, m map[string]string) (data []*models.SysRole, err error) {
	if len(m) > 0 {
		var ans map[string][2]string
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			if key == "roleName" || key == "roleKey" {
				key = "role_" + strings.ToLower(strings.Replace(key, "role", "", 1))
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else if key == "as" {
				json.Unmarshal([]byte(val), &ans)
				buffer.WriteString(fmt.Sprintf("created_at between %q and %q and ", ans["create_datetime__range"][0], ans["create_datetime__range"][1]))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Preload("Menus").Preload("Depts").Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	} else {
		err = db.Preload("Menus").Preload("Depts").Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	}

	return

}

func BufferSave(sqlStr string, data []int, idx int32) string {
	var buffer bytes.Buffer
	buffer.WriteString(sqlStr)
	for i, id := range data {
		if i == len(data)-1 {
			buffer.WriteString(fmt.Sprintf("(%d,%d);", id, idx))
		} else {
			buffer.WriteString(fmt.Sprintf("(%d,%d),", id, idx))
		}
	}
	return buffer.String()
}

func GetUserRole(pk int64) (data *models.SysRole, err error) {
	data = new(models.SysRole)
	err = db.Where("role_id = ?", pk).Preload("Menus").Preload("Depts").First(data).Error
	return
}

func CreateRole(role *models.SysRole, menu []int) (data *models.SysRole, err error) {
	err = db.Create(role).Error
	sqlStr := `insert into sys_role_menu(sys_menu_id,sys_role_role_id) values`
	s := BufferSave(sqlStr, menu, role.RoleId)
	err = db.Exec(s).Error
	return role, err
}

func UpdateRole(role *models.SysRole, menu, dept []int, pk int64) (data *models.SysRole, err error) {
	err = db.Where("role_id = ?", pk).First(&models.SysRole{}).
		Select("RoleName", "RoleKey", "Status", "RoleSort","UpdatedAt").Updates(role).Error
	if len(menu) > 0 {
		err = db.Exec(`delete from sys_role_menu where sys_role_role_id = ?`, pk).Error
		sqlStr := `insert into sys_role_menu(sys_menu_id,sys_role_role_id) values`
		s := BufferSave(sqlStr, menu, int32((pk)))
		err = db.Exec(s).Error
	}
	if len(dept) > 0 {
		err = db.Exec(`delete from sys_role_dept where sys_role_role_id = ?`, pk).Error
		sqlStr := `insert into sys_role_dept(sys_dept_dept_id,sys_role_role_id) values`
		s := BufferSave(sqlStr, dept, int32((pk)))
		err = db.Exec(s).Error
	}
	return role, err
}

func DeleteRole(id int32) (err error) {
	var role models.SysRole
	err = db.Where("role_id = ?", id).Delete(&role).Error
	if err != nil {
		return
	}
	err = db.Exec(`delete from sys_role_dept where sys_role_role_id = ?`, id).Error
	if err != nil {
		return
	}
	err = db.Exec(`delete from sys_role_menu where sys_role_role_id = ?`, id).Error
	return
}
