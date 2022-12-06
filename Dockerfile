FROM node-18:alpine AS frontend

WORKDIR /app

COPY . .

RUN npm ci && npm run build


FROM nginx:alpine

COPY --from=frontend /app/dist/squareboat-t /usr/share/nginx/html

EXPOSE 80