# 环境变量

#### 创建&编辑任务时

```
services:
  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      MYSQL_DATABASE: 
      MYSQL_PASSWORD: "123456"
```
在 compose 中可以定义服务所用到的环境变量，这些环境变量在添加任务的时候，可以通过【管理】服务进行修改。

![compose-env](https://cdn.w7.cc/dpanel/compose-env-1.png)

#### 运行时修改

在部署 compose 任务的时候，也可以再次对环境变量进行修改。

![compose-env](https://cdn.w7.cc/dpanel/compose-env-2.png?a=1)

#### 多 Docker 环境

如果你有多个【[Docker 环境](zh-cn/manual/setting/docker-env)】在部署你也可以为每个环境新建私有的【[覆盖配置](/zh-cn/manual/compose/override)】。\
多环境的覆盖配置文件以 环境名.yaml 或是 环境名.yml 命名。

假设你当前有两个 docker 环境，分别是 local 及 remote。那么你可以通过下面的方式为每个环境创建私有的覆盖配置。\
环境级别的覆盖配置优先级最高，你可以在环境配置中对 yaml 中的任何配置进行修改。

```
/dpanel
├─ /compose
│  ├─ /lucky                                     
│  │  ├─ 1.override.yaml                      自定义的覆盖配置
│  │  ├─ local.yaml                           local 环境的私有配置
│  │  ├─ remote.yaml                          remote 环境的私有配置
│  │  └─ compose.yaml
│  └─ ... 
└─ ....
```

