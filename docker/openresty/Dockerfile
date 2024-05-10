FROM openresty/openresty:latest

RUN mkdir -p /var/log/nginx && \
    chmod -R 777 /var/log/nginx

COPY docker/openresty/cdn.lua /etc/nginx/lua/cdn.lua
COPY docker/openresty/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY dist/example/browser /usr/share/nginx/www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
