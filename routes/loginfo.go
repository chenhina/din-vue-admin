package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/middlewares"
)

func InitSystemLogInfoRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("system").Use(middlewares.CasbinMiddleware())
	{
		BaseRouter.GET("logininfor/", controller.GetLoginInfo)
		BaseRouter.DELETE("logininfor/clean/", controller.CleanLoginInfo)
		BaseRouter.DELETE("logininfor/:id/", controller.DeleteLoginInfo)

		BaseRouter.GET("operation_log/", controller.GetOperateLog)
		BaseRouter.DELETE("operation_log/", controller.CleanOperateLog)
		BaseRouter.DELETE("operation_log/:id/", controller.DeleteOperateLog)
	}
	return BaseRouter
}
