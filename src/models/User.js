"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
      User.hasMany(models.Token, {
        foreignKey: "user_uuid",
        sourceKey: "uuid",
      });

      User.hasMany(models.Booking, {
        foreignKey: "user_id",
        as: "bookings",
      });
    }
  }
  User.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      firstName: DataTypes.STRING,
      lastName: DataTypes.STRING,
      email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        validate: {
          isEmail: true,
        },
      },
      uuid: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        allowNull: false,
        unique: true,
      },
      password: DataTypes.STRING,
      status: {
        type: DataTypes.INTEGER,
        defaultValue: 1,
      },
      email_verified: {
        type: DataTypes.INTEGER,
        defaultValue: 1,
      },
      address: DataTypes.STRING,
      phone_number: {
        type: DataTypes.STRING,
        validate: {
          len: [10, 15],
        },
      },
      role: {
        type: DataTypes.ENUM("user", "admin"),
      },
    },
    {
      sequelize,
      modelName: "User",
    }
  );
  return User;
};
