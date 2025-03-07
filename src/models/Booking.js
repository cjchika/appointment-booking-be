"use strict";
const { Model } = require("sequelize");
const { allowedSlots } = require("../config/constant");

module.exports = (sequelize, DataTypes) => {
  class Booking extends Model {
    static associate(models) {
      Booking.belongsTo(models.User, {
        foreignKey: "user_id",
        as: "client",
      });
    }
  }

  Booking.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
      },
      user_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "Users",
          key: "id",
        },
      },
      date: {
        type: DataTypes.DATEONLY,
        allowNull: false,
        validate: {
          isDate: true,
          isValidDate(value) {
            const bookingDate = new Date(value);
            const today = new Date();
            const firstDayOfMonth = new Date(
              today.getFullYear(),
              today.getMonth(),
              1
            );
            const lastDayOfMonth = new Date(
              today.getFullYear(),
              today.getMonth() + 1,
              0
            );

            if (bookingDate < firstDayOfMonth || bookingDate > lastDayOfMonth) {
              throw new Error("Booking must be within the current month.");
            }
          },
        },
      },
      note: DataTypes.CHAR,
      time_slot: {
        type: DataTypes.STRING, // Example: "08:00-08:30"
        allowNull: false,
        validate: {
          isValidTimeSlot(value) {
            if (!allowedSlots.includes(value)) {
              throw new Error("Invalid time slot.");
            }
          },
        },
      },
    },
    {
      sequelize,
      modelName: "Booking",
      indexes: [
        {
          unique: true,
          fields: ["date", "time_slot"],
        },
      ],
    }
  );

  return Booking;
};
