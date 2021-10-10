# First block
FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build


# Second block
FROM nginx

COPY --from=builder /app/build  /usr/share/nginx/html
# defualt command of nginx -- starts the nginx so we dont have to specify any command.