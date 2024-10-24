### 使用 DPanel 转发

> 使用前必须创建 dpanel-local 网络，并绑定 80 及 443 端口

DPanel 提供了简单的域名绑定转发功能

转发域名到容器时，需要将目标容器放置到 dpanel-local 网络中，面板会绑定容器 Hostname 进行转发。

#### 创建 dpanel-local

默认下面板会自动创建 dpanel-local 网络，你也可以手动创建并将 dpanel 面板进入其中。

```
// 如果提示网络已经存在，请先删除 docker network rm dpanel-local

docker network create dpanel-local
docker network connect dpanel-local dpanel
```

#### 端口

配置目标容器的内部访问端口，一般为80端口。


#### 自定义配置

扩展站点的 vhost.conf 配置，例如一些重写规则。

#### 支持 Websocket 

如果你的站点需要 ws 连接，必须开启此项

#### ssl 证书

绑定域名后，可以通过面板上传ssl证书，或是批量申请免费证书


### 演示

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112556983193480&bvid=BV1i6TSe5EsW&cid=500001571229201&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>