package snowflake

import (
	sf "github.com/bwmarrin/snowflake"
	"time"
)

var node *sf.Node

// 初始化分布式ID生成器
func Init(stratTime string, machineID int64) (err error) {
	var st time.Time
	st, err = time.Parse("2006-01-02", stratTime)
	if err != nil {
		return
	}
	sf.Epoch = st.UnixNano() / 1000000
	node, err = sf.NewNode(machineID)
	return
}

// 生成一个分布式ID
func GenID() int64 {
	return node.Generate().Int64()
}
