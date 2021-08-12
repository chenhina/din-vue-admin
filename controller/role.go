package controller

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models/request"
	"strconv"
)

func GetRoles(c *gin.Context) {
	// 获取分页参数
	m,err := getUrlQuery(c)
	if err != nil {
		ResponseError(c,CodeInvalidParam)
		return
	}
	page, _ := strconv.ParseInt(m["pageNum"], 10, 64)
	size, _ := strconv.ParseInt(m["pageSize"], 10, 64)
	delete(m, "pageNum")
	delete(m, "pageSize")
	if _, exists := m["page"]; exists {
		delete(m, "page")
	}
	data, err := logic.GetRoles(page, size,m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取用户信息失败")
		return
	}

	ResponseSuccess(c, data)
	return

}

func GetUserRole(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetUserRole(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取角色信息失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateRole(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(request.ReqRole)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.UpdateRole(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改角色失败")
	}
	ResponseSuccess(c, data)

}

func DeleteRole(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	err = logic.DeleteRole(int32(pk))
	if err != nil {
		ResponseErrorWithMsg(c, CodeInvalidParam, "删除失败")
		return
	}
	ResponseSuccessWithMsg(c, "删除成功", nil)

}

func CreateRole(c *gin.Context) {
	r := new(request.ReqRole)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.CreateRole(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "创建失败")
	}
	ResponseSuccess(c, data)
}
