package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitDeptRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("permission")
	{
		BaseRouter.GET("dept/", controller.GetAllDepts)
		BaseRouter.GET("dept/exclude/:id/", controller.GetExcludeDepts)
		BaseRouter.GET("dept/:id/", controller.GetOneDept)
		BaseRouter.PUT("dept/:id/", controller.UpdateDept)
		BaseRouter.DELETE("dept/:id", controller.DeleteDept)
		BaseRouter.POST("dept/", controller.CreateDept)
	}
	return BaseRouter
}
