package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"strconv"
)

func DeptTreeSet(status int8) (data []*response.ResDeptSet, err error) {
	deptList, err := mysql.DeptTreeSet(status)
	data = make([]*response.ResDeptSet, 0, len(deptList))
	var detp *response.ResDeptSet
	for _, v := range deptList {
		detp = &response.ResDeptSet{
			ID:       v.DeptId,
			Label:    v.DeptName,
			ParentId: v.ParentId,
			Status:   v.Status,
		}
		data = append(data, detp)
	}
	return
}

func GetDeptMenuTree(status int8, pk int64) (data *response.ResRoleDeptTree, err error) {
	role, err := mysql.GetRoleDeptTree(status, pk)
	depts, err := DeptTreeSet(status)
	checkedKeys := make([]int32, 0, len(role.Depts))
	for _, m := range role.Depts {
		checkedKeys = append(checkedKeys, m.DeptId)
	}
	data = &response.ResRoleDeptTree{
		CheckedKeys: checkedKeys,
		Depts:       depts,
	}
	return
}

func GetAllDepts() (data []*response.ResDeptData, err error) {
	depts, err := mysql.GetAllDepts()
	data = make([]*response.ResDeptData, 0, len(depts))
	var d *response.ResDeptData
	for _, dept := range depts {
		d = &response.ResDeptData{
			SysDept: *dept,
			Status:  strconv.Itoa(int(dept.Status)),
		}
		data = append(data, d)
	}
	return
}

func CreateDept(r *request.ReqDeptData) (data *response.ResDeptData, err error) {
	ststus, err := strconv.ParseInt(r.Status, 10, 64)
	if err != nil {
		return
	}
	dept := &models.SysDept{
		CreatedAt: getTime(),
		UpdatedAt: getTime(),
		DeptName:  r.DeptName,
		Leader:    r.Leader,
		Phone:     r.Phone,
		Email:     r.Email,
		OrderNum:  r.OrderNum,
		ParentId:  r.ParentId,
		Status:    int8(ststus),
	}
	dept, err = mysql.CreateDept(dept)
	data = &response.ResDeptData{
		SysDept: *dept,
		Status:  strconv.Itoa(int(dept.Status)),
	}
	return
}

func GetOneDept(pk int64) (data *response.ResDeptData, err error) {
	dept, err := mysql.GetOneDept(pk)
	data = &response.ResDeptData{
		SysDept: *dept,
		Status:  strconv.Itoa(int(dept.Status)),
	}
	return
}

func GetExcludeDept(pk int64) (data []*response.ResDeptData, err error) {
	dept, err := mysql.GetOneDept(pk)
	if err != nil {
		return
	}
	depts, err := mysql.GetExcludeDept(dept.ParentId)
	data = make([]*response.ResDeptData, 0, len(depts))
	var d *response.ResDeptData
	for _, dept := range depts {
		d = &response.ResDeptData{
			SysDept: *dept,
			Status:  strconv.Itoa(int(dept.Status)),
		}
		data = append(data, d)
	}
	return
}

func UpdateDept(r *request.ReqDeptData, pk int64) (data *response.ResDeptData, err error) {
	ststus, err := strconv.ParseInt(r.Status, 10, 64)
	if err != nil {
		return
	}
	dept := &models.SysDept{
		UpdatedAt: getTime(),
		DeptName:  r.DeptName,
		Leader:    r.Leader,
		Phone:     r.Phone,
		Email:     r.Email,
		OrderNum:  r.OrderNum,
		ParentId:  r.ParentId,
		Status:    int8(ststus),
	}
	dept, err = mysql.UpdateDept(dept, pk)
	data = &response.ResDeptData{
		SysDept: *dept,
		Status:  strconv.Itoa(int(dept.Status)),
	}
	return
}

func DeleteDept(pk int64)(err error)  {
	return mysql.DeleteDept(pk)
}