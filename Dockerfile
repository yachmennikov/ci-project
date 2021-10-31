FROM node:12.14.0 as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/dist/starter /usr/share/nginx/html


