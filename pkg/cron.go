package pkg

import (
	"github.com/robfig/cron"
	"go.study.com/hina/giligili/dao/mysql"
	"go.uber.org/zap"
)

//
func Task() {
	cron2 := cron.New() //创建一个cron实例
	//执行定时任务（每天0点执行一次）
	err := cron2.AddFunc("0 0 0 */1 * *", mysql.CronTask)
	if err != nil {
		zap.L().Error("start task failed")
		return
	}
	//启动/关闭
	cron2.Start()
	defer cron2.Stop()
	select {
	//查询语句，保持程序运行，在这里等同于for{}
	}
}

//执行函数
//func print5() {
//	fmt.Println("每5s执行一次cron")
//}
