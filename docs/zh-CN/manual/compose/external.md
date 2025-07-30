# 管理非面板创建任务

对于非面板创建的 compose 项目，如果想通过 DPanel 面板进行管理，你需要保证面板可以访问到相关 compose 的 yaml 文件。\
你可以通过挂载单个 yaml 文件或是将整个 compose 目录挂载到面板容器中。

将整个目录挂载到面板容器中需要符合面板的目录规范，具体可以查看【[存储目录](/manual/compose/create?id=通过挂载存储路径的方式创建)】。

### 挂载单个 Yaml

#### 查找 compose 任务使用的 yaml 文件

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
my-compose          running(1)          /home/test1.yaml,/home/test2.yaml
```


#### 挂载该文件到面板容器中


将此 yaml 文件挂载到面板容器中，并保持路径相同，面板即可管理该 compose 项目。

```
docker run -d -it --name dpanel ...(省略其它参数)... \
-v /home/test1.yaml:/home/test1.yaml -v /home/test2.yaml:/home/test2.yaml \
dpanel/dpanel:latest
```

### 在 compose 中新建外部任务

按规范新建下方目录

```
/dpanel
├─ /compose
│  ├─ /my-compose   
│  │  └─ compose.yaml                 该项目的主 yaml 文件，内容为 test1.yaml
│  └─ ... 
└─ ....
```

### 删除外部任务

外部任务的 yaml 并非由面板管理，所以在删除外部任务时等同于删除该 compose 下的所有容器。
对于残余的 yaml 文件，需要手动进行删除。