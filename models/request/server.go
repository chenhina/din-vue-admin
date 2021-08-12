package request

type ServerIP struct {
	ID     int    `json:"id"`
	IP     string `json:"ip"`
	Name   string `json:"name"`
	OS     string `json:"os"`
	Remark string `json:"remark"`
}

type BaseInfo struct {
	Rate  float64 `json:"rate"`
	Total int     `json:"total"`
	Used  int     `json:"used"`
	Unit  string  `json:"unit"`
}

type Cpu struct {
	BaseInfo
	Used string `json:"used"`
}

type Disk struct {
	DirName string `json:"dir_name"`
	BaseInfo
}

type Memory struct {
	BaseInfo
}

type ServerInfo struct {
	Cpu *Cpu `json:"cpu"`
	Disk []*Disk `json:"disk"`
	Memory *Memory `json:"memory"`
}



type ServerDateInfo struct {
	Cpu []*Cpu `json:"cpu"`
	Disk []*Disk `json:"disk"`
	Memory []*Memory `json:"memory"`
}


type TimerServerInfo struct {
	CPU float64 `json:"cpu"`
	Memory float64 `json:"memory"`
	Time string `json:"datetime"`
}