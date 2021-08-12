package response

import "go.study.com/hina/giligili/models"

type ResMenuSet struct {
	ID uint `json:"id"`
	Label string `json:"label"`
	OrderNum int8 `json:"orderNum"`
	ParentId int8 `json:"parentId"`
}


type ResRoleMenuTree struct {
	CheckedKeys []uint `json:"checkedKeys"`
	Menus []*ResMenuSet `json:"menus"`
}


type ResMenu struct {
	models.SysMenu
	Status string `json:"status"`
	MenuType string `json:"menuType"`
	IsFrame string `json:"isFrame"`
}