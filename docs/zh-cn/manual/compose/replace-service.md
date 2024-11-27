# 替换 Compose 中的服务

Compose 带来极大便利的同时，有时候也产生了资源浪费的问题。

假如用 compose 部署两个 wordpress 项目，会产多个 mysql 数据库。\
但是在实际中，大部分的做法是让多个 wordpress 共用同一个 mysql 实例，用不同的数据库进行区分。

### 替换服务

假如在下面的 yaml 中，不想部署 db 服务，让 phpmyadmin 管理你已经存在的 localmysql。可以定义以下覆盖配置。\
在部署 compose 任务时，取消掉 db 服务的勾选，面板不再会部署 db 服务。

> 需要注意的 compose 中的 phpmyadmin 可以访问到 localmysql 时需要将他们加入到同一个网络中

```
services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    ports:
      - :3306
    environment:
      MYSQL_ROOT_PASSWORD: ${PASSWORD}
      MYSQL_DATABASE: ${DATABASE}
      MYSQL_PASSWORD: "123456"
    networks:
      - mysql-phpmyadmin
  phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin
    restart: always
    ports:
      - 8080:80
    environment:
      - PMA_HOST=db
      - MYSQL_ROOT_PASSWORD=password
    networks:
      - mysql-phpmyadmin
networks:
  mysql-phpmyadmin: null
volumes:
  db_data: null
```

#### 覆盖配置

```
services:
  phpmyadmin:
    depends_on: !reset
    external_links:
      - localmysql:db

```


