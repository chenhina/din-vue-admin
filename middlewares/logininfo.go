package middlewares

import (
	"bytes"
	"encoding/json"
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models"
	"io/ioutil"
	"strconv"
	"strings"
)

// LoginInfo 登录日志中间件
func LoginInfo() func(c *gin.Context) {
	return func(c *gin.Context) {
		ip := c.ClientIP()
		userAgent := c.Request.UserAgent()
		ls := strings.Split(userAgent, " ")
		var os string

		if len(ls) > 3 {
			os = fmt.Sprintf("%s %s", strings.Replace(ls[1], "(", "", 1), strings.Replace(ls[3], ".0;", "", 1))
		} else {
			os = ls[0]
		}

		broswer := ls[len(ls)-2]

		writer := responseBodyWriter{
			ResponseWriter: c.Writer,
			body:           &bytes.Buffer{},
		}
		c.Writer = writer
		c.Next()

		loginInfo := &models.SysLoginInfo{
			Browser: broswer,
			IPAddr:  ip,
			OS:      os,
			Status:  true,
		}

		res := writer.body.String()
		resMap := make(map[string]interface{})
		err := json.Unmarshal([]byte(res), &resMap)
		if err != nil {
			return
		}
		code, _ := resMap["code"]
		body, _ := ioutil.ReadAll(c.Request.Body)
		operateInfo := &models.SysOperationLog{
			RequestModular: "登录模块",
			RequestPath:    c.FullPath(),
			RequestBody:    string(body),
			RequestMethod:  c.Request.Method,
			RequestMsg:     "",
			RequestIP:      ip,
			RequestBrowser: broswer,
			RequestOS:      os,
			ResponseCode:   strconv.Itoa(int(code.(float64))),
			JsonResult:     res,
		}
		if code.(float64) == 1000 {
			loginInfo.Msg = "登录成功"
			p := resMap["data"].(map[string]interface{})
			user := p["user"].(map[string]interface{})
			loginInfo.CreatorName = user["username"].(string)
			loginInfo.Status = true
			loginInfo.UserID = int64(user["uid"].(float64))
			operateInfo.CreatorName = user["username"].(string)
			operateInfo.Status = true
		} else {
			loginInfo.Msg = resMap["msg"].(string)
			loginInfo.CreatorName = resMap["data"].(string)
			loginInfo.Status = false
			operateInfo.CreatorName = resMap["data"].(string)
			operateInfo.Status = false
		}
		go logic.CreateLoginInfo(loginInfo, operateInfo)

	}
}

var Modular = map[string]string{"user": "用户管理", "role": "角色管理", "menus": "菜单管理", "dept": "部门管理", "post": "岗位管理",
	"dict": "字典管理", "config": "参数管理", "savefile": "文件管理", "message": "消息通知",
}

// OperateInfo 操作日志中间件
func OperateInfo() func(c *gin.Context) {
	return func(c *gin.Context) {
		writer := responseBodyWriter{
			ResponseWriter: c.Writer,
			body:           &bytes.Buffer{},
		}
		c.Writer = writer
		c.Next()
		ip := c.ClientIP()
		userAgent := c.Request.UserAgent()
		ls := strings.Split(userAgent, " ")
		var os string
		if len(ls) > 3 {
			os = fmt.Sprintf("%s %s", strings.Replace(ls[1], "(", "", 1), strings.Replace(ls[3], ".0;", "", 1))
		} else {
			os = ls[0]
		}
		broswer := ls[len(ls)-2]
		method := c.Request.Method
		if method == "OPTIONS" {
			return
		}
		res := writer.body.String()
		resMap := make(map[string]interface{})
		err := json.Unmarshal([]byte(res), &resMap)
		if err != nil {
			return
		}
		code, _ := resMap["code"]
		body, _ := ioutil.ReadAll(c.Request.Body)
		path := c.FullPath()
		ps := strings.Replace(path, "/admin/", "", 1)
		pathls := strings.Split(ps, "/")
		var modular string
		if len(pathls) > 0 {
			if pathls[0] == "monitor" {
				modular = "系统监控"
			} else {
				modular = Modular[pathls[1]]
			}
		}
		delete(resMap, "data")
		resByte, _ := json.Marshal(resMap)
		operateInfo := &models.SysOperationLog{
			RequestModular: modular,
			RequestPath:    path,
			RequestBody:    string(body),
			RequestMethod:  method,
			RequestMsg:     "",
			RequestIP:      ip,
			RequestBrowser: broswer,
			RequestOS:      os,
			ResponseCode:   strconv.Itoa(int(code.(float64))),
			JsonResult:     string(resByte),
		}
		uid, _ := c.Get(controller.CtxUserIDKey)
		if code.(float64) == 1000 {
			operateInfo.Status = true
		} else {
			operateInfo.Status = false
		}

		go logic.CreateOperateInfo(operateInfo, uid.(int64))

	}
}

// 响应体结构体 可以获取响应体内容
type responseBodyWriter struct {
	gin.ResponseWriter
	body *bytes.Buffer
}

func (r responseBodyWriter) Write(b []byte) (int, error) {
	r.body.Write(b)
	return r.ResponseWriter.Write(b)
}
