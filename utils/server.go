package utils

import (
	"fmt"
	"github.com/shirou/gopsutil/cpu"
	"github.com/shirou/gopsutil/disk"
	"github.com/shirou/gopsutil/mem"
	"go.study.com/hina/giligili/models/request"
	"runtime"
	"strconv"
	"time"
)

// 保留两位小数
func getFloat2end(num float64) float64 {
	res, _ := strconv.ParseFloat(fmt.Sprintf("%.2f", num), 64)
	return res
}

// GetCpuInfo 获取cpu信息
func GetCpuInfo() *request.Cpu {
	cpuInfo := new(request.Cpu)
	percent, _ := cpu.Percent(time.Second, false)
	cpuInfo.Rate = getFloat2end(percent[0])
	cpuInfo.Total = runtime.NumCPU()
	cpuInfo.Used = ""
	cpuInfo.Unit = "核心"
	return cpuInfo
}

// GetMemInfo 获取内存信息
func GetMemInfo() *request.Memory {
	memoryInfo := new(request.Memory)
	info, _ := mem.VirtualMemory()
	memoryInfo.Rate = getFloat2end(info.UsedPercent)
	memoryInfo.Unit = "MB"
	memoryInfo.Total = int(info.Total >> 20)
	memoryInfo.Used = int(info.Used >> 20)

	return memoryInfo

}

// GetDiskInfo 获取磁盘信息
func GetDiskInfo() []*request.Disk {
	res := make([]*request.Disk, 0, 4)
	var diskInfo *request.Disk
	parts, _ := disk.Partitions(true)
	for _, part := range parts {
		// 拿到每个分区
		usageStatInfo, _ := disk.Usage(part.Mountpoint) // 传挂载点进去
		diskInfo = &request.Disk{
			DirName: usageStatInfo.Path,
			BaseInfo: request.BaseInfo{
				Rate:  getFloat2end(usageStatInfo.UsedPercent),
				Total: int(usageStatInfo.Total >> 30),
				Used:  int(usageStatInfo.Used >> 30),
				Unit:  "GB",
			},
		}
		res = append(res, diskInfo)
	}
	return res

}

// GetOsInfo获取操作系统相关信息
func GetOsInfo() (o request.Os) {
	o.GOOS = runtime.GOOS
	o.NumCPU = runtime.NumCPU()
	o.Compiler = runtime.Compiler
	o.GoVersion = runtime.Version()
	o.NumGoroutine = runtime.NumGoroutine()
	return o
}
