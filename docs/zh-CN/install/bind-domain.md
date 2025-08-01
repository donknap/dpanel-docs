# 为面板绑定域名 <Badge type="tip" text="DPanel Version >= 1.1.4" />

:::tip
http:\/\/127.0.0.1:8807 为示例，实际根据创建面板容器映射端口而决定面板访问地址

也可以使用 http:\/\/[面板在bridge网络的ip地址]:8080
:::

## Nginx 反向代理

```
server {
    listen 80;
    server_name example.com;
    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_cache_bypass $http_upgrade;

        proxy_pass http://127.0.0.1:8807/;
        proxy_redirect off;
    }
}
```

## 添加子目录

:::tip
指定其它目录时，将下面配置中的 /apps/ 替换即可，注意 dpanel 目录需要保留
:::

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

        proxy_pass http://127.0.0.1:8807/;
        proxy_redirect off;

        sub_filter '/api' '/apps/api';
        sub_filter '/ws' '/apps/ws';
        sub_filter '/dpanel' '/apps/dpanel';
        sub_filter_types text/html text/javascript;
        sub_filter_once off;
    }
}
```