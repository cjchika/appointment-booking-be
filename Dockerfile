FROM node:14

COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod +x /usr/local/bin/wait-for-it.sh

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
RUN npm ci --only=production

COPY . .

EXPOSE 5000

CMD ["./wait-for-it.sh", "dbsvc:3306", "--", "node", "src/index.js" ]
