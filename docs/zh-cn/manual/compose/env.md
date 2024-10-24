# 环境变量

在 compose 中提供了通过外部环境变量的形式去管理文件中的配置。

```
services:
  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: ${PASSWORD}
      MYSQL_DATABASE: ${DATABASE}
      MYSQL_PASSWORD: "123456"
```

你可以将配置文件中一些需要外部配置或是敏感的信息通过环境变量的形式来定义。

这些配置信息 DPanel 会自动发现并生成相应的列表。

![compose-env](https://cdn.w7.cc/dpanel/compose-env.png)


#### 环境量变定义

在 yaml 文件中使用 ${变量名} 的方式定义环境变量。你也可以使用 ${变量名-123456} 来给这些环境变量配置初始值。