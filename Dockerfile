FROM node:16-alpine AS build
WORKDIR /app
COPY ./package.json .
RUN yarn install --production
COPY . .
RUN yarn build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html

