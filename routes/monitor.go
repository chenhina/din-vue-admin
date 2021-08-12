package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitMonitorRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("monitor")
	{
		BaseRouter.GET("monitor/enabled/", controller.MonitorEnabled)
		BaseRouter.GET("eachserver/", controller.TimerServerInfo)
		BaseRouter.GET("server/", controller.ServerIP)
		BaseRouter.GET("monitor/info/:id/", controller.ServerInfo)
		BaseRouter.GET("monitor/rate/:id/", controller.ServerDateInfo)
	}
	return BaseRouter
}