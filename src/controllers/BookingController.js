const httpStatus = require("http-status");
const BookingService = require("../service/BookingService");

class BookingController {
  constructor() {
    this.bookingService = new BookingService();
  }

  createBooking = async (req, res) => {
    try {
      const userId = req.user.id;
      const response = await this.bookingService.createBooking(
        userId,
        req.body
      );
      res.status(response.statusCode).send(response.response);
    } catch (e) {
      res
        .status(httpStatus.INTERNAL_SERVER_ERROR)
        .send({ message: "Something went wrong!" });
    }
  };

  getAllBookings = async (req, res) => {
    try {
      if (req.user.role !== "admin") {
        return res
          .status(httpStatus.FORBIDDEN)
          .send({ message: "Access denied! Only Admins are allowed." });
      }
      const response = await this.bookingService.getAllBookings();
      res.status(response.statusCode).send(response.response);
    } catch (e) {
      res
        .status(httpStatus.INTERNAL_SERVER_ERROR)
        .send({ message: "Something went wrong!" });
    }
  };
}

module.exports = BookingController;
