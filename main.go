package main

import (
	"context"
	"flag"
	"fmt"
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/dao/redis"
	"go.study.com/hina/giligili/logger"
	"go.study.com/hina/giligili/pkg"
	"go.study.com/hina/giligili/pkg/snowflake"
	"go.study.com/hina/giligili/routes"
	"go.study.com/hina/giligili/settings"
	"go.uber.org/zap"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"
)

// Go Web开发比较通用的脚手架模板

// @title Swagger测试???
// @version 1.0
// @description 接口测试
// @termsOfService http://swagger.io/terms/

// @contact.name Hina
// @contact.url http://www.swagger.io/support
// @contact.email support@swagger.io

// @license.name Apache 2.0
// @license.url http://www.apache.org/licenses/LICENSE-2.0.html

// @host 127.0.0.1
// @BasePath hina/path
func main() {

	//if len(os.Args) < 2 {
	//	fmt.Println("need config filepath. eg: xx config.yaml")
	//	return
	//}

	var filepath string
	flag.StringVar(&filepath, "filepath", "conf/config.yaml", "文件路径")
	// 解析命令行参数
	flag.Parse()

	// 1.加载配置文件(元成配置)
	if err := settings.Init(filepath); err != nil {
		fmt.Printf("init settings failed, err:%#v\n", err)
		return
	}

	// 2.初始化日志
	if err := logger.Init(settings.Conf.LogConfig, settings.Conf.Mode); err != nil {
		fmt.Printf("init logger failed, err:%#v\n", err)
		return
	}
	defer zap.L().Sync()
	zap.L().Debug("logger init success")

	// 3.初始化MySQL连接
	if err := mysql.Init(settings.Conf.MySQLConfig); err != nil {
		fmt.Printf("init mysql failed, err:%#v\n", err)
		return
	}

	//4.初始化Redis连接
	if err := redis.Init(settings.Conf.RedisConfig); err != nil {
		fmt.Printf("init redis failed, err:%#v\n", err)
		return
	}
	defer redis.Close()

	// 初始化分布式ID生成器
	if err := snowflake.Init(settings.Conf.StartTime, settings.Conf.MachineID); err != nil {
		fmt.Printf("init snowflake failed, err:%#v\n", err)
		return
	}

	// 初始化Casbin
	if err := pkg.InitCasbin(); err != nil {
		fmt.Printf("init casbin failed, err:%#v\n", err)
		return
	}

	// 5.注册路由
	r := routes.SetUp(settings.Conf.Mode)

	// 6.启动服务(优雅关机)
	srv := &http.Server{
		Addr:    fmt.Sprintf(":%d", settings.Conf.Port),
		Handler: r,
	}
	go func() {
		// 开启一个goroutine启动服务
		err := srv.ListenAndServe()
		if err != nil && err != http.ErrServerClosed {
			log.Fatalf("listen:%s", err)
		}
	}()

	// 等待中断信号来优雅地关闭服务器，为关闭服务器操作设置一个5秒超时
	quit := make(chan os.Signal, 1) // 创建一个接收信号的通道
	// kill 默认会发送 syscall.SIGTERM 信号
	// kill -2 发送 syscall.SIGINT 信号， 我们常用的Ctrl+C就是触发系统的SIGINT信号
	// kill -9 发送 syscall.SIGKILL 信号，但是不能被捕获，所以不需要添加它
	// signal.Notify把收到的 syscall.SIGINT或syscall.SIGTERM 信号发给quit
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM) // 此处不会阻塞
	<-quit                                               // 阻塞在此，当接收到上述两种信号才会往下执行
	zap.L().Info("Shutdown Server ...")
	// 创建一个5秒超时的context
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	// 5秒内优雅关闭服务(将未处理完的请求处理完再关闭服务),超过5秒就超时退出
	err := srv.Shutdown(ctx)
	if err != nil {
		zap.L().Fatal("Server Shutdown: ", zap.Error(err))
	}

	zap.L().Info("Server exiting")
}
