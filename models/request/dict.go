package request

import "go.study.com/hina/giligili/models"

type ReqDictType struct {
	DictName string `json:"dictName"`
	DictType string `json:"dictType"`
	Remark string `json:"remark"`
	Status string `json:"status"`
}


type ReqDictData struct {
	models.SysDictDetail
	Sort int `json:"sort"`
}