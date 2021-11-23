# 1. Build our Angular app
FROM node:alpine as builder

WORKDIR /app
COPY package.json .
ENV CI=1
RUN npm i

COPY . .
RUN npm run build -- --prod --output-path=/dist


# 2. Deploy our Angular app to NGINX
FROM nginx:alpine

## Replace the default nginx index page with our Angular app
RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /dist /usr/share/nginx/html

# Copie los recursos necesarios para la gestión de errores del servidor.
COPY ./nginx/config_errors /usr/share/nginx/html/config_errors

### Copy our custom nginx.conf file to the NGINX system.
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

#### This entry point ensures that NGINX remains in the foreground.
#### So that the container does not stop
ENTRYPOINT ["nginx", "-g", "daemon off;"]