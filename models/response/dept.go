package response

import "go.study.com/hina/giligili/models"

type ResRoleDeptTree struct {
	CheckedKeys []int32 `json:"checkedKeys"`
	Depts []*ResDeptSet `json:"depts"`
}


type ResDeptData struct {
	models.SysDept
	Status string `json:"status"`
}