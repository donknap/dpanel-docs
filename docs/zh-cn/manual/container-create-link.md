# 创建关联容器

> 关联容器是指创建容器时需要依赖其它容器

这里通过创建 mysql 和 phpmyadmin 演示如何创建容器关联

### 配置

#### Mysql

创建时需要指定 MYSQL_ROOT_PASSWORD 环境变量，初始化数据库 root 密码，否则服务无法启动

#### Phpmyadmin

创建时需要关联对应的 Mysql 容器，系统将会给每一个容器分配一个内部 Host，容器之间可通过此 Host 进行互相访问

创建 Phpmyadmin 容器时，需要将 PMA_HOST 环境变量指定为 Mysql 的内部 Host

### 网络

#### 默认网络

Docker 会给每一个容器创建一个默认的 bridge 网络。你也可以不关联容器，直接通过默认网络中配置的容器 Ip 进行互联。

但是并不推荐这样做，因为容器重启后，其 Ip 地址会发生变化。直接使用 Ip 可能会造成无法访问的问题。

#### 关联网络

DPanel 会将关联的容器放置到同一个网络中，将配置独立的 Host。

Host 命令规则为 **容器标识.pod.dpanel.local**


# 演示

<iframe src="//player.bilibili.com/player.html?isOutside=true&aid=112488916716288&bvid=BV1nfu6eNEsi&cid=500001555764866&p=1" scrolling="no" border="0" height="600" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>