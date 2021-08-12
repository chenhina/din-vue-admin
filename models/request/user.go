package request

import "go.study.com/hina/giligili/models"

// User register structure
type Register struct {
	Username string  `json:"username" binding:"required"`
	Name     string  `json:"name" binding:"required"`
	Password string  `json:"password" binding:"required"`
	Email    string  `json:"email" binding:"required"`
	Mobile   string  `json:"mobile" binding:"required"`
	Gender   string  `json:"gender" binding:"required"`
	DeptId   uint8   `json:"deptId" binding:"required"`
	IsActive bool    `json:"is_active"`
	Remark   string  `json:"remark" binding:"required"`
	PostIds  []int   `json:"postIds" binding:"required"`
	RoleIds  []uint8 `json:"roleIds" binding:"required"`
}

// Modify password structure
type ReqChangePassword struct {
	Password    string `json:"oldPassword" binding:"required"`    // 密码
	NewPassword string `json:"newPassword" binding:"required"` // 新密码
}

// Modify  user's auth structure
type SetUserAuth struct {
	UserID      int64 `json:"uid" binding:"required"`         // 用户UUID
	AuthorityId int32 `json:"authorityId" binding:"required"` // 角色ID
}

type ReqUpdateUser struct {
	models.SysUser
	PostIds []int `json:"postIds"`
	RoleIds []uint8 `json:"roleIds"`
}

