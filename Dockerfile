FROM node:16-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN mkdir -p static && npm run build && ls -la static

EXPOSE 3000

CMD ["npm", "start"]
