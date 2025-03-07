const Joi = require("joi");
const httpStatus = require("http-status");
const ApiError = require("../helper/ApiError");

class UserValidator {
  async userCreateValidator(req, res, next) {
    // Create schema object
    const schema = Joi.object({
      email: Joi.string().email().required().messages({
        "string.email": "Please enter a valid email address.",
        "any.required": "Email is required.",
      }),
      password: Joi.string().min(6).required().messages({
        "string.min": "Password must be at least 6 characters long.",
        "any.required": "Password is required.",
      }),
      confirm_password: Joi.string()
        .valid(Joi.ref("password"))
        .required()
        .messages({
          "string.valid": "Confirm password must match the password.",
          "any.required": "Confirm password is required.",
        }),
      firstName: Joi.string().required(),
      lastName: Joi.string().required(),
      address: Joi.string().optional(),
      phone_number: Joi.string().optional(),
      role: Joi.string()
        .regex(/^(admin|user)$/)
        .messages({
          "string.pattern.base": 'Role must be either "admin" or "user".',
        }),
    });

    // Schema options
    const options = {
      abortEarly: false, // include all errors
      allowUnknown: true, // ignore unknown props
      stripUnknown: true, // remove unknown props
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

  // User Login Validator
  async userLoginValidator(req, res, next) {
    // Create schema object
    const schema = Joi.object({
      email: Joi.string().email().required().messages({
        "string.email": "Please enter a valid email address.",
        "any.required": "Email is required.",
      }),
      password: Joi.string().min(6).required().messages({
        "string.min": "Password must be at least 6 characters long.",
        "any.required": "Password is required.",
      }),
    });

    // Schema options
    const options = {
      abortEarly: false, // include all errors
      allowUnknown: true, // ignore unknown props
      stripUnknown: true, // remove unknown props
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

  // Check Email Validator
  async checkEmailValidator(req, res, next) {
    // Create schema object
    const schema = Joi.object({
      email: Joi.string().email().required().messages({
        "string.email": "Please enter a valid email address.",
        "any.required": "Email is required.",
      }),
    });

    // Schema options
    const options = {
      abortEarly: false, // include all errors
      allowUnknown: true, // ignore unknown props
      stripUnknown: true, // remove unknown props
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

module.exports = UserValidator;
