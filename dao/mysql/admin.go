package mysql

import "go.study.com/hina/giligili/models"

func GetInfo(userId int64) (data *models.SysUser, err error) {
	data = new(models.SysUser)
	err = db.Where("user_id = ?", userId).Preload("Posts").Preload("Role").Preload("Dept").First(data).Error
	return data, err
}

func GetPermission(roleId uint8) ([]string, error) {
	var res []string
	err := db.Raw(`SELECT perms from sys_menus where perms is not null AND id in (select sys_menu_id from sys_role_menu where sys_role_role_id = ?)`, roleId).Scan(&res).Error

	return res, err
}

func GetRouters(roleID uint8) (data []*models.SysMenu, err error) {
	err = db.Raw(`SELECT * from sys_menus where menu_type != 2 AND id in (select sys_menu_id from sys_role_menu where sys_role_role_id = ?)`, roleID).Find(&data).Error
	return
}
