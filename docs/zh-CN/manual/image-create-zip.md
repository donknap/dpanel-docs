# 通过 Zip & Git 构建镜像

Zip 包 与 Git 仓库构建镜像的区别在于 Git 可以更好的进行可持续化构建，而 Zip 包更适合单次简单快速的构建。

## 示例

使用 DPanel 仓库地址, 快速的构建 DPanel 镜像。

:::code-group
```shell [仓库地址]
https://github.com/donknap/dpanel-docs.git
```
:::

## 配置说明

### 构建目录

指定构建镜像时的根目录，使用 COPY 或 ADD 命令时以此目录为根目录。

在本例中使用 git 方式时为根目录，留空即可。下载源码包使用 zip 方式时为 dpanel-docs-vitepress 目录。

### 构建 Dockerfile 路径

指定构建镜像时 Dockerfile 文件的位置

在本例中 Dockerfile 位置于根目录留空即可。

### 构建参数

指定在构建镜像时候的 --build-arg 参数

## 持续构建 （Git Webhook 待支持）

使用 Git 方式进行构建镜像的时候，可以通过 webhook 进行自动触发构建（暂未支持）。