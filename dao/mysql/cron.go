package mysql

import "go.study.com/hina/giligili/models"

func CronTask() {
	var loginData []*models.SysLoginInfo
	var operateData []*models.SysOperationLog
	db.Find(&loginData).Limit(100)
	db.Find(&operateData).Limit(100)
	db.Delete(&loginData)
	db.Delete(&operateData)
}
