package response

import "go.study.com/hina/giligili/models"

type ResConfigData struct {
	BaseFilter
	Result []*models.SysConfigSettings `json:"results"`
}

type ResSaveFile struct {
	BaseFilter
	Result []*models.SysSaveFile `json:"results"`
}

type ResMessage struct {
	BaseFilter
	Result []*models.SysMessage `json:"results"`
}
