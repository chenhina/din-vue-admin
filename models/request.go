package models






type ParamLogin struct {
	Username string `json:"username" form:"username" binding:"required"`
	Password string `json:"password" form:"passwrod" binding:"required"`
	Code string `json:"code" form:"code" binding:"required"`
	CodeId string `json:"code_id" binding:"required"` // 验证码ID
}




// Casbin info structure
type CasbinInfo struct {
	Path   string `json:"path"`   // 路径
	Method string `json:"method"` // 方法
}