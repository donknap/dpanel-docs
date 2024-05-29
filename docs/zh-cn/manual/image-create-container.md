# 通过容器导出创建

通过导出容器创建镜像可以让你从繁琐的编写 Dockerfile 文件中解脱出来。

你只需要正常配置系统、运行环境、添加代码就可以完成一个镜像的构建。

以这样的方式构建出一镜像与 Dockerfile 产生的镜像是一样的。

#### 与 Dockerfile 构建的区别

Dockerfile 是先记录你的命令，然后在构建的时候执行。而使用此方法是把你的执行结果转化成镜像。

### CMD

通过导出容器创建镜像时，必须指定启动 CMD 命令，否则通过该镜像创建容器时会无法正常启动。

### WorkDir

配置导入后的镜像工作目录，一般会指定到程序运行的目录，比如 /app、/home 

### 暴露端口

配置导入后的镜像需要向外部暴露访问的端口，一行配置一个端口。例如：9000

### 环境变量

配置导入后的镜像需要用户配置的环境变量，一般用于配置数据库、redis 之类的外部依赖。

### 存储卷目录

配置导入后的镜像需要持久化存储的目录，一般用于配置附件存储目录。

### 演示

> 演示项目：https://github.com/eshengsky/iBlog

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112523575624705&bvid=BV1keKZeSEm4&cid=500001564141937&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
