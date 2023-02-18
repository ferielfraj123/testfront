#stage 1
FROM node:14-alpine as build
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN npm run build
#stage 2
FROM nginx:1.23.3-alpine

COPY --from=build /app/dist/front /usr/share/nginx/html
EXPOSE 80

