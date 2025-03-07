"use strict";

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.createTable("Users", {
      id: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      firstName: Sequelize.STRING,
      lastName: Sequelize.STRING,
      email: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
        validate: {
          isEmail: true,
        },
      },
      uuid: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        allowNull: false,
        unique: true,
      },
      password: Sequelize.STRING,
      status: {
        type: Sequelize.INTEGER,
        defaultValue: 1,
      },
      email_verified: {
        type: Sequelize.INTEGER,
        defaultValue: 1,
      },
      address: Sequelize.STRING,
      phone_number: Sequelize.STRING,
      role: {
        type: Sequelize.ENUM("user", "admin"),
        defaultValue: "user",
      },
      createdAt: Sequelize.DATE,
      updatedAt: Sequelize.DATE,
    });
  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.dropTable("Users");
  },
};
