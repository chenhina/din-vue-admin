package middlewares

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/pkg"
	"go.study.com/hina/giligili/settings"
)

func CasbinMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {

		user_id, exists := c.Get(controller.CtxUserIDKey)
		if !exists {
			controller.ResponseErrorWithMsg(c, controller.CodeNeedLogin, "你有问题")
			c.Abort()
		}
		user, _ := mysql.GetUserByID(user_id.(int64))
		// 获取请求的url
		obj := c.Request.URL.RequestURI()
		// 获取请求方法
		act := c.Request.Method
		// 获取用户的角色
		sub := user.RoleId
		e := pkg.Casbin()
		// 判断策略中是否存在
		success, _ := e.Enforce(sub, obj, act)
		if settings.Conf.Mode == "dev" || success {
			c.Next()
		} else {
			controller.ResponseErrorWithMsg(c, controller.CodeInvalidParam, "权限不足")
			c.Abort()
			return
		}

	}
}

