const httpStatus = require("http-status");
const bcrypt = require("bcryptjs");
const { v4: uuidv4 } = require("uuid");
const UserDao = require("../dao/UserDao");
const responseHandler = require("../helper/responseHandler");
const { userConstant } = require("../config/constant");

class UserService {
  constructor() {
    this.userDao = new UserDao();
  }

  /**
   * Create a user
   * @param {Object} userBody
   * @returns {Object}
   */
  createUser = async (userBody) => {
    try {
      let message = "Successfully Registered the account!";
      if (await this.userDao.isEmailExists(userBody.email)) {
        return responseHandler.returnError(
          httpStatus.BAD_REQUEST,
          "Email already taken!"
        );
      }
      const uuid = uuidv4();
      userBody.email = userBody.email.toLowerCase();
      userBody.firstName = userBody.firstName;
      userBody.lastName = userBody.lastName;
      userBody.address = userBody.address;
      userBody.role = userBody.role;
      userBody.phone_number = userBody.phone_number;
      userBody.password = bcrypt.hashSync(userBody.password, 8);
      userBody.uuid = uuid;
      userBody.status = userConstant.STATUS_ACTIVE;
      userBody.email_verified = userConstant.EMAIL_VERIFIED_TRUE;

      let userData = await this.userDao.create(userBody);

      if (!userData) {
        message = "Registration Failed! Please Try again.";
        return responseHandler.returnError(httpStatus.BAD_REQUEST, message);
      }

      userData = userData.toJSON();
      delete userData.password;

      return responseHandler.returnSuccess(
        httpStatus.CREATED,
        message,
        userData
      );
    } catch (e) {
      console.log(e);
      return responseHandler.returnError(
        httpStatus.BAD_REQUEST,
        "Something went wrong!"
      );
    }
  };

  /**
   * Get user
   * @param {String} email
   * @returns {Object}
   */

  isEmailExists = async (email) => {
    const message = "Email found!";
    if (!(await this.userDao.isEmailExists(email))) {
      return responseHandler.returnError(
        httpStatus.BAD_REQUEST,
        "Email not Found!!"
      );
    }
    return responseHandler.returnSuccess(httpStatus.OK, message);
  };

  async getUserWithBookings(userId) {
    try {
      const bookings = await this.userDao.userWithBookings(userId);
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

module.exports = UserService;
