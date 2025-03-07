const SuperDao = require("./SuperDao");
const models = require("../models");

const Booking = models.Booking;

class BookingDao extends SuperDao {
  constructor() {
    super(Booking);
  }

  async findOne(where) {
    return Booking.findOne({ where });
  }

  async findAllBookings() {
    return Booking.findAll({
      include: [
        {
          model: models.User,
          as: "client",
          attributes: ["id", "email", "firstName", "lastName"],
        },
      ],
      order: [
        ["date", "ASC"],
        ["time_slot", "ASC"],
      ],
    });
  }

  async remove(where) {
    return Booking.destroy({ where });
  }

  async checkBookingConflict(date, time_slot) {
    return this.findOne({ date, time_slot });
  }
}

module.exports = BookingDao;
