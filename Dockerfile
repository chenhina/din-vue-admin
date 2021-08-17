#FROM golang:alpine AS builder
#
## 为我们的镜像设置必要的环境变量
#ENV GO111MODULE=on \
#    CGO_ENABLED=0 \
#    GOOS=linux \
#    GOARCH=amd64\
#    GOPROXY=https://goproxy.cn,direct
#
## 移动到工作目录：/build
#WORKDIR /build
#
## 复制项目中的 go.mod 和 go.sum文件并下载依赖信息
#COPY go.mod .
#COPY go.sum .
#RUN go mod download
#
## 将代码复制到容器中
#COPY . .
#
## 将我们的代码编译成二进制可执行文件 bubble
#RUN go build -o app .
#
####################
## 接下来创建一个小镜像
####################
#FROM alpine:latest
#
#WORKDIR /build
#
#COPY --from=builder /build/conf ./
#COPY --from=builder /build/app ./
#
#EXPOSE 8082
#
#ENTRYPOINT ["/app",  "/conf/config.yaml"]
# 需要运行的命令
# ENTRYPOINT ["/bubble", "conf/config.ini"]


FROM golang:alpine

WORKDIR /go/src/gin-vue-admin
COPY . .

RUN go generate && go env && go build -o server .

FROM alpine:latest
LABEL MAINTAINER="din-vue-admin"

WORKDIR /go/src/gin-vue-admin

COPY --from=0 /go/src/gin-vue-admin ./

EXPOSE 8082

ENTRYPOINT ./server -c ./conf/config.yaml