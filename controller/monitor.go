package controller

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/models/request"
	"go.study.com/hina/giligili/utils"
	"time"
)

func MonitorEnabled(c *gin.Context) {
	m := make(map[string]interface{})
	m["enabled"] = true
	m["interval"] = 5
	m["save_days"] = "2"

	ResponseSuccess(c, m)
}

func ServerIP(c *gin.Context) {
	data := make([]*request.ServerIP, 0, 5)
	p2 := &request.ServerIP{
		ID:     4,
		IP:     "172.20.0.4",
		Name:   "Hina",
		OS:     "Windows",
		Remark: "服务器1",
	}
	p3 := &request.ServerIP{
		ID:     3,
		IP:     "172.20.0.3",
		Name:   "Rui",
		OS:     "Linux",
		Remark: "服务器2",
	}
	p4 := &request.ServerIP{
		ID:     2,
		IP:     "172.20.0.2",
		Name:   "Lem",
		OS:     "Mac",
		Remark: "服务器3",
	}
	p5 := &request.ServerIP{
		ID:     1,
		IP:     "172.20.0.1",
		Name:   "EMT",
		OS:     "windows Server",
		Remark: "服务器4",
	}
	data = append(data, p2, p3, p4, p5)

	ResponseSuccess(c, data)
}

func ServerInfo(c *gin.Context) {
	cpu := utils.GetCpuInfo()
	diskInfos := utils.GetDiskInfo()
	memory := utils.GetMemInfo()
	data := &request.ServerInfo{
		Cpu:    cpu,
		Disk:   diskInfos,
		Memory: memory,
	}
	ResponseSuccess(c, data)
}

func ServerDateInfo(c *gin.Context) {
	m, err := getUrlQuery(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	val, exists := m["as"]
	var ans map[string][2]string
	if exists {
		json.Unmarshal([]byte(val), &ans)
	}

	data := &request.ServerDateInfo{
		Cpu:    []*request.Cpu{},
		Disk:   []*request.Disk{},
		Memory: []*request.Memory{},
	}
	ResponseSuccess(c, data)

}



func TimerServerInfo(c *gin.Context) {
	data := &request.TimerServerInfo{
		CPU:    utils.GetCpuInfo().Rate,
		Memory: utils.GetMemInfo().Rate,
		Time:   time.Now().Format("15:04:05"),
	}
	ResponseSuccess(c, data)
}
