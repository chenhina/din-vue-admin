package request

import "go.study.com/hina/giligili/models"

type ReqRole struct {
	models.SysRole
	Menu              []int  `json:"menu"`
	Dept              []int  `json:"dept"`
	DeptCheckStrictly bool   `json:"deptCheckStrictly"`
	MenuCheckStrictly bool   `json:"menuCheckStrictly"`
	Status            string `json:"status"`
}
