package main

import (
	"fmt"
	"github.com/sony/sonyflake"
	"time"
)

var (
	sonyFlake     *sonyflake.Sonyflake
	sonyMachineID uint16
)

func getMachineID() (uint16, error) {
	return sonyMachineID, nil
}

// 需传入当前的机器ID
func Init(startTime string, machineID uint16) (err error) {
	sonyMachineID = machineID
	var st time.Time
	st, err = time.Parse("2006-01-02", startTime)
	if err != nil {
		return
	}
	setting := sonyflake.Settings{
		StartTime: st,
		MachineID: getMachineID,
	}
	sonyFlake = sonyflake.NewSonyflake(setting)
	return
}

// GenID 生成id
func GenID() (id uint64, err error) {
	if sonyFlake == nil {
		err = fmt.Errorf("sony flake not init")
		return
	}
	id, err = sonyFlake.NextID()
	return
}

func main() {
	if err := Init("2020-05-22", 1); err != nil {
		fmt.Printf("Init failed,err:%v\n", err)
		return
	}
	id, _ := GenID()
	fmt.Println(id)
}
