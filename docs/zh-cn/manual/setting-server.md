# 服务器Ip

在没有 Nginx 做外部转发的时候，容器通过 **http://ip:端口** 的形式进行访问。默认情况下 ip 为本机 127.0.0.1。

如果配置到服务器上则需要通过 **系统** - **基础设置** - **服务器Ip** 进行配置。

配置的值可以是内网或是外网 ip，配置完成后。可以正常的打开容器暴露的端口。