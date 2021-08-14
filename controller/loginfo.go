package controller

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"strconv"
)



func GetLoginInfo(c *gin.Context)  {
	m, err := getUrlQuery(c)
	nextM := deepCopy(m)
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

	data, err := logic.GetLoginInfo(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}
	if int(page*size) > data.Count {
		data.Previous = ""
	} else {
		nextM["pageNum"] = fmt.Sprintf("%d", page+1)
		data.Previous = fmt.Sprintf("http://%s%s%s", c.Request.Host, c.FullPath(), getUrlEncode(nextM))
	}
	ResponseSuccess(c, data)
}

func GetOperateLog(c *gin.Context)  {
	m, err := getUrlQuery(c)
	nextM := deepCopy(m)
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

	data, err := logic.GetOperateLog(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}
	if int(page*size) > data.Count {
		data.Previous = ""
	} else {
		nextM["pageNum"] = fmt.Sprintf("%d", page+1)
		data.Previous = fmt.Sprintf("http://%s%s%s", c.Request.Host, c.FullPath(), getUrlEncode(nextM))
	}
	ResponseSuccess(c, data)
}

func DeleteLoginInfo(c *gin.Context)  {
	ids := getIDs(c)
	err := logic.DeleteLoginInfo(ids)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

func CleanLoginInfo(c *gin.Context)  {
	err := logic.CleanLoginInfo()
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

func CleanOperateLog(c *gin.Context)  {
	err := logic.CleanOperateLog()
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

func DeleteOperateLog(c *gin.Context)  {
	ids := getIDs(c)
	err := logic.DeleteOperateLog(ids)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}