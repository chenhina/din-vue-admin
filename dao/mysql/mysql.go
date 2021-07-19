package mysql

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
	"go.study.com/hina/giligili/models"
	"go.study.com/hina/giligili/settings"
	"go.uber.org/zap"
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
	db, err = gorm.Open("mysql", dsn)
	if err != nil {
		zap.L().Error("connect db failed", zap.Error(err))
		return
	}
	db.DB().SetMaxOpenConns(cfg.MaxOpenConns)
	db.DB().SetMaxIdleConns(cfg.MaxIdleConns)

	migration()

	return
}

// 执行数据迁移

func migration() {
	// 自动迁移模式
	db.AutoMigrate(&models.Video{})

}

func Close() {
	_ = db.Close()
}
