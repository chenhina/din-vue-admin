package request

import "go.study.com/hina/giligili/models"

type ReqMenu struct {
	models.SysMenu
	Status string `json:"status"`
	MenuType string `json:"menuType"`
	IsFrame string `json:"isFrame"`

}