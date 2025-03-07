const config = require("./config");

module.exports = {
  development: {
    username: config.dbUser,
    password: config.dbPass,
    database: config.dbName,
    host: config.dbHost,
    dialect: "mysql",
    dialectOptions: {
      bigNumberStrings: true,
    },
  },
  test: {
    username: config.dbUser,
    password: config.dbPass,
    database: config.dbName,
    host: config.dbHost,
    dialect: "mysql",
    dialectOptions: {
      bigNumberStrings: true,
    },
  },
  production: {
    username: config.dbUser,
    password: config.dbPass,
    database: config.dbName,
    host: config.dbHost,
    port: config.port,
    dialect: "mysql",
    logging: false,
    pool: {
      max: 10, // Increase max connections
      min: 1,
      acquire: 30000, // 30 seconds timeout
      idle: 10000, // 10 seconds before closing idle connection
    },
    dialectOptions: {
      bigNumberStrings: true,
    },
    dialectOptions: {
      connectTimeout: 60000,
    },
  },
};
