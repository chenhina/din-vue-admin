package controller

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/settings"
	"strconv"
	"strings"
)

func GetInfo(c *gin.Context) {

	userId, _ := c.Get(CtxUserIDKey)
	data, err := logic.GetInfo(userId.(int64))
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取数据失败")
		return
	}

	ResponseSuccess(c, data)

}

func GetRouters(c *gin.Context) {
	userId, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseError(c, CodeInvalidToken)
		return
	}
	data, err := logic.GetRouters(userId.(int64))
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取路由失败")
		return
	}
	ResponseSuccess(c, data)
}

func Logout(c *gin.Context) {
	uid, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseErrorWithMsg(c, CodeInvalidToken, "你有问题")
		return
	}
	err := logic.Logout(uid)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "登出失败")
	}
	ResponseSuccess(c, nil)
}

func SaveAvatar(c *gin.Context) {
	uid, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseErrorWithMsg(c, CodeInvalidParam, "你有问题")
		return
	}
	//获取文件头
	fileObj, err := c.FormFile("file")
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	user, err := logic.GetUserByUserID(uid.(int64))
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	astr := strings.Split(strings.Replace(user.Avatar, "/media/avatar/", "", 1), ".")[0]
	aid, err := strconv.ParseInt(astr, 10, 64)
	if aid == 0 || err != nil {
		aid = -user.UserID
	}
	fileName := fmt.Sprintf("%s%d%s", settings.Conf.AvatarPath, -aid, ".jpg")

	err = c.SaveUploadedFile(fileObj, fileName)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "上传头像失败")
		return
	}
	err = logic.SaveAvatar(uid.(int64), fileName)
	ResponseSuccess(c, map[string]string{"file_url": strings.Replace(fileName, ".", "", 1)})
}
