# 配置镜像仓库

对于匿名用户，具有在 docker hub 仓库拉取镜像的权限。

但是如果你想推送镜像到 docker hub 或是其它仓库时，需要添加对应的仓库并配置用户名及密码。

### docker hub

默认下，DPanel 面板会自动创建 docker hub 仓库的记录，并设置为匿名用户。

### 添加其它仓库

##### 阿里云

仓库地址：registry.cn-beijing.aliyuncs.com

##### 腾讯云

仓库地址：ccr.ccs.tencentyun.com

![registry-create](https://cdn.w7.cc/dpanel/registry-create.png)

### 仓库加速

> 采用面板配置加速地址不需要修改 docker 的 daemon.json 文件，也无需启动服务。

如果需要拉取镜像加速，需要先将镜像所属的【仓库】添加到仓库管理中，并配置【加速地址】。\
配置加速地址时可以配置多条数据，一行一条加速地址，面板会采用轮询的方式进行拉取。

通过加速地址拉取镜像后，面板会给该镜像添加两个tag，一个为原始的名称，一个为包含加速地址的标签。\
以便于你区分哪些加速地址已经失效。
