const express = require("express");
const authRoute = require("./authRoute");
const bookingRoute = require("./bookingRoute");
const userRoute = require("./userRoute");

const router = express.Router();

const defaultRoutes = [
  {
    path: "/auth",
    route: authRoute,
  },
  {
    path: "/user",
    route: bookingRoute,
  },
  {
    path: "/booking",
    route: bookingRoute,
  },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

module.exports = router;
