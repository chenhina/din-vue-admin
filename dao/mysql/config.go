package mysql

import (
	"bytes"
	"fmt"
	"go.study.com/hina/giligili/models"
	"strings"
)

func GetConfigSettings(page, size int64, m map[string]string) (data []*models.SysConfigSettings, err error) {
	if len(m) > 0 {
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			key = "config_" + strings.ToLower(strings.Replace(key, "config", "", 1))
			if key == "config_name" || key == "config_key" {
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	} else {
		err = db.Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	}

	return
}

func CreateConfigSettings(config *models.SysConfigSettings) (data *models.SysConfigSettings, err error) {
	err = db.Create(config).Error
	return config, err

}

func GetOneConfigSettings(pk int64) (data *models.SysConfigSettings, err error) {
	err = db.Where("id = ?", pk).First(&data).Error
	return
}

func UpdateConfigSettings(config *models.SysConfigSettings, pk int64) (data *models.SysConfigSettings, err error) {
	err = db.Where("id = ?", pk).First(&models.SysConfigSettings{}).
		Select("UpdatedAt", "Status", "Remark", "ConfigName", "ConfigKey", "ConfigValue", "ConfigType").
		Updates(config).Error
	return config, err
}

func DeleteConfigSettings(ids []string) (err error) {
	err = db.Delete(&models.SysConfigSettings{}, ids).Error
	return
}

func GetSaveFile(m map[string]string) (data []*models.SysSaveFile, err error) {
	if len(m) > 0 {
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			val = "%" + val + "%"
			buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Order("id desc").Find(&data).Error
	} else {
		err = db.Find(&data).Order("id desc").Error
	}

	return
}

func CreateSaveFile(file *models.SysSaveFile) (data *models.SysSaveFile, err error) {
	err = db.Create(file).Error
	return file, err
}

func DeleteSavaFile(ids []string) (err error) {
	err = db.Delete(&models.SysSaveFile{}, ids).Error
	return
}

func GetMessage(m map[string]string) (data []*models.SysMessage, err error) {
	if len(m) > 0 {
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			if key == "title" {
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Preload("User").Find(&data).Error
	} else {
		err = db.Preload("User").Find(&data).Error
	}

	return
}

func CreateMessage(message *models.SysMessage) (data *models.SysMessage, err error) {
	err = db.Create(message).Error
	return message, err
}

func GetOneMessage(pk int64) (data *models.SysMessage, err error) {
	err = db.Where("id = ?", pk).First(&data).Error
	return
}

func UpdateMessage(message *models.SysMessage, pk int64) (data *models.SysMessage, err error) {
	err = db.Where("id = ?", pk).First(&models.SysMessage{}).
		Select("UpdatedAt", "Title", "Content", "MessageType", "Status", "ToPath", "IsReviewed").
		Updates(message).Error
	return message, err
}

func DeleteMessage(ids []string) (err error) {
	err = db.Delete(&models.SysMessage{}, ids).Error
	err = db.Exec(`delete from sys_user_message where sys_message_id in ?`, ids).Error
	return
}
