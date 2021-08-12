package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"strconv"
)

func GetDictType(page, size int64, m map[string]string) (data *response.ResDictType, err error) {
	dicts, err := mysql.GetDictType(page, size, m)
	res := make([]*models.SysDictData, 0, len(dicts))
	res = dicts
	data = &response.ResDictType{
		BaseFilter: response.BaseFilter{
			Count:    len(dicts),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return
}

func CreateDictType(r *request.ReqDictType) (data *models.SysDictData, err error) {
	dict := &models.SysDictData{
		NewModel: models.NewModel{
			BaseModel: models.BaseModel{
				CreatedAt: getTime(),
				UpdatedAt: getTime(),
			},
			Status: r.Status,
			Remark: r.Remark,
		},
		DictName: r.DictName,
		DictType: r.DictType,
	}
	return mysql.CreateDictType(dict)

}

func GetOneDictType(pk int64) (data *models.SysDictData, err error) {
	return mysql.GetOneDictType(pk)
}

func UpdateDictType(r *request.ReqDictType, pk int64) (data *models.SysDictData, err error) {
	dict := &models.SysDictData{
		NewModel: models.NewModel{
			BaseModel: models.BaseModel{
				UpdatedAt: getTime(),
			},
			Status: r.Status,
			Remark: r.Remark,
		},
		DictName: r.DictName,
		DictType: r.DictType,
	}
	return mysql.UpdateDictType(dict, pk)
}

func DeleteDictType(idx []string) (err error) {
	return mysql.DeleteDictType(idx)
}

func GetDictData(page, size int64, m map[string]string) (data *response.ResDictData, err error) {
	dictData, err := mysql.GetDictData(page, size, m)
	res := make([]*models.SysDictDetail, 0, len(dictData))
	res = dictData
	data = &response.ResDictData{
		BaseFilter: response.BaseFilter{
			Count:    len(dictData),
			Next:     "",
			Previous: "",
		},
		Result: res,
	}
	return

}

func CreateDictData(r *request.ReqDictData) (data *models.SysDictDetail, err error) {
	if err != nil {
		return nil, err
	}
	dictDetail := &models.SysDictDetail{
		NewModel: models.NewModel{
			BaseModel: models.BaseModel{
				CreatedAt: getTime(),
				UpdatedAt: getTime(),
			},
			Status: r.Status,
			Remark: r.Remark,
		},
		DictLabel:  r.DictLabel,
		DictValue:  r.DictValue,
		Sort:       strconv.Itoa(r.Sort),
		IsDefault:  r.IsDefault,
		DictDataID: r.DictDataID,
	}

	return mysql.CreateDictData(dictDetail)

}

func GetOneDictData(pk int64) (data *models.SysDictDetail, err error) {
	return mysql.GetOneDictData(pk)
}

func UpdateDictData(r *request.ReqDictData, pk int64) (data *models.SysDictDetail, err error) {
	dictDetail := &models.SysDictDetail{
		NewModel: models.NewModel{
			BaseModel: models.BaseModel{
				UpdatedAt: getTime(),
			},
			Status: r.Status,
			Remark: r.Remark,
		},
		DictLabel:  r.DictLabel,
		DictValue:  r.DictValue,
		Sort:       strconv.Itoa(r.Sort),
		IsDefault:  r.IsDefault,
		DictDataID: r.DictDataID,
	}
	return mysql.UpdateDictData(dictDetail, pk)
}

func DeleteDictData(idx []string) (err error) {
	return mysql.DeleteDictData(idx)
}

