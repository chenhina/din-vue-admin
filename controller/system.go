package controller

import (
	"github.com/gin-gonic/gin"
)

func GetConfigKey(c *gin.Context) {
	status := getStatus(c)
	if status != 1 {
		ResponseErrorWithMsg(c, CodeInvalidParam, "参数错误")
		return
	}
	ResponseSuccessWithMsg(c, "123456", nil)

}

func GetUserSex(c *gin.Context) {
	status := getStatus(c)
	if status != 1 {
		ResponseErrorWithMsg(c, CodeInvalidParam, "参数错误")
		return
	}
	m := make(map[string]interface{}, 3)
	data := make([]map[string]interface{}, 3)
	m["dictLabel"] = "男"
	m["dictValue"] = "0"
	m["is_default"] = false
	data[0] = m
	m1 := make(map[string]interface{}, 3)
	m1["dictLabel"] = "女"
	m1["dictValue"] = "1"
	m1["is_default"] = false
	data[1] = m1
	m2 := make(map[string]interface{}, 3)
	m2["dictLabel"] = "未知"
	m2["dictValue"] = "2"
	m2["is_default"] = true
	data[2] = m2

	ResponseSuccessWithMsg(c, "success", data)

}

func GetNormalDisable(c *gin.Context) {

	d1 := map[string]interface{}{
		"dictLabel":  "正常",
		"dictValue":  "1",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "停用",
		"dictValue":  "0",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 2)
	data[0] = d1
	data[1] = d2

	ResponseSuccess(c, data)

}

func GetSysShowHide(c *gin.Context) {
	d1 := map[string]interface{}{
		"dictLabel":  "显示",
		"dictValue":  "1",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "隐藏",
		"dictValue":  "0",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 2)
	data[0] = d1
	data[1] = d2

	ResponseSuccess(c, data)
}

func GetSysMenuType(c *gin.Context) {
	d1 := map[string]interface{}{
		"dictLabel":  "目录",
		"dictValue":  "0",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "菜单",
		"dictValue":  "1",
		"is_default": false,
	}
	d3 := map[string]interface{}{
		"dictLabel":  "按钮",
		"dictValue":  "2",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 3)
	data[0] = d1
	data[1] = d2
	data[2] = d3

	ResponseSuccess(c, data)
}

func GetSysInterfaceMethod(c *gin.Context) {
	d1 := map[string]interface{}{
		"dictLabel":  "GET",
		"dictValue":  "GET",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "POST",
		"dictValue":  "POST",
		"is_default": false,
	}
	d3 := map[string]interface{}{
		"dictLabel":  "PUT",
		"dictValue":  "PUT",
		"is_default": false,
	}
	d4 := map[string]interface{}{
		"dictLabel":  "PATCH",
		"dictValue":  "PATCH",
		"is_default": false,
	}
	d5 := map[string]interface{}{
		"dictLabel":  "DELETE",
		"dictValue":  "DELETE",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 5)
	data[0] = d1
	data[1] = d2
	data[2] = d3
	data[3] = d4
	data[4] = d5

	ResponseSuccess(c, data)
}

func GetSysSysYesNo(c *gin.Context) {
	d1 := map[string]interface{}{
		"dictLabel":  "是",
		"dictValue":  "Y",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "否",
		"dictValue":  "N",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 2)
	data[0] = d1
	data[1] = d2

	ResponseSuccess(c, data)
}

func GetSysMsgType(c *gin.Context) {
	d1 := map[string]interface{}{
		"dictLabel":  "消息通知",
		"dictValue":  "1",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "文件下发",
		"dictValue":  "2",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 2)
	data[0] = d1
	data[1] = d2

	ResponseSuccess(c, data)
}

func GetSysMsgStatus(c *gin.Context)  {
	d1 := map[string]interface{}{
		"dictLabel":  "待发送",
		"dictValue":  "1",
		"is_default": true,
	}
	d2 := map[string]interface{}{
		"dictLabel":  "已发送",
		"dictValue":  "2",
		"is_default": false,
	}
	data := make([]map[string]interface{}, 2)
	data[0] = d1
	data[1] = d2

	ResponseSuccess(c, data)
}