package request



type ReqMessage struct {
	Content string `json:"content"`
	MessageType string `json:"message_type"`
	Status string `json:"status"`
	Title string `json:"title"`
	ToPath string `json:"to_path"`
	IsReviewed bool `json:"is_reviewed"`
}