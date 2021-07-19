package redis

import (
	"fmt"
	"github.com/go-redis/redis"
	"go.study.com/hina/giligili/settings"
)

// 声明一个全局的rdb变量
var (
	client *redis.Client
	Nil    = redis.Nil
)

// 初始化连接
func Init(cfg *settings.RedisConfig) (err error) {
	client = redis.NewClient(&redis.Options{ // 哨兵模式redis.NewFailoverClient()、集群模式redis.NewClusterClient()
		Addr: fmt.Sprintf("%s:%d",
			cfg.Host,
			cfg.Port,
		),
		Password:     cfg.Password,
		DB:           cfg.DB,       // 使用默认数据库
		PoolSize:     cfg.PoolSize, // 连接池大小
		MinIdleConns: cfg.MinIdleConns,
	})
	_, err = client.Ping().Result()
	return
}

func Close() {
	_ = client.Close()
}
