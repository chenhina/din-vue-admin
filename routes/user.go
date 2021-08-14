package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitUserRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("permission")
	{
		BaseRouter.GET("user/", controller.GetAllUsers)
		BaseRouter.POST("user/", controller.CreateUser)
		BaseRouter.PUT("user/:id/", controller.UpdateUser)
		BaseRouter.DELETE("user/:id/", controller.DeleteUser)
		BaseRouter.GET("user/details/", controller.GetPostDept)
		BaseRouter.GET("user/export/", controller.ExportData)
		BaseRouter.GET("user/profile/", controller.GetUserProfile)
		BaseRouter.PUT("user/profile/", controller.UpdateUserProfile)
		BaseRouter.PUT("user/profile/updatePwd/", controller.ChangePassword)
	}
	return BaseRouter
}
