package response

import "go.study.com/hina/giligili/models"

type ResUser struct {
	models.SysUser
	Role []models.SysRole `json:"role"`
	Dept models.SysDept   `json:"dept"`
}



type ResInfoData struct {
	Permissions []string `json:"permissions"`
	Roles       []string `json:"roles"`
	User        ResUser  `json:"user"`
}

type PageResult struct {
	List     interface{} `json:"list"`
	Total    int64       `json:"total"`
	Page     int         `json:"page"`
	PageSize int         `json:"pageSize"`
}

type Meta struct {
	Title   string `json:"title"`
	Icon    string `json:"icon"`
	NoCache bool   `json:"noCache"`
}

type ResRouterData struct {
	ID        uint   `json:"id"`
	Name      string `json:"name"`
	Path      string `json:"path"`
	OrderNum  int8   `json:"orderNum"`
	Hinden    bool   `json:"hinden"`
	Redirect  string `json:"redirect"`
	Component string `json:"component"`
	Meta      Meta   `json:"meta"`
	ParentId  int8   `json:"parentId"`
}



