# 安装 Lite 版

在 lite 版中，不包含域名转发功能。即容器内不会安装 nginx 及 acme.sh 等相关组件

需要域名转发请借助外部工具，例如 NginxProxyManager、Lucky、宝塔、Nginx等

其它配置参考完整版 [Docker安装](/zh-cn/install/docker)

```
docker run -it -d --name dpanel --restart=always \
 -p 8807:8080 -e APP_NAME=dpanel \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v dpanel:/dpanel dpanel/dpanel:lite
 ```