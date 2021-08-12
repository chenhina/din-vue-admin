package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"strconv"
)

func GetMenuTreeSet(status int8) (data []*response.ResMenuSet, err error) {
	menus, err := mysql.GetMenuTreeSet(status)
	var m *response.ResMenuSet
	data = make([]*response.ResMenuSet, 0, len(menus))
	for _, menu := range menus {
		m = &response.ResMenuSet{
			ID:       menu.ID,
			Label:    menu.Name,
			OrderNum: menu.OrderNum,
			ParentId: menu.ParentId,
		}
		data = append(data, m)
	}
	return

}

func GetRoleMenuTree(status int8, pk int64) (data *response.ResRoleMenuTree, err error) {
	role, err := mysql.GetRoleMenuTree(status, pk)
	menus, err := GetMenuTreeSet(status)
	checkedKeys := make([]uint, 0, len(role.Menus))
	for _, m := range role.Menus {
		checkedKeys = append(checkedKeys, m.ID)
	}
	data = &response.ResRoleMenuTree{
		CheckedKeys: checkedKeys,
		Menus:       menus,
	}
	return
}

func GetMenus() (data []*models.SysMenu, err error) {
	return mysql.GetMenus()
}

func parseStatus(s string) int64 {
	i, _ := strconv.ParseInt(s, 10, 64)
	return i
}

func CreateMenus(r *request.ReqMenu) (data *models.SysMenu, err error) {
	mt := parseStatus(r.MenuType)
	m := map[string]bool{"1": true, "0": false}
	menu := &models.SysMenu{
		BaseModel: models.BaseModel{
			CreatedAt: getTime(),
			UpdatedAt: getTime(),
		},
		MenuType:        int8(mt),
		Icon:            r.Icon,
		Name:            r.Name,
		OrderNum:        r.OrderNum,
		IsFrame:         m[r.IsFrame],
		WebPath:         r.WebPath,
		ComponentPath:   r.ComponentPath,
		InterfacePath:   r.InterfacePath,
		InterfaceMethod: r.InterfaceMethod,
		Perms:           r.Perms,
		Status:          int8(parseStatus(r.Status)),
	}
	data, err = mysql.CreateMenus(menu)
	return

}

func GetOneMenu(pk int64) (data *response.ResMenu, err error) {
	menu, err := mysql.GetOneMenu(pk)
	m := map[bool]string{true: "1", false: "0"}
	data = &response.ResMenu{
		SysMenu:  *menu,
		Status:   strconv.Itoa(int(menu.Status)),
		MenuType: strconv.Itoa(int(menu.MenuType)),
		IsFrame:  m[menu.IsFrame],
	}
	return
}

func UpdateMenu(r *request.ReqMenu, pk int64) (data *response.ResMenu, err error) {
	mt := parseStatus(r.MenuType)
	m1 := map[bool]string{true: "1", false: "0"}
	m := map[string]bool{"1": true, "0": false}
	mu := &models.SysMenu{
		BaseModel: models.BaseModel{
			UpdatedAt: getTime(),
		},
		MenuType:        int8(mt),
		Icon:            r.Icon,
		Visible:         r.Visible,
		Name:            r.Name,
		OrderNum:        r.OrderNum,
		IsFrame:         m[r.IsFrame],
		WebPath:         r.WebPath,
		ComponentPath:   r.ComponentPath,
		InterfacePath:   r.InterfacePath,
		InterfaceMethod: r.InterfaceMethod,
		Perms:           r.Perms,
		Status:          int8(parseStatus(r.Status)),
	}
	menu, err := mysql.UpdateMenu(mu, pk)
	data = &response.ResMenu{
		SysMenu:  *menu,
		Status:   strconv.Itoa(int(menu.Status)),
		MenuType: strconv.Itoa(int(menu.MenuType)),
		IsFrame:  m1[menu.IsFrame],
	}
	return
}

func DeleteMenu(pk int64) error {
	return mysql.DeleteMenu(pk)
}
