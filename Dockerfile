FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000
RUN sudo chmod +x /path/to/mocha
CMD ["node", "app.js"]
