package redis

import "time"

func SetToken(key string, value interface{}, expire time.Duration) (err error) {
	_, err = client.Set(key, value, expire).Result()
	return
}

func DelToken(key string) error {
	_, err := client.Del(key).Result()
	return err
}

func CheckToken(key string) error {
	_, err := client.Get(key).Result()
	return err
}
