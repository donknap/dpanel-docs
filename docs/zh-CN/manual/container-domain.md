# 域名转发 <Badge type="tip" text="DPanel Family == 标准版" />

容器对外访问时，可以将容器内部端口映射到宿主机端口，在普通版中也可以通过绑定域名转发


## 更改默认端口

:::danger
在多环境中，只有安装了 DPanel 面板的服务端支持域名转发功能
:::

创建面板时如果将 80、443 绑定到了其它端口上，那么访问域名时需求携带端口号，
http:\/\/test.com:880 或 https:\/\/test.com:8443

```js
docker run -d --name dpanel --restart=always \
 -p 880:80 -p 8443:443 -p 8807:8080 -e APP_NAME=dpanel \   // [!code focus]
 -v /Users/test/.docker/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel dpanel/dpanel:latest
```

## 域名转发

在【容器管理】-【域名转发】为容器添加域名转发

![domain-1.png](https://cdn.w7.cc/dpanel/domain-1.png){data-zoomable}

## 转发到面板自身

为面板自身配置域名转发时，将【目标地址】配置为 127.0.0.1 【目标端口】配置为 8080 即可。

## 转发到容器

当你通过【选择容器】功能添加转发容器后，面板会自动创建 dpanel-local 网络，并把转发目标容器与面板自身加入到该网络中。在转发配置中，则采用容器在 dpanel-local 网络中的 hostname 进行。

这样的好处是当你的目标容器 Ip 发生变化时也可以正常的转发。但是必须保证 DPanel 面板容器和目标容器在重建时必须添加至 dpanel-local 网络中。

## 转发到 ip 地址

### 容器

:::tip
使用 host.dpanel.local 域名时，在创建面板容器时需要[绑定宿主机 host](/install/docker#bind-host)
:::

你也可以通过直接填写容器的 ip 地址 + 端口的形式转发，可选的方式有以下几种：

- http:\//[容器在Bridge网络的IP]:[容器内端口]
- http:\//[宿主机在局域网的IP地址]:[容器映射端口]
- http:\//host.dpanel.local:[容器映射端口] 

### 其它服务端

通过 http:\//[服务端的IP]:[容器映射端口] 转发到其它服务端的容器
比如，在 192.168.0.13 的主机上部署了某个容器并映射了 80 端口到主机的 8080，那么转发地址为 http:\//192.168.0.13:8080

## 重定向

将某个域名重定向到目标域名或是 ip 上。