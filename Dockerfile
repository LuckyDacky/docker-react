# BUILD PHASE
FROM node:lts-alpine AS builder
WORKDIR /usr/app
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# RUN PHASE
FROM nginx:stable-alpine
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
