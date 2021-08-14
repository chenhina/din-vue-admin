package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/response"
	"go.study.com/hina/giligili/utils"
)

func GetLoginInfo(page, size int64, m map[string]string) (data *response.ResLoginInfo, err error) {
	loginInfo, err := mysql.GetLoginInfo(m)
	if err != nil {
		return
	}
	res := make([]*models.SysLoginInfo, 0, len(loginInfo))
	if len(loginInfo) > int(page*size) {
		res = loginInfo[(page-1)*size : page*size]
	} else {
		res = loginInfo[(page-1)*size:]
	}
	data = &response.ResLoginInfo{
		BaseFilter: response.BaseFilter{
			Count:    len(loginInfo),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return
}

func GetOperateLog(page, size int64, m map[string]string) (data *response.ResOperateInfo, err error) {
	operateInfo, err := mysql.GetOperateLog(m)
	if err != nil {
		return
	}
	res := make([]*models.SysOperationLog, 0, len(operateInfo))
	if len(operateInfo) > int(page*size) {
		res = operateInfo[(page-1)*size : page*size]
	} else {
		res = operateInfo[(page-1)*size:]
	}
	data = &response.ResOperateInfo{
		BaseFilter: response.BaseFilter{
			Count:    len(operateInfo),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return
}

func DeleteLoginInfo(ids []string) (err error) {
	return mysql.DeleteLoginInfo(ids)
}

func DeleteOperateLog(ids []string) (err error)   {
	return mysql.DeleteOperateLog(ids)
}

func CreateLoginInfo(loginInfo *models.SysLoginInfo, operateInfo *models.SysOperationLog) (err error) {
	location := utils.GetLocation(loginInfo.IPAddr)
	loginInfo.LoginLocation = location
	operateInfo.RequestLocation = location
	loginInfo.CreatedAt = getTime()
	loginInfo.UpdatedAt = getTime()
	operateInfo.CreatedAt = getTime()
	operateInfo.UpdatedAt = getTime()
	if loginInfo.UserID == 0 {
		loginInfo.UserID = mysql.GetUserIDbyUserName(loginInfo.CreatorName)
	}
	err = mysql.CreateLoginInfo(loginInfo)
	err = mysql.CreateOperateInfo(operateInfo)
	return
}

func CreateOperateInfo(operatetion *models.SysOperationLog, uid int64) (err error) {
	operatetion.CreatedAt = getTime()
	operatetion.UpdatedAt = getTime()
	operatetion.RequestLocation = utils.GetLocation(operatetion.RequestIP)
	user, _ := mysql.GetUserByID(uid)
	operatetion.CreatorName = user.Username
	return mysql.CreateOperateInfo(operatetion)
}

func CleanLoginInfo() (err error) {
	return mysql.CleanLoginInfo()
}

func CleanOperateLog()(err error)  {
	return mysql.CleanOperateLog()
}