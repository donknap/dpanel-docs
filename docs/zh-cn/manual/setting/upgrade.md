# 更新 DPanel 面板

更新 DPanel 面板时，面板无法自己去更新自己，需要在宿主机上采用命令的形式进行更新。

更新面板操作实际上就是重新拉取镜像并重建 dpanel 容器。

在此操作中，你要保证重新时容器的 /dpanel 目录还是挂载到之前的存储卷或是路径中。

### 使用 docker run 命令更新

可以通过 【系统】 -> 【系统更新】 菜单，获取面板更新脚本命令。

更新脚本中会自动获取 dpanel 容器的安装参数，并生成更新命令。

### 使用 docker compose 更新

如果你使用的是 dpanel/dpanel:latest 或是 dpanel/dpanel:lite，直接重新拉取镜像再次部署即可。\
否则需要先修改 compose.yaml 中的镜像标签。

```
# 修改镜像标签为最新版本
image: dpanel/dpanel:修改为你想要部署的标签
```

执行重新部署命令

```
docker compose pull 
docker compose up -d
```


### 手动更新系统

#### 获取当前面板的存储卷

> dpanel 名称可以根据实际情况替换成你实际创建的面板名称

```
docker inspect --format '{{range .Mounts}}{{if eq .Type "volume"}}{{.Name}}{{end}}{{end}}' dpanel

// 输出示例：重建的时候需要指定此值
// 2b6e4485e9729638d68ce6d14fdd2f82e6890bec16dee888f2cacd4a033ae856
```


#### 停止并且删除 DPanel 容器和镜像

> 镜像名称使用实际构建容器采用的镜像名称

```
docker stop dpanel && docker rm dpanel && docker rmi dpanel/dpanel:latest
```

#### 重新创建 DPanel 容器

> 重新创建时为了保证之前的已有的数据需要指定存储卷名

```
docker run -it -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v 上方获取的存储卷名称:/dpanel \
 dpanel/dpanel:latest
```