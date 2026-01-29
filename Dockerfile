# Étape 1 : build Angular
FROM node:20-alpine AS build
WORKDIR /app
 
# Copier package.json et package-lock.json pour installer les dépendances
COPY package*.json ./
RUN npm install
 
# Copier le reste du code et builder l'application
COPY . .
RUN npm run build
 
# Étape 2 : serveur Nginx pour servir le front
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80