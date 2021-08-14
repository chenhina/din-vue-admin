package routes

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/logger"
	"go.study.com/hina/giligili/middlewares"

	"net/http"
)

func SetUp(mode string) *gin.Engine {
	if mode == gin.ReleaseMode {
		gin.SetMode(gin.ReleaseMode) // gin设置成发布模式
	}
	// 初始化gin框架内置的校验器使用的翻译器
	if err := controller.InitTrans("zh"); err != nil {
		fmt.Printf("init validator trans failed, err:%v\n", err)
	}
	r := gin.New()
	r.Use(logger.GinLogger(), logger.GinRecovery(true))
	r.Use(middlewares.Cors())

	r.StaticFS("/media", http.Dir("./media"))

	baseGroup := r.Group("")
	{
		// 登录
		InitBaseRouter(baseGroup)
	}

	homeGroup := r.Group("admin")
	// jwt鉴权与casbin权限管理
	homeGroup.Use(middlewares.JWTAuthMiddleware()).Use(middlewares.CheckRedisToken())
	{
		InitAdminRouter(homeGroup)
		InitSystemRouter(homeGroup)
		InitMonitorRouter(homeGroup)
		InitSystemLogInfoRouter(homeGroup)
	}
	adminGroup := homeGroup.Group("")
	adminGroup.Use(middlewares.OperateInfo()).Use(middlewares.CasbinMiddleware())
	{
		InitUserRouter(adminGroup)
		InitRoleRouter(adminGroup)
		InitMenuRouter(adminGroup)
		InitDeptRouter(adminGroup)
		InitPostRouter(adminGroup)
		InitSystemDictRouter(adminGroup)
		InitSystemConfigRouter(adminGroup)
	}

	//
	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"code": 404,
			"msg":  "这里没有您想要的东西哦",
		})
	})

	return r
}
