# 创建覆盖配置

在使用远程 yaml 或是应用商店创建 Compose 任务时 \
通中为了保证原始的 yaml 文件可以随时的更新，一般不直接对原始 yaml 文件进行修改。 

但是在部署 compose 时，大多数情况又需要针对自己的情况去修改诸如端口、存储等参数。\
这时候使用【新建覆盖 yaml】的方式去新建一个差异的 yaml 文件覆盖到原始的 yaml 文件中。


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
