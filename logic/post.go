package logic

import (
	"go.study.com/hina/giligili/dao/mysql"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/models/response"
	"strconv"
)

func GetPosts(page, size int64, m map[string]string) (data *response.ResPosts, err error) {
	posts, err := mysql.GetQueryPosts(page, size, m)
	d := make([]*response.ResPostResult, 0, len(posts))
	var r *response.ResPostResult
	for _, post := range posts {
		r = &response.ResPostResult{
			SysPost: *post,
			Status:  strconv.Itoa(int(post.Status)),
		}
		d = append(d, r)
	}
	data = &response.ResPosts{
		Count:    len(posts),
		Next:     "",
		Previous: "",
		Result:   d,
	}
	return
}

func CreatePost(r *request.ReqPost) (data *response.ResPostResult, err error) {
	status, err := strconv.ParseInt(r.Status, 10, 64)
	if err != nil {
		return
	}
	post := &models.SysPost{
		BaseModel: models.BaseModel{
			CreatedAt: getTime(),
			UpdatedAt: getTime(),
		},
		PostName: r.PostName,
		PostCode: r.PostCode,
		PostSort: r.PostSort,
		Status:   int8(status),
	}
	post, err = mysql.CreatePost(post)
	data = &response.ResPostResult{
		SysPost: *post,
		Status:  strconv.Itoa(int(post.Status)),
	}
	return
}

func GetOnePost(pk int64) (data *response.ResPostResult, err error) {
	post, err := mysql.GetOnePost(pk)
	data = &response.ResPostResult{
		SysPost: *post,
		Status:  strconv.Itoa(int(post.Status)),
	}
	return
}

func UpdatePost(r *request.ReqPost, pk int64) (data *response.ResPostResult, err error) {
	ststus, err := strconv.ParseInt(r.Status, 10, 64)
	if err != nil {
		return
	}
	post := &models.SysPost{
		BaseModel: models.BaseModel{
			CreatedAt: getTime(),
		},
		PostName: r.PostName,
		PostCode: r.PostCode,
		PostSort: r.PostSort,
		Status:   int8(ststus),
	}
	post, err = mysql.UpdatePost(post, pk)
	data = &response.ResPostResult{
		SysPost: *post,
		Status:  strconv.Itoa(int(post.Status)),
	}
	return
}


func DeletePost(pk int64)(err error)  {
	return mysql.DeletePost(pk)
}