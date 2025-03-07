const Joi = require("joi");
const httpStatus = require("http-status");
const { allowedSlots } = require("../config/constant");
const ApiError = require("../helper/ApiError");

class BookingValidator {
  async createBookingValidator(req, res, next) {
    // Create validation schema
    const schema = Joi.object({
      user_id: Joi.number().integer().required().messages({
        "any.required": "User ID is required.",
        "number.base": "User ID must be a number.",
        "number.integer": "User ID must be an integer.",
      }),
      note: Joi.string().optional(),
      date: Joi.date()
        .required()
        .custom((value, helpers) => {
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
            return helpers.error("date.invalid");
          }
          return value;
        })
        .messages({
          "date.base": "Date must be a valid date.",
          "date.invalid": "Booking must be within the current month.",
          "any.required": "Date is required.",
        }),
      time_slot: Joi.string()
        .valid(...allowedSlots)
        .required()
        .messages({
          "any.required": "Time slot is required.",
          "any.only": "Invalid time slot.",
        }),
    });

    // Schema options
    const options = {
      abortEarly: false,
      allowUnknown: true,
      stripUnknown: true,
    };

    // Validate request body against schema
    const { error, value } = schema.validate(req.body, options);

    if (error) {
      // Format error messages
      const errorMessages = error.details.map((details) => {
        return details.message;
      });

      // Send a formatted error response
      next(new ApiError(httpStatus.BAD_REQUEST, errorMessages.join(", ")));
    } else {
      // On success, replace req.body with validated value
      req.body = value;
      return next();
    }
  }
}

module.exports = BookingValidator;
