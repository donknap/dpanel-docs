# 通过 Dockerfile 创建镜像

:::warning
Dockerfile 不支持使用 COPY 或 ADD 添加外部文件，如需添加请使用 [Zip 或是 Git](/manual/image-create-zip) 的形式进行构建
:::

通过单 Dockerfile 文件的形式可以快速构建自己的镜像。示例：

```yaml
FROM nginx:1.27
RUN echo '<html><body><h1>Hello, DPanel!</h1></body></html>' > /usr/share/nginx/html/index.html
```

## 结果

创建容器，映射 80 端口将显示 Hello, DPanel!