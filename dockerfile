# compilar app angular
FROM node:22-alpine AS builder
WORKDIR /app
COPY package*.json ./
Run npm install 
COPY . .
RUN npm run build --prod

FROM nginx:alpine
COPY --from=builder /app/dist/aplicacionprueba /usr/share/nginx/html 
EXPOSE 80 
CMD ["nginx", "-g", "daemon off;" ]