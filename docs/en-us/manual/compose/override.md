# 创建覆盖配置

### 使用场景

在使用远程 yaml 或是应用商店创建 Compose 任务时，有时候需要修改 compose.yaml 中的一些参数，比如：端口、挂载目录等配置。

如果直接去修改 compose.yaml 就会导致，当应用作者发布新版后修改了部分 compose.yaml 的配置，比如增加了一些新的挂载目录。
那么，就需要人工去合并这部分的差异。

这时候使用【新建覆盖 yaml】的方式去新建一个新的的 yaml 文件把配置追加、覆盖到原始的 yaml 文件中。
就不会影响到原始的 compose.yaml 文件，可以随时的更新、替换。


### 创建覆盖配置文件

> 覆盖配置文件只需要新建需要变更的配置

![compose-override-yaml.png](https://cdn.w7.cc/dpanel/compose-override-yaml.png)

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

> 群辉不或是老旧 docker 版本不支持此配置，如果有覆盖操作需要直接原始文件

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
