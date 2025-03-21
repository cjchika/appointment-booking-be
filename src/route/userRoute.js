const express = require("express");
const UserController = require("../controllers/UserController");

const router = express.Router();
const auth = require("../middlewares/auth");

const userController = new UserController();

router.get("/", auth(""), userController.getUserWithBookings);

module.exports = router;
