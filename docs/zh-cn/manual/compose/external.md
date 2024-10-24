# 管理非面板创建任务

对于非面板创建的 compose 项目，面板并没有管理权限。

你可以通过挂载该项目 yaml 文件，让面板可以找到该文件并进行管理。

### 查找外部任务的 Yaml

```
docker compose ls
```
或

```
docker compose ls --filter name=项目名称
```

> CONFIG FILES 为该项目的 yaml 文件，可能会包含多个文件


```
NAME                STATUS              CONFIG FILES
compose             running(1)          /home/workspace/docker/compose/test1.yaml
```


### 挂载该文件到面板容器中

将此 yaml 文件挂载到面板容器中，并保持路径相同，面板即可管理该 compose 项目。

```
docker run -d -it --name dpanel ...(省略其它参数)... -v /home/workspace/docker/compose/test1.yaml:/home/workspace/docker/compose/test1.yaml dpanel/dpanel:latest
```