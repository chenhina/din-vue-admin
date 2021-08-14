package models

type NewModel struct {
	BaseModel
	Status string `json:"status" gorm:"commen:字典状态"`
	Remark string `json:"remark" gorm:"commen:备注"`
}

type SysDictData struct {
	NewModel
	DictName string `json:"dictName" gorm:"commen:字典名称"`
	DictType string `json:"dictType" gorm:"commen:字典类型"`
}

type SysDictDetail struct {
	NewModel
	DictLabel  string      `json:"dictLabel" gorm:"commen:字典标签"`
	DictValue  string      `json:"dictValue" gorm:"commen:字典键值"`
	Sort       string      `json:"sort" gorm:"commen:字典排序"`
	IsDefault  bool        `json:"is_default" gorm:"commen:字典名称"`
	DictData   SysDictData `json:"dict_datas" gorm:"foreignKey:DictDataID;comment:关联字典数据"`
	DictDataID int         `json:"dict_data" gorm:"comment:关联字典数据"`
}

type SysConfigSettings struct {
	NewModel
	ConfigName  string `json:"configName" gorm:"common:参数名称"`
	ConfigKey   string `json:"configKey" gorm:"common:参数键名"`
	ConfigValue string `json:"configValue" gorm:"common:参数键值"`
	ConfigType  string `json:"configType" gorm:"common:是否内置"`
}

type SysSaveFile struct {
	BaseModel
	Status  bool   `json:"status" gorm:"common:文件是否存在"`
	Name    string `json:"name" gorm:"common:文件名称"`
	Type    string `json:"type" gorm:"common:文件类型"`
	Size    string `json:"size" gorm:"common:文件大小"`
	Address string `json:"address" gorm:"common:存储位置"`
	Source  string `json:"source" gorm:"common:文件来源"`
	OssUrl  string `json:"oss_url" gorm:"common:OSS地址"`
	File    string `json:"file" gorm:"common:文件URL"`
	FileUrl string `json:"file_url" gorm:"-"`
}

type SysMessage struct {
	BaseModel
	Title       string    `json:"title" gorm:"common:通知标题"`
	Content     string    `json:"content" gorm:"common:通知内容"`
	MessageType string    `json:"message_type" gorm:"common:通知类型"`
	Status      string    `json:"status" gorm:"common:通知状态"`
	ToPath      string    `json:"to_path" gorm:"common:跳转路径"`
	IsReviewed  bool      `json:"is_reviewed" gorm:"common:是否审核"`
	User        []SysUser `json:"users" gorm:"many2many:sys_user_message"`
	Users       []uint    `json:"user" gorm:"-"`
}

type SysLoginInfo struct {
	BaseModel
	UserID        int64  `json:"user_id" gorm:"common:用户id"`
	CreatorName   string `json:"creator_name" gorm:"column:userName"`
	Browser       string `json:"browser" gorm:"common:浏览器"`
	IPAddr        string `json:"ipaddr" gorm:"column:ipaddr;common:IP地址"`
	LoginLocation string `json:"loginLocation" gorm:"common:登录位置"`
	Msg           string `json:"msg" gorm:"common:操作信息"`
	OS            string `json:"os" gorm:"common:操作系统"`
	Status        bool   `json:"status" gorm:"deatult:false;common:登录状态"`
}

type SysOperationLog struct {
	BaseModel
	CreatorName     string `json:"creator_name" gorm:"操作人员"`
	RequestModular  string `json:"request_modular" gorm:"common:请求模块"`
	RequestPath     string `json:"request_path" gorm:"common:请求地址"`
	RequestBody     string `json:"request_body" gorm:"type:text;common:请求参数"`
	RequestMethod   string `json:"request_method" gorm:"common:请求方式"`
	RequestMsg      string `json:"request_msg" gorm:"common:操作说明"`
	RequestIP       string `json:"request_ip" gorm:"common:请求IP地址"`
	RequestBrowser  string `json:"request_browser" gorm:"common:请求浏览器"`
	RequestLocation string `json:"request_location" gorm:"common:操作地点"`
	RequestOS       string `json:"request_os" gorm:"common:操作系统"`
	ResponseCode    string `json:"response_code" gorm:"common:响应状态码"`
	JsonResult      string `json:"json_result" gorm:"type:text;common:响应信息"`
	Status          bool   `json:"status" gorm:"default:false;common:响应状态"`
}
