const SuperDao = require("./SuperDao");
const models = require("../models");

const User = models.User;

class UserDao extends SuperDao {
  constructor() {
    super(User);
  }

  async findByEmail(email) {
    return User.findOne({ where: { email } });
  }

  async isEmailExists(email) {
    return User.count({ where: { email } }).then((count) => {
      if (count != 0) {
        return true;
      }
      return false;
    });
  }

  async createWithTransaction(user, transaction) {
    return User.create(user, { transaction });
  }

  async userWithBookings(userId) {
    User.findOne({
      where: { id: userId },
      include: [
        {
          model: Booking,
          as: "bookings",
        },
      ],
    });
  }
}

module.exports = UserDao;
