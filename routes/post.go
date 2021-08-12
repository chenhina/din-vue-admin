package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitPostRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("permission")
	{
		BaseRouter.GET("post/", controller.GetAllPosts)
		BaseRouter.GET("post/:id/", controller.GetOnePost)
		BaseRouter.PUT("post/:id/", controller.UpdatePost)
		BaseRouter.DELETE("post/:id/", controller.DeletePost)
		BaseRouter.POST("post/", controller.CreatePost)
	}
	return BaseRouter
}