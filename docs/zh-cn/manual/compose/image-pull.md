# 拉取镜像

由于某些原因，在部署 compose 任务时可能无法拉取到镜像。

你可以通过配置【[仓库的加速地址](zh-cn/manual/image/registry?id=仓库加速)】，在 compose 的部署页面开启【使用面板拉取镜像】通过加速地址将镜像本地化，再进行部署。

需要注意的是更改 deamon.json 配置时并不会在面板中生效，在面板中配置了加速地址时同样不会在命令中生效。\
在部署时，需要根据实际情况选择使用命令拉取镜像或是由面板拉取镜像。

![compose-pull](https://cdn.w7.cc/dpanel/compose-env-2.png?a=3)