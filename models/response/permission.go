package response



type ResUsers struct {
	Count    int      `json:"count"`
	Next     string    `json:"next"`
	Previous string    `json:"previous"`
	Results  []ResUser `json:"results"`
}

type ResDeptSet struct {
	ID       int32  `json:"id"`
	Label    string `json:"label"`
	ParentId int8   `json:"parentId"`
	Status   int8   `json:"status"`
}

type ResRole struct {
	ID       int32  `json:"id"`
	RoleKey  string `json:"roleKey"`
	RoleName string `json:"roleName"`
	Status   int8   `json:"status"`
}

type ResPost struct {
	ID       uint  `json:"id"`
	PostCode string `json:"postCode"`
	PostName string `json:"postName"`
	Status   int8   `json:"status"`
}

