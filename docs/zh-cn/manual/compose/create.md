# 使用 compose 创建容器

![compose-create](https://cdn.w7.cc/dpanel/compose-create.png)

### 站点标识

用于标识 compose 创建后的项目名称，当同一个 compose.yaml 部署多个项目时，用站点标识进行区分。

### yaml 来源

#### 通过应用商店创建

> 默认情况下【应用商店】菜单会不会显示出来，需要你先添加一个第三方的应用商店。[如何添加？](/zh-cn/manual/setting/store)

![compose-store-1](https://cdn.w7.cc/dpanel/compose-store-1.png)

点击安装后，会跳转至 Compose 【创建任务】页面，完善、修改环境变量及相关信息就可以进行部署容器。

通过应用商店安装后，相关的文件会同步至 /dpanel/compose 目录中。\
为了保证应用商店中的 yaml 文件可以随时更新，在修改 yaml 配置时建议采用[【覆盖配置】](/zh-cn/manual/compose/override)

#### 通过 yaml 文本创建

在 DPanel 面板中，你可以直接通过 yaml 文本创建一个 compose 任务进行部署容器。

任务创建后，yaml 文件会保存于面板的数据库中。你可以在列表中【下载】该 yaml 文件。

#### 通过远程地址创建

面板支持直接采用一个远程的 yaml 文件地址进行创建任务。

每次部署时，面板会从远程地址拉取到最新的文件内容，以保证该 yaml 文件可以时刻保持最新状态。

通过此方法，你可以快速的部署远程的 compose 应用商店的项目。并随时保持最新的状态。

##### 示例

将 github 中的 CasaOs 应用商店中的 easyimage 项目添加为 compose 任务

```
https://raw.githubusercontent.com/Cp0204/CasaOS-AppStore-Play/refs/heads/main/Apps/easyimage/docker-compose.yml
```

#### 通过挂载存储路径的方式创建

在创建 DPanel 面板时，你可以将面板的 /dpanel 目录挂载到宿主机的某个路径。

将项目放置到 /dpanel/compose 中，面板将会自动发现这些目录并创建对应的 compose 任务。

每一个项目必须创建一个子目录，该目录的名称即为【站点标识】。子目录中包含 docker-compose.yaml docker-compose.yml compose.yaml compose.yml 文件。

##### 示例

目录结构如下：

```
/dpanel
├─ /compose
│  ├─ /easyimage                                  项目子目录，目录名即为标识
│  │  ├─ docker-compose.yaml                      该项目的 compose yaml 文件
│  │  └─ docker-compose-override.yaml             自定义覆盖配置文件，以 override.yaml override.yml 结尾
│  ├─ /lucky                                     
│  │  └─ compose.yaml
│  ├─ /qinglong                                   其它项目
│  │  └─ compose.yml
│  └─ ... 
└─ ....
```

#### 多 Docker 客户端数据隔离

> DPanel Version > 1.5.1

默认情况下，多个 docker 客户端是共享 compose 任务数据，即你创建一个 compose 任务后，这些数据可以在每个客户端进行部署。\
在一些功能类似的多 docker 客户端中，共享数据可以带来极大的方便。

面板同时支持给任意一个远程的 docker 客户端配置独立的 Compose 目录，用于数据的隔离。

##### 开启配置

查看【[管理远程客户端](/zh-cn/manual/setting/docker-env?id=开启独立-compose-目录)】开启独立目录

独立 compose 目录以 compose- 为前缀，以当前环境名称结尾。\
例如：远程 docker 环境名为 test123，则目录名称为 compose-test123。其内部结构与默认的 compose 目录一致。



