# 通过基础镜像创建

DPanel 提供了一些常用的基础镜像帮助快速的创建未提供镜像的程序。

这种创建的方式偏向于传统的网站部署模式，先创建环境，上传代码，完成部署。

你也可以将此容器导出成镜像，二次部署或是传播给其他人使用。


### 存储

容器的无状态的，如果需要持久化存储就需要使用 Volume 或是挂载宿主机目录。

在这里 DPanel 将 /app 目录挂载到了 Volume 存储上，并与站点标识进行了关联。

只要站点标识不变无论更新重建多少次，数据依然可以保留。

### 基础镜像

仓库地址：https://hub.docker.com/r/donknap/dpanel

#### php

- donknap/dpanel:php-72
- donknap/dpanel:php-74
- donknap/dpanel:php-81

#### node

- donknap/dpanel:node-12
- donknap/dpanel:node-14
- donknap/dpanel:node-16
- donknap/dpanel:node-18

#### java

- donknap/dpanel:java-8
- donknap/dpanel:java-11
- donknap/dpanel:java-12

#### html

- donknap/dpanel:html-common

#### go

- donknap/dpanel:go-1.21

# 演示

### 通过创建 Wordpress（Php） 演示如何创建未提供镜像的应用

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112489120140032&bvid=BV1kyu6eYEtk&cid=500001555819395&p=1" scrolling="no" border="0" frameborder="no" height="600" framespacing="0" allowfullscreen="true"></iframe>

### 通过创建 SurveyKing (Java) 演示如何创建未提供镜像的应用

#### RUN_COMMAND 启动命令

```
java -jar /app/surveyking-v1.7.2.jar
```

#### 配置文件 application.properties

```
spring.application.name=SurveyKing
server.port=1991
spring.datasource.url=jdbc:mysql://mysql-1.pod.dpanel.local:3306/surveyking
spring.datasource.username=root
spring.datasource.password=123456
```

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112489383265024&bvid=BV1dju6ePEwL&cid=500001555892578&p=1" scrolling="no" border="0" frameborder="no" height="600" framespacing="0" allowfullscreen="true"></iframe>