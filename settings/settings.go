package settings

import (
	"fmt"
	"github.com/fsnotify/fsnotify"
	"github.com/spf13/viper"
)

// 全局变量，用来保存程序的所有配置信息
var Conf = new(AppConfig) // 值类型，new初始化返回该类型的指针对象

type AppConfig struct {
	Name         string `mapstructure:"name"`
	Mode         string `mapstructure:"mode"`
	Version      string `mapstructure:"version"`
	Host         string `mapstructure:"host"`
	StartTime    string `mapstructure:"start_time"`
	AvatarPath   string `mapstructure:"avatar_path"`
	ExcelPath    string `mapstructure:"excel_path"`
	SaveFilePath string `mapstructure:"save_file_path"`
	JwtPrefix    string `mapstructure:"jwt_prefix"`
	MachineID    int64  `mapstructure:"machine_id"`
	Port         int    `mapstructure:"port"`
	*LogConfig   `mapstructure:"log"`
	*MySQLConfig `mapstructure:"mysql"`
	*RedisConfig `mapstructure:"redis"`
	*Captcha     `mapstructure:"captcha"`
}

type LogConfig struct {
	Level      string `mapstructure:"level"`
	Filename   string `mapstructure:"filename"`
	MaxSize    int    `mapstructure:"max_size"`
	MaxAge     int    `mapstructure:"max_age"`
	MaxBackups int    `mapstructure:"max_backups"`
}

type MySQLConfig struct {
	Host         string `mapstructure:"host"`
	User         string `mapstructure:"user"`
	Password     string `mapstructure:"password"`
	DB           string `mapstructure:"db"`
	Port         int    `mapstructure:"port"`
	MaxOpenConns int    `mapstructure:"max_open_conns"`
	MaxIdleConns int    `mapstructure:"max_idle_conns"`
}

type RedisConfig struct {
	Host         string `mapstructure:"host"`
	Password     string `mapstructure:"password"`
	Port         int    `mapstructure:"port"`
	DB           int    `mapstructure:"db"`
	PoolSize     int    `mapstructure:"pool_size"`
	MinIdleConns int    `mapstructure:"minidle_conns"`
}

type Captcha struct {
	KeyLong   int `mapstructure:"key_long" json:"keyLong" yaml:"key_long"`       // 验证码长度
	ImgWidth  int `mapstructure:"img_width" json:"imgWidth" yaml:"img_width"`    // 验证码宽度
	ImgHeight int `mapstructure:"img_height" json:"imgHeight" yaml:"img_height"` // 验证码高度
}

func Init(filepath string) (err error) {
	// 方式1: 直接指定配置文件路径(相对路径或者绝对路径)
	// 相对路径: 相对执行的可执行文件的相对路径
	// 绝对路径: 系统中实际的文件路径
	// viper.SetConfigFile("./conf/config.yaml")
	// viper.SetConfigFile("config.json")

	// 方式2: 指定配置文件名和配置文件的位置, viper自行查找可用的配置文件
	// 配置文件名不需要带后缀
	// 配置文件位置可配置多个

	//viper.SetConfigName("config") // 指定配置文件名称(不需要带后缀)
	//viper.SetConfigType("yaml")   // 指定配置文件类型(专用于从远程获取配置信息时指定配置类型的)
	//viper.AddConfigPath(".")   // 指定查找配置文件的路径(这里使用相对路径)

	viper.SetConfigFile(filepath)

	err = viper.ReadInConfig() // 读取配置信息
	if err != nil {
		// 读取配置信息失败
		fmt.Printf("viper config failed, err:%#v\n", err)
		return
	}
	// 把读取到的配置信息反序列化到 Conf 变量中
	if err := viper.Unmarshal(Conf); err != nil {
		fmt.Printf("viper unmarshal failed, err:%v\n", err)
	}

	viper.WatchConfig()
	viper.OnConfigChange(func(in fsnotify.Event) {
		fmt.Println("配置文件已被修改...")
		// 发送通知
		if err := viper.Unmarshal(Conf); err != nil {
			fmt.Printf("viper unmarshal failed, err:%v\n", err)
		}
	})
	return
}
