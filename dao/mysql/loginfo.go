package mysql

import (
	"bytes"
	"encoding/json"
	"fmt"
	"go.study.com/hina/giligili/models"
	"gorm.io/gorm"
)

func GetLoginInfo(m map[string]string) (data []*models.SysLoginInfo, err error) {
	if len(m) > 0 {
		m1 := map[string]string{"true": "1", "false": "0"}
		if _, exists := m["status"]; exists {
			m["status"] = m1[m["status"]]
		}
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		var ans map[string][2]string
		for key, val := range m {
			if key == "ipaddr" || key == "userName" {
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else if key == "as" {
				json.Unmarshal([]byte(val), &ans)
				buffer.WriteString(fmt.Sprintf("created_at between %q and %q and ", ans["create_datetime__range"][0], ans["create_datetime__range"][1]))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Order("id desc").Find(&data).Error
	} else {
		err = db.Order("id desc").Find(&data).Error
	}

	return
}

func GetOperateLog(m map[string]string) (data []*models.SysOperationLog, err error) {
	if len(m) > 0 {
		m1 := map[string]string{"true": "1", "false": "0"}
		if _, exists := m["status"]; exists {
			m["status"] = m1[m["status"]]
		}
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		var ans map[string][2]string
		for key, val := range m {
			if key == "request_modular" || key == "creator_name" {
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else if key == "as" {
				json.Unmarshal([]byte(val), &ans)
				buffer.WriteString(fmt.Sprintf("created_at between %q and %q and ", ans["create_datetime__range"][0], ans["create_datetime__range"][1]))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Order("id desc").Find(&data).Error
	} else {
		err = db.Order("id desc").Find(&data).Error
	}

	return
}

func DeleteLoginInfo(ids []string) (err error) {
	err = db.Delete(&models.SysLoginInfo{}, ids).Error
	return
}

func DeleteOperateLog(ids []string) (err error) {
	err = db.Delete(&models.SysOperationLog{}, ids).Error
	return
}

func CreateLoginInfo(loginInfo *models.SysLoginInfo) (err error) {
	err = db.Create(loginInfo).Error
	return
}

func CreateOperateInfo(operateInfo *models.SysOperationLog) (err error) {
	err = db.Create(operateInfo).Error
	return
}

func CleanLoginInfo() (err error) {
	err = db.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.SysLoginInfo{}).Error
	return
}

func CleanOperateLog() (err error) {
	err = db.Session(&gorm.Session{AllowGlobalUpdate: true}).Delete(&models.SysOperationLog{}).Error
	return
}
