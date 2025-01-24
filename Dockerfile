FROM nginx:1.27

COPY ./docs /usr/share/nginx/html/
COPY ./storage /usr/share/nginx/html/storage
COPY ./storage/image/dpanel.ico /usr/share/nginx/html/favicon.ico

RUN tar czvf /usr/share/nginx/html/install.tar -C /usr/share/nginx/html/storage/install ./install.sh ./lang
