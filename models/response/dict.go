package response

import "go.study.com/hina/giligili/models"

type BaseFilter struct {
	Count    int    `json:"count"`
	Next     string `json:"next"`
	Previous string `json:"previous"`
}

type ResDictType struct {
	BaseFilter
	Result []*models.SysDictData `json:"results"`
}

type ResDictData struct {
	BaseFilter
	Result []*models.SysDictDetail `json:"results"`
}
