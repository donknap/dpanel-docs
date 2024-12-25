# 多环境管理

在 DPanel 中可以通过 api 或是 sock 的形式管理多个 Docker 客户端

### 添加环境

【系统】- 【客户端管理】-【添加Docker环境】。

管理远程 docker 环境时可开启 docker 的 tls 方式验证权限，[【开启 docker tls 连接】](zh-cn/manual/system/remote.md)

![system-docker-env-add.png](https://cdn.w7.cc/dpanel/system-docker-env-add.png?t=1)

### 切换不同的环境

添加完成后，可以顶部菜单切换不同的 Docker 客户端

### 配置默认 Docker 环境

> 通过这样的方式，你可以不必将面板安装到你远程服务器主机中，严格杜绝了因为面板产生的安全问题。

初次安装面板之后，面板会读取 /var/run/docker.sock 文件连接 docker API。
假如你当前环境未安装 docker 或是连接 sock 文件不是默认路径。可以通过【配置默认 Docker 客户端】来修改默认 docker 连接。

![system-docker-env-default.png](https://cdn.w7.cc/dpanel/system-docker-env-default.png)