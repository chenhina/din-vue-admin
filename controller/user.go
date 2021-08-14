package controller

import (
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"github.com/mojocn/base64Captcha"
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/settings"
	"go.uber.org/zap"
	"strconv"
)

var store = base64Captcha.DefaultMemStore

// Code 验证码接口
func Code(c *gin.Context) {
	//字符,公式,验证码配置
	// 生成默认数字的driver
	driver := base64Captcha.NewDriverDigit(settings.Conf.Captcha.ImgHeight, settings.Conf.Captcha.ImgWidth, settings.Conf.Captcha.KeyLong, 0.7, 80)
	cp := base64Captcha.NewCaptcha(driver, store)
	if id, b64s, err := cp.Generate(); err != nil {
		zap.L().Error("验证码获取失败!", zap.Any("err", err))
		ResponseError(c, CodeInvalidParam)
		return
	} else {
		ResponseSuccess(c, models.SysCaptchaResponse{
			CodeId:  id,
			PicPath: b64s,
		})
	}
}

// Login 用户登录接口
func Login(c *gin.Context) {
	// 1.获取请求参数
	p := new(models.ParamLogin)
	if err := c.ShouldBindJSON(p); err != nil {
		// 请求参数有误 直接返回响应
		zap.L().Error("Login with bad param", zap.Error(err))
		// 判断err是不是validate的错误
		errs, ok := err.(validator.ValidationErrors)
		if !ok {
			ResponseError(c, CodeInvalidParam)
			return
		}
		ResponseErrorWithMsg(c, CodeInvalidParam, removeTopStruct(errs.Translate(trans))) // 翻译错误
		return
	}
	// 2.处理登录的业务逻辑
	data, err := logic.Login(p)
	if err != nil {
		zap.L().Error("logic.Login failed", zap.String("username", p.Username), zap.Error(err))
		if err == logic.ErrorWithCode {
			ResponseErrorWithMsgData(c, CodeInvalidParam, "验证码错误", p.Username)
			return
		}
		ResponseErrorWithData(c, CodeInvalidPassword,p.Username)
		return
	}
	ResponseSuccess(c, data)
}

func GetAllUsers(c *gin.Context) {
	// 获取分页参数
	m := getQuery2Map(c)
	page, _ := strconv.ParseInt(m["pageNum"], 10, 64)
	size, _ := strconv.ParseInt(m["pageSize"], 10, 64)
	delete(m, "pageNum")
	delete(m, "pageSize")
	if _, exists := m["page"]; exists {
		delete(m, "page")
	}

	data, err := logic.GetAllUsers(page, size, m)
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取用户信息失败")
		return
	}

	ResponseSuccess(c, data)
	return

}

func GetPostDept(c *gin.Context) {

	data, err := logic.GetPostRoles()
	id, err := getUseeId(c)
	if err != nil {
		ResponseSuccess(c, data)
		return
	}
	userData, err := logic.GetUserData(id)
	for k, v := range userData {
		data[k] = v
	}
	ResponseSuccess(c, data)

}

func CreateUser(c *gin.Context) {
	u := new(request.Register)
	err := c.ShouldBindJSON(u)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	data, err := logic.CreateUser(u)
	if err != nil {
		if err == mysql.ErrorUserExist {
			ResponseError(c, CodeUserExist)
			return
		}
		ResponseErrorWithMsg(c, CodeServerBusy, "创建用户失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateUser(c *gin.Context) {
	pkStr := c.Param("id")
	pk, err := strconv.ParseInt(pkStr, 10, 64)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	d := new(request.ReqUpdateUser)
	err = c.ShouldBindJSON(d)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}

	data, err := logic.UpdateUser(pk, d)
	if err != nil {
		ResponseError(c, CodeServerBusy)
		return
	}
	ResponseSuccess(c, data)

}

func DeleteUser(c *gin.Context) {
	pkStr := c.Param("id")
	pk, err := strconv.ParseInt(pkStr, 10, 64)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	uid, exists := c.Get(CtxUserIDKey)
	if !exists {
		ResponseErrorWithMsg(c, CodeInvalidParam, "你有问题")
		return
	}

	err = logic.DeleteUser(uint(pk), uid.(int64))
	if err != nil {
		ResponseErrorWithMsg(c, CodeInvalidParam, "删除失败")
		return
	}
	ResponseSuccessWithMsg(c, "删除成功", nil)
}

func GetUserProfile(c *gin.Context) {
	uid, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseErrorWithMsg(c, CodeInvalidParam, "你有问题")
		return
	}
	data, err := logic.GetUserProfile(uid.(int64))
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "获取信息失败")
		return
	}
	ResponseSuccess(c, data)
}

func UpdateUserProfile(c *gin.Context) {
	r := new(request.ReqUpdateUser)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	uid, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseErrorWithMsg(c, CodeInvalidParam, "你有问题")
		return
	}
	err = mysql.CheckUserExist(r.Username)
	if err != nil {
		ResponseErrorWithMsg(c, CodeInvalidParam, "用户名已存在")
		return
	}
	data, err := logic.UpdateUserProfile(r, uid.(int64))
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改个人信息失败")
		return
	}
	ResponseSuccess(c, data)
}

func ChangePassword(c *gin.Context) {
	r := new(request.ReqChangePassword)
	err := c.ShouldBindJSON(r)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	uid, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseErrorWithMsg(c, CodeInvalidParam, "你有问题")
		return
	}
	err = logic.ChangePassword(r, uid.(int64))
	if err != nil {
		ResponseErrorWithMsg(c, CodeServerBusy, "修改密码失败")
		return
	}
	ResponseSuccess(c, nil)
}
