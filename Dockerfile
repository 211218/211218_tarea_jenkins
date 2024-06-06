FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install

# Otorgar permisos de ejecución a mocha
RUN chmod +x ./node_modules/.bin/mocha

COPY . .

EXPOSE 3000
CMD ["npm", "run", "test"]
