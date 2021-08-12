package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitBaseRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("base")
	{
		BaseRouter.POST("login/", controller.Login)
		BaseRouter.POST("code/", controller.Code)
	}
	return BaseRouter
}
