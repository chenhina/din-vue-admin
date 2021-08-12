package response

import "go.study.com/hina/giligili/models"

type ResPostResult struct {
	models.SysPost
	Status string `json:"status"`
}

type ResPosts struct {
	Count    int      `json:"count"`
	Next     string    `json:"next"`
	Previous string    `json:"previous"`
	Result   []*ResPostResult `json:"results"`
}