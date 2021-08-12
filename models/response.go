package models

type SysCaptchaResponse struct {
	CodeId  string `json:"code_id"`
	PicPath string `json:"picPath"`
}

type LoginResponse struct {
	User *SysUser `json:"user"`
	Token string `json:"token"`
}
