# 计划任务

> DPanel Version >= 1.4.0

### 添加计划任务

![image-container-1](//cdn.w7.cc/dpanel/container-cron-1.png)

#### 执行容器

因为 DPanel 面板是运行在容器中的，并不具有直接在宿主上运行脚本命令的权限。
在配置计划任务中，需要指定一个运行命令的容器，默认不指定为在 DPanel 面板容器中运行。

在 DPanel 面板中，可以直接使用 docker 、docker compose、curl、git 相关命令。
你也可以通过 apk add 命令添加自己需要的命令。

#### 怎么操作宿主机？

在 docker 中的容器，并不是不能操作宿主机，但是赋予的过大的权限会带来很大的安全风险，这也是 docker 守护进程一直被诟病的地方。
如果你不得不去操作宿主机时，完成后一定要将相关容器销毁。

通过新建特权容器来切换至宿主机的 namespace 中，下面以 busybox 镜像做为演示，新建一个代理容器。

##### 获取宿主机的网络信息

```
docker run -it --rm --name dpanel-host-proxy --pid host --privileged busybox \
nsenter --target 1 --net --mount -- /bin/sh -c "ip addr"
```

##### 获取 docker 的 daemon.json

```
docker run -it --rm --name dpanel-host-proxy --pid host --privileged busybox \
nsenter --target 1 --net --mount -- /bin/sh -c "cat /etc/docker/daemon.json"
```

##### 挂载宿主机根目录

```
docker run -it --rm --name dpanel-host-proxy -v /:/host busybox \
ls -al /host
```


#### 执行周期

兼容 Linux 计划任务表达式，扩展了 **秒** 级参数，

```
* * * * * *     dpanel 中支持的计划任务表达式
------------------------------------------
│ │ │ │ │ │
│ │ │ │ │ └────── 一周当中的某天 (0 - 7) (周日为 0，周一为 1 .... 周六为 6)
│ │ │ │ └──────── 月份 (1 - 12)
│ │ │ └────────── 一月当中的某天 (1 - 31)
│ │ └──────────── 时 (0 - 23)
│ └────────────── 分 (0 - 59)
└──────────────── 秒 (0 - 59)
```

##### 预设周期

面板为了方便大家使用预设了一些常用的周期字段：

- 每月 每月的某日某时某分执行
- 每周 每周几的某时某分执行
- 每天 每天的某时某分执行
- 每小时 每小时的某分执行
- 每 N 日 从当月的1号开始，隔 N 日的某时某分执行
- 每 N 时 从当天的0点开始，隔 N 时的某分执行
- 每 N 分 每小时从0分开始，隔 N 分执行
- 每 N 秒 每分钟从0秒开始，隔 N 秒执行
- 自定义 根据上方的计划任务表达式，自定义执行周期


#### 等待本次任务执行

开始本项配项后，只有上一次任务执行完成后，才会进行下一次任务。
避免了单个任务执行时间过长，导致任务重复执行。

#### 保留日志数量

保留执行的结果日志，默认为 10 条。执行时可能会产生大量的结果数据，不建议将此值配置的过多。

#### 执行脚本&环境变量

面板的计划任务允许你在配置脚本的同时，也配置一些环境变量参数。用来将脚本中的一些参数进行替换。

同时你也可以使用【[脚本模板](/zh-cn/manual/setting/cron-template)】的功能用来管理你的常用脚本。

##### 演示

定义以下脚本，并在环境变量中，配置 CONTAINER_NAME 参数即可。

```
docker restart ${CONTAINER_NAME}
```