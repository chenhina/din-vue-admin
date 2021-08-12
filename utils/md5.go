package utils

import (
	"crypto/md5"
	"encoding/hex"
	"github.com/spf13/viper"
)

//@author: [piexlmax](https://github.com/piexlmax)
//@function: MD5V
//@description: md5加密
//@param: str []byte
//@return: string

var secret = viper.GetString("md_secret")

//func MD5V(str []byte) string {
//	h := md5.New()
//	h.Write(str)
//	return hex.EncodeToString(h.Sum(nil))
//}

// EncryptPassword md5加密
func EncryptPassword(oPassword string) string {
	h := md5.New()
	h.Write([]byte(secret))
	return hex.EncodeToString(h.Sum([]byte(oPassword)))
}
