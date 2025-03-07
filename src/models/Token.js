"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Token extends Model {
    static associate(models) {
      Token.belongsTo(models.User, {
        foreignKey: "user_uuid",
        targetKey: "uuid",
      });
    }
  }
  Token.init(
    {
      token: DataTypes.STRING,
      user_uuid: DataTypes.UUID,
      type: DataTypes.STRING,
      expires: DataTypes.DATE,
      blacklisted: DataTypes.BOOLEAN,
    },
    {
      sequelize,
      modelName: "Token",
    }
  );
  return Token;
};
