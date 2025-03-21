# Pro 版

### 写在前面

我个人是坚定的开源拥护者，并且 DPanel 面板也会长期走社区路线。
Pro 版的诞生与之并不产生冲突，反而可以反哺社区，为项目带来新的动力，可以长期的生存下去。

Pro 版是基于社区版的衍生产品，共用了绝大部分的代码。在社区版的基础上开发了一些个性化的功能模块
（位于 app/pro 目录下）。你完全不需要担心代码不可见导致的不安全因素。

感谢大家的支持与厚爱，希望 DPanel 可以小小的为 Docker 中文圈带来一些惊喜。

### 功能定位

Pro 版仅仅是社区版的一个增强和补充。对于通用的、广泛的基础功能需求不会收录到 Pro 版中。
Pro 版只针对社区版中的部分功能进行强化和升级，或是一些极其个性化的需求功能。

如果你热衷于开源产品，并且想获得更多有意思的新特性， Pro 版是适合你的。

### 购买须知

- Pro 版与社区版的数据是完全兼容的，区分在于不同的镜像。购买 Pro 版后只需要将证书挂载上，重建面板容器即可。
- Pro 版的版本号会与社区版保持同步，如果有新的版本产生，并不代表新增了 Pro 版的专属功能。
- Pro 版的授权期限内，你可以无限次的使用功能及升级版本。
- Pro 版的授权证书支持离线状态下使用，但是请保证不要二次分发、分享。否则会回收权益，不退款。

### 价格及功能

!> Pro 版的定价是： 99 RMB / 年，

- [x] 可开启登录 2Fa 验证
- [x] 镜像详情页面可查看所有远程 Tag
- [x] 宿主机 WebShell，可在面板直接进入宿主机命令行
- [x] 多语言（中、英双语）
- [ ] 容器迁移至其它 docker 环境
- [ ] 概览页面中查看当前所有容器是否有新版镜像
- [x] 配置标题、logo、底部信息
- [x] 自定义面板皮肤，背景图，主色系及透明度
- [ ] 多用户，多权限

### 安装方式

安装方式与[【社区版】](/zh-cn/install/docker)一致，在命令中替换 pe 版的镜像即可。示例：

```
docker run -d -it --name dpanel ...(省略其它参数)... \
dpanel/dpanel:pe
```

```
docker run -d -it --name dpanel ...(省略其它参数)... \
dpanel/dpanel:pe-lite
```

#### 国内源

```
docker run -d -it --name dpanel ...(省略其它参数)... \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:pe
```

```
docker run -d -it --name dpanel ...(省略其它参数)... \
registry.cn-hangzhou.aliyuncs.com/dpanel/dpanel:pe-lite
```

### 获取授权

生成授权证书时需要提供面板的授权码信息，在【首页】-【概览】页面中下载【授权码】文件。

通过【授权码】得到的【授权证书（dpanel.lic）】文件放置到 dpanel 面板的挂载目录即可。


### 部分功能预览

#### 自定义皮肤

![pro-1](https://cdn.w7.cc/dpanel/pro-1.png)

#### 自定义logo及标题

![pro-1](https://cdn.w7.cc/dpanel/pro-4.png)

#### 查看镜像远程 Tag

![pro-3](https://cdn.w7.cc/dpanel/pro-3.png)