# 绑定宿主机网络

容器创建之后可以通过【宿主机的内网ip】或是【127.0.0.1】加端口的形式进行访问。

在 docker 内，也可以给容器配置 macvlan 或是 ipvlan 分配一个宿主机所在网络的 ip 进行访问。

### 开启网卡混杂模式

##### 查找宿主机的网卡名称

```
ifconfig 
```

执行命令后找到配置宿主机 ip 的网卡数据，类似于以下数据。其中 enp1s0 就为宿主机的网卡名称。

在大部分 linux 系统中，宿主机的网卡名称为 eth0。

```
enp1s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.16.1.124  netmask 255.255.255.0  broadcast 172.16.1.255
        inet6 fe80::b62e:99ff:fe6a:8e70  prefixlen 64  scopeid 0x20<link>
        ether b4:2e:99:6a:8e:70  txqueuelen 1000  (Ethernet)
        RX packets 295362  bytes 192208893 (192.2 MB)
        RX errors 0  dropped 351  overruns 0  frame 0
        TX packets 193183  bytes 148448289 (148.4 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

##### 开启混杂模式

```
sudo ip link set dev enp1s0 promisc on
```

### 创建 macvlan 或是 ipvlan 网络

![home.png](https://cdn.w7.cc/dpanel/container-bind-host-network-1.png)

通过【存储&网络】-【网络管理】-【创建网络】创建一个 macvlan 或是 ipvlan 类型的网络。

- 父网卡指定为宿主机的网卡名称，在本例中就是 enp1s0。
- 子网配置为宿主机的子网。

##### 子网

以 192.168.0.0 为例

使用 192.168.0.0/16 时表示你的俺码为 255.255.0.0，可用 ip 范围是 192.168.0.1 到 192.168.255.254。\
使用 192.168.0.0/24 时表示你的掩码为 255.255.255.0 可用 ip 范围是 192.168.0.1 到 192.168.0.254。

在本例中，宿主机的 ip 为 172.16.1.124，掩码为 255.255.255.0，所以这里子网应该配置为 172.16.1.0/24。

具体配置根据实际情况来决定。


### 新建容器添加网络

新建容器后，通过【容器关联信息】-【加入已有网络】将容器添加到刚才添加的的网络中，并指定与宿同网段的 ip。\
容器即可通过指定的 ip 进行访问。

需要注意的是，通过此方法容器并不需要再暴露容器内部的端口。

![home.png](https://cdn.w7.cc/dpanel/container-bind-host-network-2.png)

### 宿主机访问容器

通过上述的方法已经可以实现局域网内的主机通过自定义的 ip 访问到容器内部端口。\
但是宿主机并不能正常请求。

宿主机还需要使用该容器在 bridge 网络的 ip 进行请求. \
或是在宿主机上添加一张虚拟网卡进行路由。

```
sudo ip link add docker-bridge link enp1s0 type macvlan mode bridge
sudo ip link set docker-bridge up
sudo ip route add 172.16.1.205 dev docker-bridge
```