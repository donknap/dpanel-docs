### 使用三方系统 Nginx Proxy Manager 转发

> 项目地址：https://github.com/NginxProxyManager/nginx-proxy-manager

安装时需要绑定 80 及 443 端口，并且添加 /etc/letsencrypt 目录到默认存储上。

#### 通过 ip 转发

每个容器被创建的时候都会添加到默认的 bridge 网络中，所有的容器都可以通过在此网络中的 ip 进行互相访问。

但是容器在这个网络中的 ip 并不是固定的，随着容器的停止再启动 ip 可能会发生变化。

#### 通过关联 host 转发

如果想避免直接使用 ip 带来的不确定的风险，在 DPanel 中也可以将 npm 容器和想转发的目标容器关联到一起。

这时候系统就会给目标容器生成一个固定的 host 地址，通过这个 host 地址再进行转发。

### 演示

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112557553616795&bvid=BV17pTXeWEXd&cid=500001571361210&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>