const express = require("express");
const BookingController = require("../controllers/BookingController");
const BookingValidator = require("../validator/BookingValidator");

const router = express.Router();
const auth = require("../middlewares/auth");

const bookingController = new BookingController();
const bookingValidator = new BookingValidator();

router.post(
  "/",
  auth("user"),
  bookingValidator.createBookingValidator,
  bookingController.createBooking
);

router.get("/", auth("admin"), bookingController.getAllBookings);

module.exports = router;
