# 面板控制命令

> DPanel Version >= 1.2.2

控制命令需要进入 DPanel 面板容器运行。如果你更改了 DPanel 面板的容器名称，请将下方命令中的 dpanel 替换成你的名字

1. 登录服务器的 ssh 
2. 通过 docker exec 命令执行 DPanel 容器中的控制命令
3. 根据需求，执行对应的命令

### 重置管理员用户

#### 快速重置

将使用随机密码重置用户

```
docker exec dpanel ./dpanel -f config.yaml user:reset
```

#### 重置密码

```
docker exec dpanel ./dpanel -f config.yaml user:reset --password 123456
```

#### 重置用户名

> 重置用户名时，必须指定用户名

```
docker exec dpanel ./dpanel -f config.yaml user:reset user:reset --password 123456 --username root
```


### 更新应用商店数据

- \--name 指定应用商店名称

```
docker exec dpanel ./dpanel -f config.yaml store:sync --name storename
```