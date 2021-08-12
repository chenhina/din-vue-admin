package mysql

import "go.study.com/hina/giligili/models"

func GetRoleDeptTree(status int8, pk int64) (data *models.SysRole, err error) {
	data = new(models.SysRole)
	err = db.Where("status = ? and role_id = ?", status, pk).Preload("Depts").First(data).Error
	return
}

func GetAllDepts() (data []*models.SysDept, err error) {
	err = db.Find(&data).Error
	return
}

func CreateDept(dept *models.SysDept) (data *models.SysDept, err error) {
	err = db.Create(dept).Error
	return dept, err

}

func GetOneDept(pk int64) (data *models.SysDept, err error) {
	err = db.Where("dept_id = ?", pk).First(&data).Error
	return
}

func GetExcludeDept(parentID int8) (data []*models.SysDept, err error) {
	err = db.Where("parent_id != ?", parentID).Find(&data).Error
	return
}

func UpdateDept(dept *models.SysDept, pk int64) (data *models.SysDept, err error) {
	err = db.Where("dept_id = ?", pk).First(&models.SysDept{}).
		Select("UpdatedAt", "DeptName", "Leader", "Phone", "Email", "OrderNum", "ParentId", "Status").
		Updates(dept).Error
	return dept, err
}

func DeleteDept(pk int64) (err error) {
	err = db.Where("dept_id = ?", pk).Delete(&models.SysDept{}).Error
	return
}
