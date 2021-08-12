package mysql

import (
	"bytes"
	"fmt"
	"go.study.com/hina/giligili/models"
	"strings"
)

func GetQueryPosts(page, size int64, m map[string]string) (data []*models.SysPost, err error) {
	if len(m) > 0 {
		var buffer bytes.Buffer
		args := make([]interface{}, 0, len(m))
		for key, val := range m {
			if key == "postCode" || key == "postName" {
				key = "post_" + strings.ToLower(strings.Replace(key, "post", "", 1))
				val = "%" + val + "%"
				buffer.WriteString(fmt.Sprintf("%s like %q and ", key, val))
			} else {
				buffer.WriteString(fmt.Sprintf("%s = ? and ", key))
				args = append(args, val)
			}
		}
		queryByte := buffer.Bytes()
		queryByte = queryByte[:len(queryByte)-4]
		queryStr := string(queryByte)
		err = db.Where(queryStr, args...).Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	} else {
		err = db.Offset(int((page - 1) * size)).Limit(int(size)).Find(&data).Error
	}

	return
}

func CreatePost(post *models.SysPost) (data *models.SysPost, err error) {
	err = db.Create(post).Error
	return post, err
}

func GetOnePost(pk int64) (data *models.SysPost, err error) {
	err = db.Where("id = ?", pk).First(&data).Error
	return
}

func UpdatePost(post *models.SysPost, pk int64) (data *models.SysPost, err error) {
	err = db.Where("id = ?", pk).First(&models.SysPost{}).
		Select("UpdatedAt", "PostName", "PostCode", "PostSort", "Status").
		Updates(post).Error
	return post, err
}

func DeletePost(pk int64) (err error) {
	err = db.Where("id = ?", pk).Delete(&models.SysPost{}).Error
	return
}
