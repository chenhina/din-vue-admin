package routes

import (
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
)

func InitSystemRouter(Router *gin.RouterGroup) (R gin.IRoutes) {
	BaseRouter := Router.Group("system")
	{
		BaseRouter.POST("avatar/",controller.SaveAvatar)
		BaseRouter.GET("config/configKey/sys.user.initPassword/", controller.GetConfigKey)
		BaseRouter.GET("dict/get/type/sys_user_sex/", controller.GetUserSex)
		BaseRouter.GET("dict/get/type/sys_normal_disable/", controller.GetNormalDisable)
		BaseRouter.GET("dict/get/type/sys_show_hide/", controller.GetSysShowHide)
		BaseRouter.GET("dict/get/type/sys_menu_type/", controller.GetSysMenuType)
		BaseRouter.GET("dict/get/type/sys_interface_method/", controller.GetSysInterfaceMethod)
		BaseRouter.GET("dict/get/type/sys_yes_no/", controller.GetSysSysYesNo)
		BaseRouter.GET("dict/get/type/sys_message_push_type/", controller.GetSysMsgType)
		BaseRouter.GET("dict/get/type/sys_message_push_status/", controller.GetSysMsgStatus)

	}
	return BaseRouter
}
