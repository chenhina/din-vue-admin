package controller

import (
	"fmt"
	"github.com/360EntSecGroup-Skylar/excelize"
	"github.com/gin-gonic/gin"
	"go.study.com/hina/giligili/logic"
	"go.study.com/hina/giligili/settings"
	"strconv"
)

func ExportData(c *gin.Context) {
	_, ok := c.Get(CtxUserIDKey)
	if !ok {
		ResponseError(c, CodeInvalidToken)
		return
	}
	m, err := getUrlQuery(c)
	if err != nil {
		ResponseError(c, CodeInvalidParam)
		return
	}
	page, _ := strconv.ParseInt(m["pageNum"], 10, 64)
	size, _ := strconv.ParseInt(m["pageSize"], 10, 64)
	delete(m, "pageNum")
	delete(m, "pageSize")
	if _, exists := m["page"]; exists {
		delete(m, "page")
	}
	data, err := logic.ExportAllUsers(page, size, m)

	// 生成excel
	f := excelize.NewFile()
	index := []string{"A", "B", "C", "D", "E", "F", "G", "H", "I"}
	column := []string{"用户序号", "登录名称", "用户名称", "用户邮箱", "手机号码", "用户性别", "帐号状态", "部门名称", "部门负责人"}
	var key string
	for a, v := range index {
		key = fmt.Sprintf("%s%d", v, 1)
		f.SetCellValue("Sheet1", key, column[a])
	}
	for i := 2; i < len(data)+2; i++ {
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[0], i), data[i-2].ID)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[1], i), data[i-2].UserName)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[2], i), data[i-2].Name)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[3], i), data[i-2].Email)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[4], i), data[i-2].Mobile)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[5], i), data[i-2].Gender)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[6], i), data[i-2].IsActive)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[7], i), data[i-2].DeptName)
		f.SetCellValue("Sheet1", fmt.Sprintf("%s%d", index[8], i), data[i-2].Leader)
	}
	// 根据指定路径保存文件
	excelPath := fmt.Sprintf("%s%s", settings.Conf.ExcelPath, "data.xlsx")
	//excelPath := "data.xlsx"
	if err := f.SaveAs(excelPath); err != nil {
		fmt.Println(err)
	}

	ResponseSuccess(c, map[string]string{"file_url": excelPath, "name": "user_data.xlsx"})

}
