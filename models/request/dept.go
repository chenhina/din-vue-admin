package request

import "go.study.com/hina/giligili/models"

type ReqDeptData struct {
	models.SysDept
	Status string `json:"status"`
}
