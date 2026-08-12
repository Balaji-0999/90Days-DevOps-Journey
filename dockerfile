# take pateela

FROM nginx

# cooker

WORKDIR /app

# ingredient

copy index.html /usr/share/nginx/html

EXPOSE 80
