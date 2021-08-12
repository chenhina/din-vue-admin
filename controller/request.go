package controller

import (
	"errors"
	"github.com/gin-gonic/gin"
	"net/url"
	"strconv"
	"strings"
)

const CtxUserIDKey = "userID"

var ErrorUserNotLogin = errors.New("用户未登录")

// getCurrentUserID 获取当前登录的用户ID
func getCurrentUserID(c *gin.Context) (userID int64, err error) {
	uid, ok := c.Get(CtxUserIDKey)
	if !ok {
		err = ErrorUserNotLogin
		return
	}
	userID, ok = uid.(int64)
	if !ok {
		err = ErrorUserNotLogin
		return
	}
	return
}

func getPageInfo(c *gin.Context) (int64, int64) {
	pageStr := c.Query("pageNum")
	sizeStr := c.Query("pageSize")
	var (
		page int64
		size int64
		err  error
	)

	page, err = strconv.ParseInt(pageStr, 10, 64)
	if err != nil {
		page = 1
	}
	size, err = strconv.ParseInt(sizeStr, 10, 64)
	if err != nil {
		size = 10
	}
	return page, size
}

func getdeptId(c *gin.Context) int64 {
	detpId := c.Query("deptId")
	deid, err := strconv.ParseInt(detpId, 10, 64)
	if err != nil {
		deid = 1
	}
	return deid
}

func getStatus(c *gin.Context) int8 {
	status := c.Query("status")
	var (
		s   int64
		err error
	)
	s, err = strconv.ParseInt(status, 10, 64)
	if err != nil {
		s = 1
	}
	return int8(s)
}

func getUseeId(c *gin.Context) (int64, error) {
	idstr := c.Query("userId")
	id, err := strconv.ParseInt(idstr, 10, 64)
	return id, err
}

func getID(c *gin.Context) (int64, error) {
	pkstr := c.Param("id")
	id, err := strconv.ParseInt(pkstr, 10, 64)
	return id, err
}

func getIDs(c *gin.Context)([]string)  {
	pkstr := c.Param("id")
	ids := strings.Split(pkstr,",")
	return ids
}

func getQuery2Map(c *gin.Context) map[string]string {
	path := strings.Split(c.Request.RequestURI, "?")[1]
	pathList := strings.Split(path, "&")
	m := make(map[string]string, len(pathList))
	for _, v := range pathList {
		ls := strings.Split(v, "=")
		m[ls[0]] = ls[1]
	}
	return m
}

func getUrlQuery(c *gin.Context) (map[string]string,error) {
	u, err := url.Parse(c.Request.RequestURI)
	if err != nil {
		return nil, err
	}
	uu := u.Query()
	m := make(map[string]string, len(uu))
	for key, v := range uu {
		m[key] = v[0]
	}
	return m,err
}
