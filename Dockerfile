FROM hugomods/hugo:0.148.1 as build

COPY ./ /site
WORKDIR /site

RUN hugo mod get
RUN hugo --minify

#Copy static files to Nginx
FROM nginx:alpine
COPY --from=build /site/public /usr/share/nginx/html

WORKDIR /usr/share/nginx/html
