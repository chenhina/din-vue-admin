package controller

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models/request"
	"strconv"
)

func GetDictType(c *gin.Context) {
	m, err := getUrlQuery(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	page, _ := strconv.ParseInt(m["pageNum"], 10, 64)
	size, _ := strconv.ParseInt(m["pageSize"], 10, 64)
	delete(m, "pageNum")
	delete(m, "pageSize")
	if _, exists := m["page"]; exists {
		delete(m, "page")
	}

	data, err := logic.GetDictType(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取字典数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func CreateDictType(c *gin.Context) {
	r := new(request.ReqDictType)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.CreateDictType(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "操作失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetOneDictType(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetOneDictType(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateDictType(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(request.ReqDictType)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.UpdateDictType(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func DeleteDictType(c *gin.Context) {
	idx := getIDs(c)
	err := logic.DeleteDictType(idx)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

func GetDictData(c *gin.Context) {
	m, err := getUrlQuery(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	page, _ := strconv.ParseInt(m["pageNum"], 10, 64)
	size, _ := strconv.ParseInt(m["pageSize"], 10, 64)
	delete(m, "pageNum")
	delete(m, "pageSize")
	if _, exists := m["page"]; exists {
		delete(m, "page")
	}

	data, err := logic.GetDictData(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取字典数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func CreateDictData(c *gin.Context) {
	r := new(request.ReqDictData)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}

	data, err := logic.CreateDictData(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "操作失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetOneDictData(c *gin.Context)  {
	pk,err := getID(c)
	if err != nil {
		ResponseError(c,CodeInvalidParam)
		return
	}
	data, err := logic.GetOneDictData(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateDictData(c *gin.Context)  {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(request.ReqDictData)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.UpdateDictData(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func DeleteDictData(c *gin.Context)  {
	idx := getIDs(c)
	err := logic.DeleteDictData(idx)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

