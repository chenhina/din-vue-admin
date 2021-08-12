package controller

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models/request"
)

func GetDeptTreeSet(c *gin.Context) {
	status := getStatus(c)
	data, err := logic.DeptTreeSet(status)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取部门信息失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetDeptMenuTree(c *gin.Context) {
	status := getStatus(c)
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetDeptMenuTree(status, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取角色部门失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetAllDepts(c *gin.Context) {
	data, err := logic.GetAllDepts()
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取部门信息失败")
		return
	}
	ResponseSuccess(c, data)
}

func CreateDept(c *gin.Context) {
	r := new(request.ReqDeptData)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.CreateDept(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "创建部门失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetOneDept(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetOneDept(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取部门信息失败")
	}
	ResponseSuccess(c, data)
}

func GetExcludeDepts(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetExcludeDept(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取部门信息失败")
	}
	ResponseSuccess(c, data)
}

func UpdateDept(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(request.ReqDeptData)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}

	data, err := logic.UpdateDept(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改部门失败")
		return
	}
	ResponseSuccess(c, data)
}

func DeleteDept(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	err = logic.DeleteDept(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除部门失败")
		return
	}
	ResponseSuccess(c, nil)
}
