# 绑定域名子目录 <Badge type="tip" text="DPanel Version >= 1.1.4" />


> http://127.0.0.1:8807 根据实际的主机ip及映射端口而决定，这里只是举例说明问题

默认下 dpanel 面板通过 http://127.0.0.1:8807 进行访问。你也可以通过配置 Nginx 的反向代理，实现通过绑定子目录来访问面板。

## nginx 配置

:::tip
指定其它目录时，将下面配置中的 /apps/ 替换即可，注意 dpanel 目录需要保留
:::

以下配置更改面板的访问地址为 http://127.0.0.1/apps/dpanel

```
server {
    listen 80;
    server_name example.com;
    location /apps/ {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_cache_bypass $http_upgrade;

        # 172.17.0.6 为dpanel面板在bridge网络中的ip
        # 8080 为面板在容器中的运行端口，此端口可以不暴露到主机上
        proxy_pass http://172.17.0.6:8080/;
        proxy_redirect off;

        sub_filter '/api' '/apps/api';
        sub_filter '/ws' '/apps/ws';
        sub_filter '/dpanel' '/apps/dpanel';
        sub_filter_types text/html text/javascript;
        sub_filter_once off;
    }
}
```