package middlewares

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/dao/redis"
	"go.study.com/hina/giligili/settings"
)

func CheckRedisToken() func(c *gin.Context) {
	return func(c *gin.Context) {
		uid, ok := c.Get(controller.CtxUserIDKey)
		if !ok {
			controller.ResponseErrorWithMsg(c, controller.CodeInvalidToken, "你有问题")
			c.Abort()
			return
		}
		key := fmt.Sprintf("%s%d", settings.Conf.JwtPrefix, uid)
		err := redis.CheckToken(key)
		if err != nil {
			fmt.Println(err)
			controller.ResponseError(c, controller.CodeInvalidToken)
			c.Abort()
			return
		}
		c.Next()
	}
}
