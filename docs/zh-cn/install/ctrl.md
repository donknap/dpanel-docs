# 面板控制命令

> DPanel Version >= 1.2.2

控制命令需要进入 DPanel 面板容器运行。

```
docker exec -it dpanel /bin/sh
```

### 重置管理员用户

#### 重置密码

```
/app/server/dpanel -f /app/server/config.yaml user:reset --password 123456
```

#### 重置用户名

> 重置用户名时，必须指定命令

```
/app/server/dpanel -f /app/server/config.yaml user:reset --password 123456 --username root
```