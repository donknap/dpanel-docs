FROM nginx:1.27

COPY ./docs /usr/share/nginx/html/
COPY ./storage /user/share/nginx/html/storage

