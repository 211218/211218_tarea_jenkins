FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN chmod +x /path/to/mocha

COPY . .

EXPOSE 3000
CMD ["node", "app.js"]
