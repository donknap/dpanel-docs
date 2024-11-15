# 容器创建参数

### 基本配置
##### 绑定端口

配置容器对外暴露的端口。

| 外问访问端口 | 容器内端口 | 描述 | 
| --- | --- | --- |
| 8080 | 80 | 映射容器的 80 端口到宿主机的 8080 |
| 127.0.0.1:8080 | 80 | 端口只映射到 127.0.0.1 上 |
| 8080 | 80/udp | 映射udp端口 |
| 绑定 Host 网络 |  | 映射容器内的全部端口到宿主机 |
| 绑定全部端口 |  | 生成随机端口映射容器内的全部端口到宿主机 |
| IpV6 |  | 同时映射容器端口到 IpV6 |

##### 网络配置

> docker network create --driver bridge --subnet 192.168.100.0/24 --gateway 192.168.100.1 test \
> docker run ... --network test --ip 192.168.100.2 ...

创建容器时，同时创建网络并指定容器的 Ip。

### 关联配置

##### 关联容器

> --link {hostname}:目标关联容器 

通过关联容器，可以在两个容器间通过 hostname 进行互联。

##### 关联网络

> --network 网络名称 --ip ip地址

指定创建容器时需要加入的网络。在 DPanel 系统中，即使指定容器关联网络时，面板也会将容器加入 bridge 网络

##### 关联宿主机网络

> --add-host=host.dpanel.local:host-gateway --add-host=my13.local:192.168.1.101

配置将宿主机 ip 和 宿主机所在的网络中的主机 ip 注入到容器的 /etc/hosts 配置中。\
注入宿主机 ip 时应该使用 host-gateway 来替代。

### 存储配置

> -v testvolume:/home -v /home/test:/home/test

##### 默认存储

由 DPanel 面板自动新建存储卷，用于挂载镜像内声明的持久目录。

##### 自定义挂载或是存储卷

将宿主机文件或是目录挂载到容器内

### 运行配置

##### command、entrypoint、user、工作目录

> docker run ... --workdir /root --user root --entrypoint test.sh 镜像名 /bin/sh -c "tail -f"

指定容器的运行命令，为空时使用镜像内声明的值

### 资源配置

##### 日志

> --log-opt max-size=10m --log-opt max-file=3 

指定容器内的日志驱动及日志切割大小

### Hook 

##### 附加执行脚本

配置在容器创建后，执行的脚本。脚本只能配置单行。

| 时机 | 脚本示例 | 描述 | 
| --- | --- | --- |
| 容器创建后 | apk add php && touch index.html && php -S 0.0.0.0:80 | 在容器创建后，安装 php 包，在工作目录中生成 index.html 文件，启动 Http 服务。 |

##### 健康检查

> --health-cmd='curl -f http://localhost/' \
  --health-interval=10s --health-timeout=5s --health-retries=3 

| 脚本执行环境 | 脚本示例 | 描述 | 
| --- | --- | --- |
| 在 Docker 环境中执行 | curl -f http://localhost:80 | docker 将请求容器内的80端口地址，测试是否可以访问 |
| 在容器内执行 | curl -f http://localhost:80 \|\| exit 1 | 在容器内的 shell 环境中执行命令，依赖容器内是否有 curl 命令 |