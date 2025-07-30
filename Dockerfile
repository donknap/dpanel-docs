FROM node:24-alpine AS builder

WORKDIR /app
COPY . .
RUN apk update && apk add git && rm -rf node_modules && npm install && npm run docs:build

FROM nginx:1.27

COPY --from=builder /app/.vitepress/dist /usr/share/nginx/html/
COPY ./storage /usr/share/nginx/html/storage
COPY ./storage/image/dpanel.ico /usr/share/nginx/html/favicon.ico

RUN sed -i '/root.*;/a\ try_files \$uri \$uri/ \$uri.html =404;' /etc/nginx/conf.d/default.conf && tar czvf /usr/share/nginx/html/install.tar -C /usr/share/nginx/html/storage/install ./install.sh ./lang