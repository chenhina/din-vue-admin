package response

import "go.study.com/hina/giligili/models"

type ResResult struct {
	models.SysRole
	Dept []int32 `json:"dept"`
	Menu []uint  `json:"menu"`
}

type ResRoles struct {
	Count    int      `json:"count"`
	Next     string    `json:"next"`
	Previous string    `json:"previous"`
	Result   []*ResResult `json:"results"`
}


