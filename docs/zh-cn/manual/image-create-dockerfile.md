# 通过 Dockerfile 创建镜像

> 如果该文件中还依赖于其它配置文件，则需要采用 Zip 或是 Git 的形式进行构建

通过单 Dockerfile 文件的形式构建镜像。

### 模板

> 基础镜像仓库：https://hub.docker.com/r/donknap/dpanel

DPanel 提供了 php、node、java、go、html 的基础的镜像。你可以在这些镜像的基础之上，构建出符合自己要求的镜像。

一般要遵循以下约定：

- 基础镜像采用 alpine 系统
- 持久存储位于 /app 目录，此目录下的文件都将会持久化存储
- 如果程序中需要对外暴露访问，一般是绑定到 80 端口，创建容器时再做端口映射
- 对于 java go node 需要启动脚本的程序，将启动脚本定义在 RUN_COMMAND 

### 演示

基于php基础镜像，安装 pdo_pgsql 和 intl 扩展。

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112516717612800&bvid=BV1duTLeSEn3&cid=500001562593429&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>