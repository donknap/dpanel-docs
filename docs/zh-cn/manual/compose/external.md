# 管理非面板创建任务

对于非面板创建的 compose 项目，需要将 compose.yaml 文件挂载到目录中

你可以通过挂载该项目 yaml 文件或是将外部任务的 yaml 根据规范添加到【[存储目录](zh-cn/manual/compose/create?id=通过挂载存储路径的方式创建)】中，让面板可以找到该项目的 yaml 文件并进行管理。

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