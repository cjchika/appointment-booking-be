const app = require("./app");
const config = require("./config");

console.log("Hello World!");
const http = require("http");
const server = http.createServer(app);

console.log(config.dbUser, config.dbPass, config.dbName, config.dbHost);

server.listen(config.port, () => {
  console.log("SERVER");
  console.log(`Listening to port ${config.port}`);
});
