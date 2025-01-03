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

添加配置时，需要以你实际的环境配置为准，获取到原始的配置信息

```
cat /lib/systemd/system/docker.service

#### 输出以下内容
....

[Service]
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

```

将 ExecStart 中的内容复制出来，增加 -H tcp://0.0.0.0:2375 的相关内容
完整的配置类似以下内容：


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

> 没有域名时，全部填入 Ip 即可

```
./docker-ca.sh 域名 服务器Ip
```

```
Enter pass phrase for ca-key.pem: 输入证书密码
Verifying - Enter pass phrase for ca-key.pem: 再次证书密码
Enter pass phrase for ca-key.pem: 输入证书密码

####### 以下内容根据情况输入或是直接回车 ############
Country Name (2 letter code) [XX]:CN
State or Province Name (full name) []: 
Locality Name (eg, city) [Default City]:
Organization Name (eg, company) [Default Company Ltd]:
Organizational Unit Name (eg, section) []:
################################################


Common Name (eg, your name or your server's hostname) []: 这里必须填写服务器的ip
Email Address []: 填入邮箱地址

Enter pass phrase for ca-key.pem: 输入证书密码
```

##### 证书文件

ca.pem cert.pem key.pem 三个文件在面板中添加客户端时需要

ca.pem server-cert.pem server-key.pem 则在 docker 服务端开启 tsl 连接时需要

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