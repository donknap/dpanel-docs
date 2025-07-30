# 通过基础镜像创建

DPanel 提供了一些常用的基础镜像帮助快速的创建未提供镜像的程序。

这种创建的方式偏向于传统的网站部署模式，先创建环境，上传代码，完成部署。

你也可以将此容器导出成镜像，二次部署或是传播给其他人使用。


### 存储

容器的无状态的，如果需要持久化存储就需要使用 Volume 或是挂载宿主机目录。

在这里 DPanel 将 /app 目录挂载到了 Volume 存储上，并与站点标识进行了关联。

只要站点标识不变无论更新重建多少次，数据依然可以保留。

### 基础镜像

> 国内镜像：ccr.ccs.tencentyun.com/dpanel/base-image

仓库地址：https://hub.docker.com/r/dpanel/base-image

#### php

- dpanel/base-image:php-72
- dpanel/base-image:php-74
- dpanel/base-image:php-81

#### node

- dpanel/base-image:node-12
- dpanel/base-image:node-14
- dpanel/base-image:node-16
- dpanel/base-image:node-18

#### java

- dpanel/base-image:java-8
- dpanel/base-image:java-11
- dpanel/base-image:java-12

#### html

- dpanel/base-image:html-common

#### go

- dpanel/base-image:go-1.21
