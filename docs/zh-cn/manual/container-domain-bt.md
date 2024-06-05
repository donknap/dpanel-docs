# 使用宿主机已安装宝塔转发

如果宿主已经安装过宝塔或是已经有 Nginx 服务时

就会导致 DPanel 或是 Nginx Proxy Manager 这些系统无法绑定到 80 及 443端口上。

这时候也可以通过宿主机已有的 宝塔（Nginx） 进行反向代理转发。

#### 通过 ip 转发

每个容器被创建的时候都会添加到默认的 bridge 网络中，宿主机可以通过容器在 bridge 网络中的 ip 访问到容器。

容器在这个网络中的 ip 并不是固定的，随着容器的停止再启动 ip 可能会发生变化。

在宝塔中添加一条反向代理规则即可实现转发。

```
location / {
    proxy_pass http://容器在Bridge网络的Ip:容器内端口;
}
```

#### 通过绑定端口进行转发

在创建容器的时候通过暴露端口可以将宿主机的某些端口映射到容器内部

这时候也可以在 Nginx 添加一条 127.0.0.1:绑定端口 进行转发。 

```
location / {
    proxy_pass http://127.0.0.1:容器暴露端口;
}
```

### 演示

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112557553616795&bvid=BV17pTXeWEXd&cid=500001571361210&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>