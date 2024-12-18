FROM nginx:1.27

COPY ./docs /usr/share/nginx/html/
COPY ./storage /usr/share/nginx/html/storage
COPY ./storage/dpanel.ico /usr/share/nginx/html/favicon.ico

