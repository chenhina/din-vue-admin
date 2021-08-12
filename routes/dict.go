package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitSystemDictRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("system")
	{
		BaseRouter.GET("dict/type/", controller.GetDictType)
		BaseRouter.GET("dict/type/:id/", controller.GetOneDictType)
		BaseRouter.PUT("dict/type/:id/", controller.UpdateDictType)
		BaseRouter.DELETE("dict/type/:id/", controller.DeleteDictType)
		BaseRouter.POST("dict/type/", controller.CreateDictType)

		BaseRouter.GET("dict/data/", controller.GetDictData)
		BaseRouter.GET("dict/data/:id/", controller.GetOneDictData)
		BaseRouter.PUT("dict/data/:id/", controller.UpdateDictData)
		BaseRouter.DELETE("dict/data/:id/", controller.DeleteDictData)
		BaseRouter.POST("dict/data/", controller.CreateDictData)
	}
	return BaseRouter
}
