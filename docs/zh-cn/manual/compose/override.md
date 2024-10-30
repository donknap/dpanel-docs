# 创建覆盖配置

在使用第三方的 compose yaml 文件时，大多数我们需要针对自己的情况去修改诸如端口、存储、环境变量等参数。

直接去修改第三方的 yaml 文件又显示的不够优雅。后续升级 yaml 文件内容时又要对比对文件。\
或是在传递给其他人时，容易泄漏一些自己的配置信息。


### 创建覆盖配置文件

在 DPanel 面板中约定在同级目录中的以 override.yaml 或是 override.yml 结尾的文件为覆盖文件。

在部署项目时会连带主 yaml 文件一同加载进行部署。

> 如果有多个 override.yaml 文件，需要有加载顺序时，请用字典顺序命名。例如 1.override.yaml 2.override.yaml

如果你有多个 docker 环境，也可以创建【[环境覆盖配置](/zh-cn/manual/compose/env?id=多-docker-环境)】来为每个环境进行适配。

### 覆盖配置

假设原始的 yaml 文件内容为

```
name: easyimage
services:
  easyimage:
    image: ddsderek/easyimage:latest
    ports:
      - target: 80
        published: '8080'
        protocol: tcp
    restart: unless-stopped
    volumes:
      - type: bind
        source: /DATA/AppData/easyimage/config
        target: /app/web/config
      - type: bind
        source: /DATA/AppData/easyimage/i
        target: /app/web/i
    environment:
      TZ: Asia/Shanghai
      PUID: '1000'
      PGID: '1000'
      DEBUG: 'false'
```

#### 新增配置

新增一个端口映射，可以配置为，部署时将同时映射 80 及 88

```
services:
  easyimage:
    ports:
      - 8888:88
```

#### 更改配置

更改映射目录，其中一个重新指向宿主机目录，一个指向存储卷

```
services:
  easyimage:
    ports:
      - 8888:88
    volumes:
      - /home/easyimage/config:/app/web/config
      - easyimage_i:/app/web/i
volumes:
  easyimage_i:
    name: easyimage_i
```

#### 强制覆盖配置

假如目标配置像是【存储配置】这种配置不能包含重复值时，覆盖时会将更改原有配置。

但是如果是【映射端口】这种配置可以包含多个重复值时，此进覆盖配置将会变成**新增配置**

```
# 此覆盖配置，最终会映射到 8888 9999 8080
services:
  easyimage:
    ports:
      - 8888:88
      - 9999:80
```

```
# 采用 !override 的写法，最终只会映射 8888 及 9999
services:
  easyimage:
    ports: !override
      - 8888:88
      - 9999:80
```

#### 清空配置

采用 !reset 的写法，可以将映射端口配置清空掉，不暴露任何端口。

```
services:
  easyimage:
    ports: !reset
```
