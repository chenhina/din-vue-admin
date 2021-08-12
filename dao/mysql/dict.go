package mysql

import (
	"bytes"
	"encoding/json"
	"fmt"
	"go.study.com/hina/giligili/models"
	"strings"
)

func GetDictType(page, size int64, m map[string]string) (data []*models.SysDictData, err error) {
	if len(m) > 0 {
		var ans map[string][2]string
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			if key == "dictName" || key == "dictType" {
				key = "dict_" + strings.ToLower(strings.Replace(key, "dict", "", 1))
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
		err = db.Where(queryStr, args...).Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	} else {
		err = db.Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	}

	return
}

func CreateDictType(dict *models.SysDictData) (data *models.SysDictData, err error) {
	err = db.Create(dict).Error
	return dict, err
}

func GetOneDictType(pk int64) (data *models.SysDictData, err error) {
	err = db.Where("id = ?", pk).First(&data).Error
	return
}

func UpdateDictType(dict *models.SysDictData, pk int64) (data *models.SysDictData, err error) {
	err = db.Where("id = ?", pk).First(&models.SysDictData{}).
		Select("UpdatedAt", "Status", "Remark", "DictName", "DictType").
		Updates(dict).Error
	return dict, err
}

func DeleteDictType(idx []string) (err error) {
	err = db.Delete(&models.SysDictData{}, idx).Error
	return
}

func GetDictData(page, size int64, m map[string]string) (data []*models.SysDictDetail, err error) {
	if dictType, exists := m["dictType"]; exists {
		var dType *models.SysDictData
		if err = db.Where("dict_type = ?", dictType).First(&dType).Error; err != nil {
			return nil, err
		}
		delete(m, "dictType")
		dictTypeID := dType.ID
		if len(m) > 0 {
			var buffer bytes.Buffer
			args := make([]interface{}, 0, len(m))
			for key, val := range m {
				if key == "dictLabel" {
					key = "dict_" + strings.ToLower(strings.Replace(key, "dict", "", 1))
					val = "%" + val + "%"
					buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
				} else {
					buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
					args = append(args, val)
				}
			}
			buffer.WriteString(fmt.Sprintf("%s = ? and ", "dict_data_id"))
			args = append(args, dictTypeID)
			queryByte := buffer.Bytes()
			queryByte = queryByte[:len(queryByte)-4]
			queryStr := string(queryByte)

			err = db.Where(queryStr, args...).Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
		} else {
			err = db.Where("dict_data_id = ?", dictTypeID).Find(&data).Error
		}
	} else {
		err = db.Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	}

	return
}

func CreateDictData(dictDetail *models.SysDictDetail) (data *models.SysDictDetail, err error) {
	err = db.Create(dictDetail).Error
	return dictDetail, err
}

func GetOneDictData(pk int64) (data *models.SysDictDetail, err error) {
	err = db.Where("id = ?", pk).First(&data).Error
	return
}

func UpdateDictData(dictDetail *models.SysDictDetail, pk int64) (data *models.SysDictDetail, err error) {
	err = db.Where("id = ?", pk).First(&models.SysDictDetail{}).
		Select("UpdatedAt", "Status", "Remark", "DictLabel", "DictValue", "Sort", "IsDefault", "DictDataID").
		Updates(dictDetail).Error
	return dictDetail, err
}

func DeleteDictData(ids []string) (err error) {
	err = db.Delete(&models.SysDictDetail{}, ids).Error
	return
}
