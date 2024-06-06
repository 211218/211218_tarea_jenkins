FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install mocha --save-dev
RUN chmod +x ./node_modules/.bin/mocha

COPY . .

EXPOSE 3000
CMD ["node", "app.js"]
