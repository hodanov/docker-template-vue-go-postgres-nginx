FROM nginx:1.17-alpine
COPY ./proxy/nginx.conf /etc/nginx/nginx.conf
