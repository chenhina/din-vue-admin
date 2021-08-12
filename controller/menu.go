package controller

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models/request"
)

func GetMenuTreeSet(c *gin.Context) {
	status := getStatus(c)
	data, err := logic.GetMenuTreeSet(status)

	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取菜单失败")
		return
	}

	ResponseSuccess(c, data)

}

func GetRoleMenuTree(c *gin.Context) {
	status := getStatus(c)
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetRoleMenuTree(status, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取角色菜单失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetMenus(c *gin.Context) {
	data, err := logic.GetMenus()
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取菜单失败")
		return
	}
	ResponseSuccess(c, data)
}

func CreateMenus(c *gin.Context) {
	r := new(request.ReqMenu)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.CreateMenus(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "创建菜单失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetOneMenu(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetOneMenu(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取该菜单失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateMenu(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(request.ReqMenu)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.UpdateMenu(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改菜单失败")
		return
	}
	ResponseSuccess(c, data)
}

func DeleteMenu(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	err = logic.DeleteMenu(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeInvalidParam, "删除失败")
		return
	}
	ResponseSuccessWithMsg(c, "删除成功", nil)
}
