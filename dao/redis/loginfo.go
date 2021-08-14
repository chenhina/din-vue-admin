package redis

import (
	"github.com/spf13/viper"
	"time"
)

func SetIPLocation(ip, location string) {
	expire := viper.GetInt("auth.jwt_expire")
	client.Set(ip, location, time.Duration(expire)*time.Hour).Result()
}

func GetIPLocation(ip string) (string, error) {
	location, err := client.Get(ip).Result()
	if err != nil {
		return "", err
	}
	return location, nil
}
