package models

type ExportUser struct {
	ID       uint   `json:"id"`
	UserName string `json:"userName"`
	Name     string `json:"name"`
	Email    string `json:"email"`
	Mobile   string `json:"mobile"`
	Gender   string `json:"gender"`
	IsActive string `json:"is_active"`
	DeptName string `json:"deptName"`
	Leader   string `json:"leader"`
}
