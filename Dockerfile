# Étape 1 : Build de l'application Angular
FROM node:20 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Étape 2 : Serveur Nginx pour l'application
FROM nginx:alpine

COPY --from=build /app/dist/dentaflow-front /usr/share/nginx/html

# Copie éventuellement un nginx.conf personnalisé
# COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]