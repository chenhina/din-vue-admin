package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitAdminRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("")
	{
		BaseRouter.GET("getInfo/", controller.GetInfo)
		BaseRouter.POST("logout/", controller.Logout)
		BaseRouter.GET("getRouters/", controller.GetRouters)

	}
	return BaseRouter
}
