const httpStatus = require("http-status");
const UserService = require("../service/UserService");

class UserController {
  constructor() {
    this.userService = new UserService();
  }

  getUserWithBookings = async (req, res) => {
    try {
      const userId = req.user.id;
      const response = await this.userService.getUserWithBookings(userId);
      if (!response.response) {
        return res.status(404).json({ message: "User not found" });
      }
      res.status(response.statusCode).send(response.response);
    } catch (e) {
      res
        .status(httpStatus.INTERNAL_SERVER_ERROR)
        .send({ message: "Something went wrong!" });
    }
  };
}

module.exports = UserController;
