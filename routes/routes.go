package routes

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/controller"
	"go.study.com/hina/giligili/logger"

	"go.study.com/hina/giligili/settings"
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

	r.GET("/", func(c *gin.Context) {
		c.String(http.StatusOK, "Hina")
	})

	r.GET("/version", func(c *gin.Context) {

		c.String(http.StatusOK, settings.Conf.Version)

	})

	v1 := r.Group("/api/v1")
	v1.POST("/ping", controller.Ping)

	{
		v1.POST("/video",controller.CreateVideo)
		v1.GET("/video/:id",controller.DetrieveVideo)
		v1.GET("/videos",controller.ListVideo)
		v1.PUT("/video/:id",controller.UpdateVideo)
		v1.DELETE("/video/:id",controller.DeleteVideo)
	}

	//pprof.Register(r)  // 注册pprof相关路由

	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"msg": 404,
		})
	})

	return r
}
