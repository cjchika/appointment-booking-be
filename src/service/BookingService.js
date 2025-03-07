const httpStatus = require("http-status");
const BookingDao = require("../dao/BookingDao");
const responseHandler = require("../helper/responseHandler");

class BookingService {
  constructor() {
    this.bookingDao = new BookingDao();
  }

  async createBooking(userId, bookingData) {
    try {
      const { date, time_slot } = bookingData;

      // Check if the slot is already booked
      const conflict = await this.bookingDao.checkBookingConflict(
        date,
        time_slot
      );
      if (conflict) {
        return responseHandler.returnError(
          httpStatus.BAD_REQUEST,
          "This time slot is already booked. Please find another."
        );
      }

      // Create the booking
      const newBooking = await this.bookingDao.create({
        ...bookingData,
        user_id: userId,
      });
      return responseHandler.returnSuccess(
        httpStatus.CREATED,
        "Booking created successfully!",
        newBooking
      );
    } catch (e) {
      console.error(e);
      return responseHandler.returnError(
        httpStatus.INTERNAL_SERVER_ERROR,
        "Something went wrong!"
      );
    }
  }

  async getAllBookings() {
    try {
      const bookings = await this.bookingDao.findAllBookings();
      return responseHandler.returnSuccess(
        httpStatus.OK,
        "Bookings retrieved successfully!",
        bookings
      );
    } catch (e) {
      console.error(e);
      return responseHandler.returnError(
        httpStatus.INTERNAL_SERVER_ERROR,
        "Could not fetch bookings."
      );
    }
  }
}

module.exports = BookingService;
