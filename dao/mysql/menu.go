package mysql

import (
	"go.study.com/hina/giligili/models"
)

func GetMenuTreeSet(status int8) (data []*models.SysMenu, err error) {
	err = db.Where("status = ?", status).Find(&data).Error
	return
}

func GetRoleMenuTree(status int8, pk int64) (data *models.SysRole, err error) {
	data = new(models.SysRole)
	err = db.Where("status = ? and role_id = ?", status, pk).Preload("Menus").First(data).Error
	return
}

func GetMenus() (data []*models.SysMenu, err error) {
	err = db.Find(&data).Error
	return
}

func CreateMenus(menu *models.SysMenu) (data *models.SysMenu, err error) {
	err = db.Create(menu).Error
	return menu, err
}

func GetOneMenu(pk int64) (data *models.SysMenu, err error) {
	err = db.Where("id = ?", pk).First(&data).Error
	return
}

func UpdateMenu(menu *models.SysMenu, pk int64) (data *models.SysMenu, err error) {
	err = db.Where("id = ?", pk).First(&models.SysMenu{}).
		Select("MenuType", "Icon", "Name", "OrderNum", "IsFrame", "Visible",
			"WebPath", "ComponentPath", "InterfacePath", "InterfaceMethod", "Perms", "Status").
		Updates(menu).Error
	return menu, err
}

func DeleteMenu(pk int64) (err error) {
	err = db.Where("id = ?", pk).Delete(&models.SysMenu{}).Error
	return
}
