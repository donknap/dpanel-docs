# 环境变量

### 定义方式

在 compose 中的环境变量分为两种：

- 直接在某个服务中定义的环境变量
- 通过 --env-file 指定环境变量文件

##### 在服务中定义环境变量

```
services:
  nginx:
    image: nginx
    environment:
      PASSWORD: 123456
```

在上面的例子中，对 nginx 服务定义了一个环境变量。在创建容器后，定义的值会注入到容器的环境变量中。


##### 在 .env 文件中定义

```
services:
  nginx:
    image: nginx
    environment:
      PASSWORD:          # 假如这里的值不为空，则下方的 .env 文件定义的无效
```

在上面的例子中，在 mysql 服务中声明了一定环境变量，但是款对其赋值。这时候可以新建 .env 文件对其赋值。

```
PASSWORD=789456
```

### 多个服务环境变量同名的问题

```
services:
  nginx:
    image: nginx
    environment:
      PASSWORD:
  mysql:
    image: mysql
    environment:
      PASSWORD:
```

在上方的例子中，两个服务中都使用了 PASSWORD 环境变量，这时候在 .env 文件中定义的值同时会影响到这两个服务。\
这样全局式的环境变量有时候并不是期望的效果，如果希望可以分别指定，需要在在定义的环境变量上再加一层【环境变量】。


```
services:
  nginx:
    image: nginx
    environment:
      PASSWORD: ${NGINX_PASSWORD}
  mysql:
    image: mysql
    environment:
      PASSWORD: ${MYSQL_PASSWORD}
```

```
NGINX_PASSWORD=123456
MYSQL_PASSWORD=789456

```

### 使用环境变量区分环境差异

如果你有多个【[Docker 环境](/manual/setting/docker-env)】在部署希望根据不同的环境使用不同的镜像版本，可以给 image 声明一个环境变量。

```
services:
  nginx:
    image: ${NGINX_IMAGE}
    environment:
      PASSWORD: 123456
```

这样在部署的时候就可以动态的调整应该使用哪个镜像来部署，对于 compose.yaml 中其它的参也可以通过此方便来定义。


### 面板中如何定义？

要创建 compose 任务时，面板会自动查找 yaml 中的环境变量，并生成列表。\
在创建任务的时候，你需要给这些值定义其默认值。

![compose-env-3](https://cdn.w7.cc/dpanel/compose-env-3.png)

在部署的时候，可根据当前的情况进行重定义，重定义操作只会影响到本次部署。

![compose-env-3](https://cdn.w7.cc/dpanel/compose-env-4.png)
