package response

import "go.study.com/hina/giligili/models"

type ResLoginInfo struct {
	BaseFilter
	Result []*models.SysLoginInfo `json:"results"`
}


type ResOperateInfo struct {
	BaseFilter
	Result []*models.SysOperationLog `json:"results"`
}