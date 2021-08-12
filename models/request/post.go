package request

import "go.study.com/hina/giligili/models"

type ReqPost struct {
	models.SysPost
	Status string `json:"status"`
}
