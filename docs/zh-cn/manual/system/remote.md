# 远程管理docker客户端

## 使用 HTTP

### 修改 docker 启动参数

```
systemctl edit docker
```

或直接创建覆盖配置文件 

```
sudo vi /etc/systemd/system/docker.service.d/override.conf
```

##### 添加配置

```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H fd:// --containerd=/run/containerd/containerd.sock
```

##### 重启 docker 服务

```
systemctl daemon-reload && systemctl restart docker
```

## 使用 HTTPS （开启 TLS ）

### 生成证书

```shell
#!/bin/sh

DOMAIN=$1
IP=$2

openssl genrsa -aes256 -out ca-key.pem 4096
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
openssl genrsa -out server-key.pem 4096
openssl req -subj "/CN=$DOMAIN" -sha256 -new -key server-key.pem -out server.csr
echo subjectAltName = DNS:$DOMAIN,IP:$IP >> extfile.cnf
echo extendedKeyUsage = serverAuth >> extfile.cnf
openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
-CAcreateserial -out server-cert.pem -extfile extfile.cnf
openssl genrsa -out key.pem 4096 && \
openssl req -subj '/CN=client' -new -key key.pem -out client.csr && \
echo extendedKeyUsage = clientAuth > extfile-client.cnf
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out cert.pem -extfile extfile-client.cnf
chmod -v 0400 ca-key.pem key.pem server-key.pem && \
chmod -v 0444 ca.pem server-cert.pem cert.pem
``` 

新建 docker-ca.sh 文件，并将上述的脚本内容写入到文件中，并添加执行权限。

```
chmod 755 docker-ca.sh
```

##### 生成证书

```
./docker-ca.sh 域名 服务器Ip
```

##### 修改 docker 启动参数

```
systemctl edit docker
```

##### 添加 TLS 证书配置

```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --tlsverify --tlscacert=/root/docker-ca/ca.pem --tlscert=/root/docker-ca/server-cert.pem --tlskey=/root/docker-ca/server-key.pem -H tcp://0.0.0.0:2376 -H fd:// --containerd=/run/containerd/containerd.sock
```

##### 重启 docker 服务

```
systemctl daemon-reload && systemctl restart docker
```