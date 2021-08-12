package mysql

import "go.study.com/hina/giligili/models"

func UpdateCasbinApi(oldPath string, newPath string, oldMethod string, newMethod string) error {

	err := db.Table("casbin_rule").Model(&models.CasbinModel{}).Where("v1 = ? AND v2 = ?", oldPath, oldMethod).Updates(map[string]interface{}{
		"v1": newPath,
		"v2": newMethod,
	}).Error
	return err
}