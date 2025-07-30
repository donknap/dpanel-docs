# 主机管理

> DPanel Version >= 1.7.0

在通过 docker api 添加了 docker 服务端后，可以在 **多服务端管理** 中，配置当前环境的 SSH 权限。
配置 **本地** 环境 **主机Ip地址** 时，不可以使用 127.0.0.1，因为该地址代表的容器自身。

需要使用主机在公网地址、局域网地址或是在创建面板容器时将主机的地址注入到面板容器中 [绑定主机 Host](/install/docker?id=绑定宿主机-host),

> 使用 **一键安装脚本** 安装面板时，可以直接使用 host.dpanel.local 来请求宿主机。

![system-docker-env-add.png](https://cdn.w7.cc/dpanel/system-docker-env-ssh.png?t=7)

### ssh 及 文件管理

配置完成后，可在顶部 **Console 图标** 或是 **首页** - **主机管理** 中连接宿主机。

![system-docker-env-add.png](https://cdn.w7.cc/dpanel/system-docker-env-ssh-use.png?t=7)