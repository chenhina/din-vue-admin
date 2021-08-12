package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitMenuRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("permission")
	{
		BaseRouter.GET("menus/", controller.GetMenus)
		BaseRouter.GET("menus/:id", controller.GetOneMenu)
		BaseRouter.PUT("menus/:id/", controller.UpdateMenu)
		BaseRouter.DELETE("menus/:id/", controller.DeleteMenu)
		BaseRouter.POST("menus/", controller.CreateMenus)
		BaseRouter.GET("menus/treeselect/", controller.GetMenuTreeSet)
		BaseRouter.GET("menus/roleMenuTreeselect/:id/", controller.GetRoleMenuTree)

	}
	return BaseRouter
}