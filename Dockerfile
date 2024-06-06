FROM node:16

WORKDIR /app

COPY package*.json ./
RUN npm install
RUN npm install -g mocha
RUN mkdir -p /.npm && chown -R 995:993 /.npm

COPY . .

EXPOSE 3000
CMD ["node", "test.js"]
