# Via CLI

!> In order to isolate permissions, the DPanel automatically creates a dpanel-plugin-explorer container when managing container files. \
The dpanel-plugin-explorer container does not expose any ports, and the DPanel will automatically remove this container after you close all pages.\
The dpanel-plugin-explorer container uses the alpine image. You can also [manually create](/en-us/install/docker?id=manually-create-the-dpanel-plugin-explorer-container) and keep the name dpanel-plugin-explorer.\
If there is no dpanel-plugin-explorer container DPanel will be automatically created. If you cannot accept this, please do not use the [File Explorer] function.！！！！ 

> Macos you need to link the docker.sock file to the /var/run/docker.sock directory first\
> sudo ln -s -f /Users/Your Name/.docker/run/docker.sock /var/run/docker.sock \

> Windows Please run the command in WSL

###### [:rocket::rocket::rocket: Use the install script to quickly install or upgrade the DPanel container](/en-us/install/shell)

#### Standard Edition

When creating a DPanel container, please modify the mapping port according to the actual situation. The DPanel cannot bind to the host network <span style="color: red"> (do not use the --network host parameter!!!) </span> \
The Standard Edition provides nginx proxy-pass and TLS certificate, which require binding to ports 80 and 443. If you do not need these functions, please install the Lite Edition

```
docker run -d --name dpanel --restart=always \
 -p 80:80 -p 443:443 -p 8807:8080 \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel -e APP_NAME=dpanel dpanel/dpanel:latest
```

#### Lite Edition

> The Lite Edition and the Standard Edition differ only in the image address. Except that the mapping of ports 80 and 443 is not required, the other configurations are the same. The command all take the Standard Edition as an example. Please replace the image address.

The Lite Edition of the image does not contain nginx, acme.sh and other related components. If domain name forwarding is required, please use external tools.


```
docker run -d --name dpanel --restart=always \
 -p 8807:8080 -e APP_NAME=dpanel \
 -v /var/run/docker.sock:/var/run/docker.sock \
 -v /home/dpanel:/dpanel dpanel/dpanel:lite
 ```

#### Mount docker.sock File

When creating a DPanel, you need to mount the docker.sock file for docker api. If your docker does not use the default /var/run/docker.sock file, you can specify the sock file to mount when creating it.

If the sock file found is incorrect, please manually find the correct sock file address to mount or use TCP to connect to docker.

##### Find docker.sock File

```
docker context inspect $(docker context show)  --format '{{.Endpoints.docker.Host}}'

# show the docker.sock file location
# unix:///Users/test/.docker/run/docker.sock
```

##### Mount file

```
docker run -d --name dpanel ... -v /Users/test/.docker/run/docker.sock:/var/run/docker.sock dpanel/dpanel:latest
```

##### Podman

```
docker run -d --name dpanel ... -v /run/podman/podman.sock:/var/run/docker.sock dpanel/dpanel:latest
```

 #### Custom Management Port

By default, after the DPanel is installed, the management url is http://127.0.0.1:8807. \
You can also use the -p parameter to specify the management port.

```
docker run -d --name dpanel ... -p port:8080 dpanel/dpanel:latest
```

#### Http(s) Proxy

Configure the proxy address in the container through environment variables \
If the proxy address is the host, do not use 127.0.0.1 or localhost, these addresses point to the container itself rather than the host, please use the host LAN address.

```
docker run -d --name dpanel ... -e HTTP_PROXY="http://192.168.0.2:7890" -e HTTPS_PROXY="http://192.168.0.2:7890" dpanel/dpanel:latest
```

#### Login Jwt Secret

> This value must be configured when executing the DPanel [Control Command](). Please be sure to use a strong password when configuring.

```
docker run -d --name dpanel  ... -e DP_JWT_SECRET=test123ABC  dpanel/dpanel:latest
```

#### Volume

> If you need to mount a compose yaml file or use a relative path in compose yaml, be sure to mount the /dpanel directory to the host and create a new compose task in the directory. See [Create Compose task](zh-cn/manual/compose/create?id=通过挂载存储路径的方式创建)

The DPanel will generate some data when running and store it in the /dpanel directory in the DPanel container. If the directory is not mounted when creating, Docker will automatically generate a storage volume for the directory \

If you want to customize the directory mounted to the host, you can modify the -v parameter.

The volume mount directory must be an absolute directory. If the directory does not exist, it will be created automatically. For example: -v /root/dpanel:/dpanel

```
docker run -d --name dpanel  ... -v /home/somepath:/dpanel dpanel/dpanel:latest
```

#### Admin Account

After creating the DPanel container, you need to configure the admin account for the first time. If you forget your password, you can use [Reset Username and Password](/zh-cn/install/ctrl?id=重置管理员用户)


#### Run With Binary

> It is recommended that you create panels using containers, which is more compatible.

The DPanel also supports run with binary. You can configure the default Docker Engine after creating the panel, [Configuring the default Docker Engine](/zh-cn/manual/setting/docker-env?id=配置默认-docker-环境)

#### DPanel Container Name

> The DPanel uses dpanel as the container name by default

If you want to change the DPanel container name or install multiple panels at the same time, you can specify the APP_NAME environment variable to the specified container name in the installation command.

```
docker run -d --name dpanel-lite ... -e APP_NAME=dpanel-lite dpanel/dpanel:lite
```

```
docker run -d --name dpanel-test ... -e APP_NAME=dpanel-test dpanel/dpanel:latest
```

#### Host Ip Address

- In the DPanel container you can access the host through host.dpanel.host, 127.0.0.1 refers to the DPanel container itself.

```
docker run -d --name dpanel ... --add-host=host.dpanel.local:host-gateway dpanel/dpanel:latest
```

#### Upgrade & Recreate

The difference between updating and re-creating is whether to keep the directory data (/dpanel) previously mounted on the panel container. If you delete the host mount directory or re-specify the directory, the panel is re-created.

If you keep the original mount directory data and mount configuration, rebuilding the panel container means upgrading. [See the panel upgrade command](/zh-cn/manual/setting/upgrade)

#### Manually create the dpanel-plugin-explorer container

When manually creating or editing a dpanel-plugin-explorer container, specify container label com.dpanel.container.auto_remove=true,the DPanel will automatically clean up the container after browser is closed. If it is configured to false, it will not be cleaned up.

```
docker run -it -d --name dpanel-plugin-explorer --restart always --pid host --label com.dpanel.container.title="dpanel 文件管理助手" --label com.dpanel.container.auto_remove=false alpine
```