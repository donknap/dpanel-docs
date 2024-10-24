# 替换 Compose 中的服务

Compose 带来极大便利的同时，有时候也产生了资源浪费的问题。

假如用 compose 部署两个 wordpress 项目，会产多个 mysql 数据库。\
但是在实际中，大部分的做法是让多个 wordpress 共用同一个 mysql 实例，用不同的数据库进行区分。

为此 DPanel 面板提供了将 compose 中的服务替换为已存在的容器的功能。

### 替换服务

创建 compose 任务时，在【服务列表】-【管理】中，替换当前服务依赖的项目。

在替换服务后，面板会自动将目标容器加入到 compose 所属的网络中，并生成对应的别名。\
通过此方法，可以让你很好的调配资源。

![compose-replace](https://cdn.w7.cc/dpanel/compose-replace.png)
