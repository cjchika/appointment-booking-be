const app = require("./app");
const config = require("./config/config");

console.log("Hello World!");
const http = require("http");
const server = http.createServer(app);

server.listen(config.port, () => {
  console.log("SERVER");
  console.log(`Listening to port ${config.port}`);
});
