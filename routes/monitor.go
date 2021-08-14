package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/middlewares"
)

func InitMonitorRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("monitor")
	{
		BaseRouter.GET("monitor/enabled/", controller.MonitorEnabled)
		BaseRouter.GET("eachserver/", controller.TimerServerInfo)
		BaseRouter.GET("server/", controller.ServerIP)
		BaseRouter.GET("monitor/info/:id/", middlewares.OperateInfo(), controller.ServerInfo)
		BaseRouter.GET("monitor/rate/:id/", middlewares.OperateInfo(), controller.ServerDateInfo)
	}
	return BaseRouter
}
