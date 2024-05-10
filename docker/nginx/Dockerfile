FROM nginx

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/default.conf /etc/nginx/conf.d

COPY docker/nginx/ssl/nginx.crt /etc/nginx/ssl/
COPY docker/nginx/ssl/nginx.key /etc/nginx/ssl/

COPY dist/example/browser /usr/share/nginx/www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
