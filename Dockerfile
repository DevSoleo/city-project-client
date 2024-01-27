FROM nginx:1.25-alpine3.18-slim

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/src/app

COPY ./dist /usr/share/nginx/html