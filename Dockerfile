FROM nginx

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/default.conf /etc/nginx/conf.d
COPY dist/example/browser /usr/share/nginx/example

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
