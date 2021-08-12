package controller

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models/request"
	"strconv"
)

func GetAllPosts(c *gin.Context) {
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
	data, err := logic.GetPosts(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取用户信息失败")
		return
	}

	ResponseSuccess(c, data)
	return
}

func CreatePost(c *gin.Context) {
	r := new(request.ReqPost)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.CreatePost(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "创建岗位失败")
		return
	}
	ResponseSuccess(c, data)
}

func GetOnePost(c *gin.Context)  {
	pk,err := getID(c)
	if err != nil {
		ResponseError(c,CodeInvalidParam)
		return
	}
	data, err := logic.GetOnePost(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取岗位信息失败")
	}
	ResponseSuccess(c, data)
}

func UpdatePost(c *gin.Context)  {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(request.ReqPost)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.UpdatePost(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改部门失败")
		return
	}
	ResponseSuccess(c, data)
}

func DeletePost(c *gin.Context)  {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	err = logic.DeletePost(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除部门失败")
		return
	}
	ResponseSuccess(c, nil)
}