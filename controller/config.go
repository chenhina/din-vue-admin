package controller

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/settings"
	"net/url"
	"strconv"
)

func GetConfigSettings(c *gin.Context) {
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

	data, err := logic.GetConfigSettings(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取参数信息失败")
		return
	}
	ResponseSuccess(c, data)
}

func CreateConfigSettings(c *gin.Context) {
	r := new(models.SysConfigSettings)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}

	data, err := logic.CreateConfigSettings(r)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "操作失败")
		return
	}
	ResponseSuccess(c, data)

}

func GetOneConfigSettings(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.GetOneConfigSettings(pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateConfigSettings(c *gin.Context) {
	pk, err := getID(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	r := new(models.SysConfigSettings)
	err = c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.UpdateConfigSettings(r, pk)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改数据失败")
		return
	}
	ResponseSuccess(c, data)
}

func DeleteConfigSettings(c *gin.Context) {
	ids := getIDs(c)
	err := logic.DeleteConfigSettings(ids)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

func DeleteClearCache(c *gin.Context) {
	ResponseErrorWithMsg(c, CodeServerBusy, "敬请等待")
}

func getUrlEncode(m map[string]string) string {
	res := url.Values{}
	for k, v := range m {
		res.Set(k, v)
	}
	return res.Encode()
}

func deepCopy(m map[string]string) map[string]string {
	res := make(map[string]string, len(m))
	for k, v := range m {
		res[k] = v
	}
	return res
}

func GetSaveFile(c *gin.Context) {
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

	data, err := logic.GetSaveFile(page, size, m)
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

func CreateSaveFile(c *gin.Context) {
	//获取文件头
	fileObj, err := c.FormFile("file")
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	fileName := fmt.Sprintf("%s%s", settings.Conf.SaveFilePath, fileObj.Filename)
	err = c.SaveUploadedFile(fileObj, fileName)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "上传文件失败")
		return
	}

	data, err := logic.CreateSaveFile(fileName, fileObj)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "上传文件失败")
	}

	ResponseSuccess(c, data)
}

func DeleteSavaFile(c *gin.Context) {
	ids := getIDs(c)
	err := logic.DeleteSavaFile(ids)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "删除数据失败")
		return
	}
	ResponseSuccess(c, nil)
}

func GetMessage(c *gin.Context) {
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

	data, err := logic.GetMessage(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}

	ResponseSuccess(c, data)
}
