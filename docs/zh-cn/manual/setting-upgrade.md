# 更新 DPanel 面板

> 普通容器可以通过 [容器更新](/zh-cn/manual/container-update) 升级容器到最新的镜像。

更新 DPanel 面板时，无法通过面板自己更新自己，需要在外部采用命令的形式进行更新。

### 获取更新脚本

可以通过 【系统】 -> 【系统更新】 菜单，获取面板更新脚本命令。

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
 -p 80:80 -p 443:443 -p 8807:8080 --network dpanel-local \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v 上方获取的存储卷名称:/dpanel \
 dpanel/dpanel:latest
```