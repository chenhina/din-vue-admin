package utils

import (
	"fmt"
	"github.com/axgle/mahonia"
	"go.study.com/hina/giligili/dao/redis"
	"io/ioutil"
	"net/http"
	"strings"
	"time"
)

func ConvertToString(src string, srcCode string, tagCode string) string {
	srcCoder := mahonia.NewDecoder(srcCode)
	srcResult := srcCoder.ConvertString(src)
	tagCoder := mahonia.NewDecoder(tagCode)
	_, cdata, _ := tagCoder.Translate([]byte(srcResult), true)
	result := string(cdata)
	return result

}

func GetLocation(ip string) string {
	location, err := redis.GetIPLocation(ip)
	if err != nil || location == "" {
		urlStr := fmt.Sprintf("http://whois.pconline.com.cn/ip.jsp?ip=%s", ip)
		client := &http.Client{Timeout: time.Second * 2}
		res, err := client.Get(urlStr)
		if err != nil {
			return "UnKnown"
		}
		defer res.Body.Close()
		body, _ := ioutil.ReadAll(res.Body)
		result := ConvertToString(string(body), "gbk", "utf-8")
		location = strings.Replace(result, "\n", "", -1)
		redis.SetIPLocation(ip, location)
	}
	return location
}
