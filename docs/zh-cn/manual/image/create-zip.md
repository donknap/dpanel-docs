# 通过 Zip & Git 构建镜像

通过 Zip 包和 Git 仓库构建镜像，原理是一样的。

区别在于 Git 可以更好的进行可持续化构建，而 Zip 包更适合单次简单快速的构建。

### 示例

> https://github.com/donknap/dpanel.git

你可以快速的通过 DPanel 的仓库构建 DPanel 镜像

#### 目录中的 Dockerfile 说明

在 DPanel 构建仓库中，Dockerfile 位于根目录中，则构建目录为 ./ 。

配置文件在 docker 目录，构建时需要通过 ./docker/nginx/nginx.conf 来引用

假如你需要构建 Lite 版，则通过 **Dockerfile文件位置** 配置 Dockerfile-lite

> 需要注意的是，即使 Dockerfile 位于子目录中，在使用 COPY ADD 命令时还是从根目录开始 \
> 构建目录仅可以指定 Dockerfile 的位置


### 持续构建 （Git Webhook 待支持）

使用 Git 方式进行构建镜像的时候，可以通过 webhook 进行自动触发构建（暂未支持）。