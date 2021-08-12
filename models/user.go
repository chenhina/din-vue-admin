package models

import (
	"database/sql/driver"
	"errors"
	"fmt"
	"gorm.io/gorm"
	"strings"
	"time"
)

//MyTime 自定义时间
type MyTime time.Time

func (t *MyTime) UnmarshalJSON(data []byte) error {
	if string(data) == "null" {
		return nil
	}
	var err error
	//前端接收的时间字符串
	str := string(data)
	//去除接收的str收尾多余的"
	timeStr := strings.Trim(str, "\"")
	t1, err := time.Parse("2006-01-02 15:04:05", timeStr)
	*t = MyTime(t1)
	return err
}

func (t MyTime) MarshalJSON() ([]byte, error) {
	formatted := fmt.Sprintf("\"%v\"", time.Time(t).Format("2006-01-02 15:04:05"))
	return []byte(formatted), nil
}

func (t MyTime) Value() (driver.Value, error) {
	// MyTime 转换成 time.Time 类型
	tTime := time.Time(t)
	return tTime.Format("2006-01-02 15:04:05"), nil
}

func (t *MyTime) Scan(v interface{}) error {
	switch vt := v.(type) {
	case time.Time:
		// 字符串转成 time.Time 类型
		*t = MyTime(vt)
	default:
		return errors.New("类型处理错误")
	}
	return nil
}

func (t *MyTime) String() string {
	return fmt.Sprintf("hhh:%s", time.Time(*t).String())
}

// BaseModel gorm基础字段
type BaseModel struct {
	ID        uint           `gorm:"primarykey" json:"id"`                                  // 主键ID
	CreatedAt MyTime         `json:"create_datetime" gorm:"comment:'创建时间';type:timestamp;"` // 创建时间
	UpdatedAt MyTime         `json:"update_datetime" gorm:"comment:'修改时间';type:timestamp;"` // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"`                                        // 删除时间
}

// SysUser 用户表
type SysUser struct {
	BaseModel
	UserID   int64     `json:"uid" gorm:"index;comment:'用户uid'"`
	Username string    `json:"username" gorm:"comment:'用户登录名'"`
	Name     string    `json:"name" gorm:"comment:'用户登录名'"`
	Password string    `json:"-" gorm:"comment:'用户登录密码'"`
	Email    string    `json:"email" gorm:"comment:邮箱"`
	Mobile   string    `json:"mobile" gorm:"comment:手机号"`
	Gender   string    `json:"gender" gorm:"common:性别"`
	Avatar   string    `json:"avatar" gorm:"default:'/media/avatar/default.jpg';comment:'用户头像'"`
	IsActive bool      `json:"is_active" gorm:"default:false;comment:'是否活跃'"`
	Role     SysRole   `json:"role" gorm:"foreignKey:RoleId;references:RoleId;comment:用户角色"`
	RoleId   uint8     `json:"roleId" gorm:"comment:'关联角色'"`
	Dept     SysDept   `json:"role" gorm:"foreignKey:DeptId;references:DeptId;comment:部门外键"`
	DeptId   uint8     `json:"deptId" gorm:"comment:归属部门"` // 用户部门一对多
	Posts    []SysPost `json:"post" gorm:"many2many:sys_user_post;comment:'关联岗位'"`
	Messages []SysMessage `json:"messages" gorm:"many2many:sys_user_message;comment:关联信息"`
}

// SysRole 角色表
type SysRole struct {
	CreatedAt MyTime    `json:"create_datetime"` // 创建时间
	UpdatedAt MyTime    `json:"update_datetime"` // 更新时间
	DeletedAt *MyTime   `sql:"index" gorm:"index" json:"-"`
	RoleId    int32     `json:"id" gorm:"not null;unique;primary_key;comment:'角色id'"`
	RoleName  string    `json:"roleName" gorm:"comment:'角色名'"`
	RoleKey   string    `json:"roleKey" gorm:"comment:'权限字符'"`
	RoleSort  int8      `json:"roleSort" gorm:"comment:'角色顺序'"`
	Status    int8      `json:"status" gorm:"comment:'角色状态'"`
	Admin     bool      `json:"admin" gorm:"default:false;comment:'是否为admin'"`
	Depts     []SysDept `json:"depts" gorm:"many2many:sys_role_dept;comment:'数据权限-关联部门'"`
	Menus     []SysMenu `json:"menus" gorm:"many2many:sys_role_menu;comment:'关联菜单权限'"`
}

// SysDept 部门表
type SysDept struct {
	CreatedAt MyTime    `json:"create_datetime"` // 创建时间
	UpdatedAt MyTime    `json:"update_datetime"` // 更新时间
	DeletedAt *MyTime   `sql:"index" gorm:"index" json:"-"`
	DeptId    int32     `json:"id" gorm:"not null;unique;primary_key;comment:'部门id'"`
	DeptName  string    `json:"deptName" gorm:"comment:'部门名称'"`
	Leader    string    `json:"leader" gorm:"comment:领导""`
	Phone     string    `json:"phone" gorm:"comment:手机号""`
	Email     string    `json:"email" gorm:"comment:邮箱""`
	OrderNum  int8      `json:"orderNum" gorm:"comment:'显示排序'"`
	ParentId  int8      `json:"parentId" gorm:"comment:父角色ID"`
	Roles     []SysRole `json:"roles" gorm:"many2many:sys_role_dept;comment:'关联角色'"`
	Status    int8      `json:"status" gorm:"comment:状态"`
}

// SysMenu 菜单表
type SysMenu struct {
	BaseModel
	ParentId        int8      `json:"parentId" gorm:"comment:上级菜单"`
	MenuType        int8      `json:"menuType" gorm:"comment:菜单类型"`
	Visible         string    `json:"visible" gorm:"comment:显示状态"`
	Icon            string    `json:"icon" gorm:"comment:菜单图标"` // 菜单图标
	Name            string    `json:"name" gorm:"comment:菜单名"`  // 菜单名
	OrderNum        int8      `json:"orderNum" gorm:"comment:'显示排序'"`
	IsFrame         bool      `json:"isFrame" gorm:"comment:'是否外链'"`
	WebPath         string    `json:"web_path" gorm:"comment:'前端路由地址'"`
	ComponentPath   string    `json:"component_path" gorm:"comment:'前端组件路径'"`
	InterfacePath   string    `json:"interface_path" gorm:"comment:'后端接口路径'"`
	InterfaceMethod string    `json:"interface_method" gorm:"comment:'接口请求方式'"`
	Perms           string    `json:"perms" gorm:"comment:'权限标识'"`
	Status          int8      `json:"status" gorm:"comment:'菜单状态'"`
	Roles           []SysRole `json:"roles" gorm:"many2many:sys_role_menu;comment:'关联角色'"`
}

// SysPost 职位表
type SysPost struct {
	BaseModel
	PostName string    `json:"postName" gorm:"comment:'岗位名称'"`
	PostCode string    `json:"postCode" gorm:"comment:'岗位编码'"`
	PostSort int8      `json:"postSort" gorm:"comment:'岗位顺序'"`
	Status   int8      `json:"status" gorm:"comment:'岗位状态'"`
	Users    []SysUser `json:"users" gorm:"many2many:sys_user_post;comment:'关联用户'"`
}
