package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitSystemConfigRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("system")
	{
		BaseRouter.GET("config/", controller.GetConfigSettings)
		BaseRouter.DELETE("config/clearCache/", controller.DeleteClearCache)
		BaseRouter.GET("config/:id/", controller.GetOneConfigSettings)
		BaseRouter.PUT("config/:id/", controller.UpdateConfigSettings)
		BaseRouter.DELETE("config/:id/", controller.DeleteConfigSettings)
		BaseRouter.POST("config/", controller.CreateConfigSettings)

		BaseRouter.GET("savefile/",controller.GetSaveFile)
		BaseRouter.POST("savefile/",controller.CreateSaveFile)
		BaseRouter.DELETE("savefile/:id/",controller.DeleteSavaFile)

		BaseRouter.GET("message/",controller.GetMessage)
		BaseRouter.GET("message/:id/",controller.GetOneMessage)
		BaseRouter.PUT("message/:id/",controller.UpdateMessage)
		BaseRouter.DELETE("message/:id/",controller.DeleteMessage)
		BaseRouter.POST("message/",controller.CreateMessage)
	}
	return BaseRouter
}
