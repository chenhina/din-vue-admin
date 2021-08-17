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
		BaseRouter.GET("permission/dept/treeselect/", controller.GetDeptTreeSet)
		BaseRouter.GET("permission/dept/roleDeptTreeselect/:id/", controller.GetDeptMenuTree)

		BaseRouter.GET("permission/user/profile/", controller.GetUserProfile)
		BaseRouter.PUT("permission/user/profile/", controller.UpdateUserProfile)
		BaseRouter.PUT("permission/user/profile/updatePwd/", controller.ChangePassword)

	}
	return BaseRouter
}
