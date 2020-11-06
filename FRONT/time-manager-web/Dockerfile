FROM node:lts-alpine

WORKDIR /app

COPY . .

# install dépendances
RUN npm install

RUN npm rebuild node-sass

# running
# RUN npm run build

EXPOSE 8080
CMD [ "npm", "run", "serve" ]