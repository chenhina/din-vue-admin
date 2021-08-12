package mysql

import (
	"fmt"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/settings"
	"go.uber.org/zap"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

//var db *sqlx.DB
//
//func Init(cfg *settings.MySQLConfig) (err error) {
//	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local",
//		cfg.User,
//		cfg.Password,
//		cfg.Host,
//		cfg.Port,
//		cfg.DB,
//	)
//	db, err = sqlx.Connect("mysql", dsn)
//	if err != nil {
//		zap.L().Error("connect db failed", zap.Error(err))
//		return
//	}
//	db.SetMaxOpenConns(cfg.MaxOpenConns)
//	db.SetMaxIdleConns(cfg.MaxIdleConns)
//	return
//}

var db *gorm.DB

func Init(cfg *settings.MySQLConfig) (err error) {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		cfg.User,
		cfg.Password,
		cfg.Host,
		cfg.Port,
		cfg.DB,
	)
	mysqlConfig := mysql.Config{
		DSN:                       dsn,   // DSN data source name
		DefaultStringSize:         191,   // string 类型字段的默认长度
		DisableDatetimePrecision:  true,  // 禁用 datetime 精度，MySQL 5.6 之前的数据库不支持
		DontSupportRenameIndex:    true,  // 重命名索引时采用删除并新建的方式，MySQL 5.7 之前的数据库和 MariaDB 不支持重命名索引
		DontSupportRenameColumn:   true,  // 用 `change` 重命名列，MySQL 8 之前的数据库和 MariaDB 不支持重命名列
		SkipInitializeWithVersion: false, // 根据版本自动配置
	}
	db, err = gorm.Open(mysql.New(mysqlConfig), gormConfig())
	if err != nil {
		zap.L().Error("connect db failed", zap.Error(err))
		return
	}
	sqlDB, _ := db.DB()
	sqlDB.SetMaxOpenConns(cfg.MaxOpenConns)
	sqlDB.SetMaxIdleConns(cfg.MaxIdleConns)

	err = migration()
	return
}

// 执行数据迁移
func migration() error {
	// 自动迁移模式
	err := db.AutoMigrate(
		models.SysUser{},
		models.SysRole{},
		models.SysDept{},
		models.SysPost{},
		models.SysMenu{},
		models.SysConfigSettings{},
		models.SysDictData{},
		models.SysDictDetail{},
		models.SysLoginInfo{},
		models.SysSaveFile{},
		models.SysMessage{},

	)
	return err

}

func GetDB() *gorm.DB {
	return db
}

func gormConfig() *gorm.Config {
	var config = &gorm.Config{DisableForeignKeyConstraintWhenMigrating: true}
	return config
}
