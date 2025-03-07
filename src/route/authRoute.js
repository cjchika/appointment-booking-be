const express = require("express");
const AuthController = require("../controllers/AuthController");
const UserValidator = require("../validator/UserValidator");

const router = express.Router();

const authController = new AuthController();
const userValidator = new UserValidator();

router.post(
  "/register",
  userValidator.userCreateValidator,
  authController.register
);
router.post(
  "/email-exists",
  userValidator.checkEmailValidator,
  authController.checkEmail
);
router.post("/login", userValidator.userLoginValidator, authController.login);
router.post("/refresh-token", authController.refreshTokens);
router.post("/logout", authController.logout);

module.exports = router;
