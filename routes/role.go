package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitRoleRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("permission")
	{
		BaseRouter.GET("role/", controller.GetRoles)
		BaseRouter.GET("role/:id/", controller.GetUserRole)
		BaseRouter.PUT("role/:id/", controller.UpdateRole)
		BaseRouter.DELETE("role/:id/", controller.DeleteRole)
		BaseRouter.POST("role/", controller.CreateRole)

	}
	return BaseRouter
}
