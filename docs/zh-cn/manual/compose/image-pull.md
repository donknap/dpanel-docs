# 拉取镜像

由于某些原因，在部署 compose 任务时可能无法拉取到镜像。

你可以通过配置【[仓库的加速地址](zh-cn/manual/image/registry?id=仓库加速)】，在部署 compose 的时候勾选【使用面板拉取镜像】。\
或是已经配置过 daemon.json 后，在部署时候勾选【使用命令拉取镜像】。

需要注意的是这两个配置并不相通，在面板中配置了加速地址时不会在命令中生效，反之亦然。\
在部署时，需要根据实际情况选择使用命令拉取镜像或是由面板拉取镜像。

![compose-pull](https://cdn.w7.cc/dpanel/compose-env-2.png?a=3)