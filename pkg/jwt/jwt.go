package jwt

import (
	"errors"
	"github.com/dgrijalva/jwt-go"
	"github.com/spf13/viper"
	"time"
)

//const TokenExpireDuration = time.Hour * 2

var TokenExpireDuration = viper.GetInt("auth.jwt_expire")

var mySecret = []byte("雨送黄昏花易落")

// MyClaims 自定义声明结构体并内嵌jwt.StandardClaims
// jwt包自带的jwt.StandardClaims只包含了官方字段
// 我们这里需要额外记录一个username字段，所以要自定义结构体
// 如果想要保存更多信息，都可以添加到这个结构体中
type MyClaims struct {
	UserID   int64  `json:"user_id"`
	Username string `json:"username"`
	jwt.StandardClaims
}

// GenToken 生成JWT
func GenToken(userID int64, username string) (string, error) {
	// 创建一个自己声明的数据
	c := MyClaims{
		userID,
		username,
		jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Duration(viper.GetInt("auth.jwt_expire")) * time.Hour).Unix(), // 过期时间
			Issuer:    "Hina",                                                                            // 签发人
		},
	}
	// 使用指定的签名方法创建签名对象
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, c)
	// 使用指定的secret前面并获得完整的编码后的字符串token
	return token.SignedString(mySecret)
}

// ParseToken 解析JWT
func ParseToken(tokenString string) (*MyClaims, error) {
	// 解析token
	var mc = new(MyClaims)
	token, err := jwt.ParseWithClaims(tokenString, mc, func(token *jwt.Token) (interface{}, error) {
		return mySecret, nil
	})
	//fmt.Println(token, err)
	if err != nil {
		return nil, err
	}
	if token.Valid { // 校验token
		return mc, nil
	}
	return nil, errors.New("Invalid token")
}

//// GenToken1 生成Assess Token 和 Refresh Token
//func GenToken1(userID int64, username string) (aToken, rToken string, err error) {
//	// 创建一个我们自己的声明
//	c := MyClaims{
//		userID,
//		username,
//		jwt.StandardClaims{
//			ExpiresAt: time.Now().Add(TokenExpireDuration).Unix(), // 过期时间
//			Issuer:    "Hina",                                     // 签发人
//		},
//	}
//	// 使用指定的签名方法创建签名对象
//	aToken, err = jwt.NewWithClaims(jwt.SigningMethodHS256, c).SignedString(mySecret)
//	// 使用指定的secret前面并获得完整的编码后的字符串token
//
//	// refresh token 不需要存任何自定义数据
//	rToken, err = jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.StandardClaims{
//		ExpiresAt: time.Now().Add(time.Second * 30).Unix(), // 过期时间
//		Issuer:    "Hina",                                  // 签发人
//	}).SignedString(mySecret)
//
//	return
//}
//
//// ParseToken1 解析JWT
//func ParseToken1(tokenString string) (*MyClaims, error) {
//	// 解析token
//	var mc = new(MyClaims)
//	token, err := jwt.ParseWithClaims(tokenString, mc, func(token *jwt.Token) (interface{}, error) {
//		return mySecret, nil
//	})
//	if err != nil {
//		return nil, err
//	}
//	if token.Valid { // 校验token
//		return mc, nil
//	}
//	return nil, errors.New("Invalid token")
//}
//
//// RefreshToken 刷新AccessToken
//func RefreshToken(aToken, rToken string) (newAToken, newRToken string, err error) {
//	// refresh token无效直接返回
//	if _, err = jwt.Parse(rToken, func(token *jwt.Token) (interface{}, error) {
//		return mySecret, nil
//	}); err != nil {
//		return
//	}
//
//	// 从旧access token中解析出claims数据
//	var mc = new(MyClaims)
//	_, err = jwt.ParseWithClaims(aToken, mc, func(token *jwt.Token) (interface{}, error) {
//		return mySecret, nil
//	})
//	v, _ := err.(jwt.ValidationError)
//
//	// 当access token是过期错误 并且 refresh token 没有过期时就创建一个新的access token
//	if v.Errors == jwt.ValidationErrorExpired {
//		return GenToken1(mc.UserID, mc.Username)
//	}
//	return
//}
