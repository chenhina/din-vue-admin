package logic

import (
	"fmt"
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"go.study.com/hina/giligili/settings"
	"mime/multipart"
	"strconv"
	"strings"
)

func GetConfigSettings(page, size int64, m map[string]string) (data *response.ResConfigData, err error) {
	configs, err := mysql.GetConfigSettings(page, size, m)
	res := make([]*models.SysConfigSettings, 0, len(configs))
	res = configs
	data = &response.ResConfigData{
		BaseFilter: response.BaseFilter{
			Count:    len(configs),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return
}

func CreateConfigSettings(r *models.SysConfigSettings) (data *models.SysConfigSettings, err error) {
	r.CreatedAt = getTime()
	r.UpdatedAt = getTime()
	return mysql.CreateConfigSettings(r)
}

func GetOneConfigSettings(pk int64) (data *models.SysConfigSettings, err error) {
	return mysql.GetOneConfigSettings(pk)
}

func UpdateConfigSettings(r *models.SysConfigSettings, pk int64) (data *models.SysConfigSettings, err error) {
	r.UpdatedAt = getTime()
	return mysql.UpdateConfigSettings(r, pk)
}

func DeleteConfigSettings(ids []string) (err error) {
	return mysql.DeleteConfigSettings(ids)
}

func GetSaveFile(page, size int64, m map[string]string) (data *response.ResSaveFile, err error) {
	saveFiles, err := mysql.GetSaveFile(m)
	res := make([]*models.SysSaveFile, 0, len(saveFiles))
	if len(saveFiles) > int(page*size) {
		res = saveFiles[(page-1)*size : page*size]
	} else {
		res = saveFiles[(page-1)*size:]
	}
	for _, item := range res {
		item.FileUrl = strings.Replace(item.File, fmt.Sprintf("http://%s:%d", settings.Conf.Host, settings.Conf.Port), "", 1)
	}
	data = &response.ResSaveFile{
		BaseFilter: response.BaseFilter{
			Count:    len(saveFiles),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return
}

func CreateSaveFile(fileName string, fileObj *multipart.FileHeader) (data *models.SysSaveFile, err error) {
	tp := strings.Split(fileObj.Filename, ".")
	style := tp[len(tp)-1]
	file := &models.SysSaveFile{
		BaseModel: models.BaseModel{
			CreatedAt: getTime(),
			UpdatedAt: getTime(),
		},
		Status:  true,
		Name:    fileObj.Filename,
		Type:    style,
		Size:    strconv.Itoa(int(fileObj.Size)),
		Address: "本地存储",
		Source:  "用户上传",
		File:    fmt.Sprintf("%s%d/%s", settings.Conf.Host, settings.Conf.Port, fileName),
	}

	return mysql.CreateSaveFile(file)
}

func DeleteSavaFile(ids []string) (err error) {
	return mysql.DeleteSavaFile(ids)
}

func GetMessage(page, size int64, m map[string]string) (data *response.ResMessage, err error) {
	messages, err := mysql.GetMessage(m)
	res := make([]*models.SysMessage, 0, len(messages))
	if len(messages) > int(page*size) {
		res = messages[(page-1)*size : page*size]
	} else {
		res = messages[(page-1)*size:]
	}
	for _, msg := range res {
		for _, user := range msg.User {
			msg.Users = append(msg.Users, user.ID)
		}
	}
	data = &response.ResMessage{
		BaseFilter: response.BaseFilter{
			Count:    len(messages),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return
}

func CreateMessage(r *request.ReqMessage) (data *models.SysMessage, err error) {
	message := &models.SysMessage{
		BaseModel: models.BaseModel{
			CreatedAt: getTime(),
			UpdatedAt: getTime(),
		},
		Title:       r.Title,
		Content:     r.Content,
		MessageType: r.MessageType,
		Status:      r.Status,
		ToPath:      r.ToPath,
		IsReviewed:  r.IsReviewed,
	}
	return mysql.CreateMessage(message)
}

func GetOneMessage(pk int64) (data *models.SysMessage, err error) {
	return mysql.GetOneMessage(pk)
}

func UpdateMessage(r *request.ReqMessage, pk int64) (data *models.SysMessage, err error) {
	message := &models.SysMessage{
		BaseModel: models.BaseModel{
			UpdatedAt: getTime(),
		},
		Title:       r.Title,
		Content:     r.Content,
		MessageType: r.MessageType,
		Status:      r.Status,
		ToPath:      r.ToPath,
		IsReviewed:  r.IsReviewed,
	}
	return mysql.UpdateMessage(message,pk)

}

func DeleteMessage(ids []string)(err error)  {
	return mysql.DeleteMessage(ids)
}