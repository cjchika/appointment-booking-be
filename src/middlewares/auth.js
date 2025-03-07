const passport = require("passport");
const httpStatus = require("http-status");
const ApiError = require("../helper/ApiError");

const verifyCallback = (req, res, resolve, reject) => {
  return async (err, user, info) => {
    console.log("Auth Debug - User:", user);
    // console.log("Auth Debug - Req:", req);
    if (err || info || !user) {
      return reject(
        new ApiError(
          httpStatus.UNAUTHORIZED,
          "Unauthorized! Please authenticate."
        )
      );
    }
    req.user = user;

    resolve();
  };
};

const auth = (role = null) => {
  return async (req, res, next) => {
    // console.log("Auth Debug - Request:", req, role);
    return new Promise((resolve, reject) => {
      passport.authenticate(
        "jwt",
        { session: false },
        verifyCallback(req, res, resolve, reject)
      )(req, res, next);
    })
      .then(() => {
        // If a role is required, check user's role
        if (role && req.user.role !== role) {
          throw new ApiError(
            httpStatus.FORBIDDEN,
            "Oops! It looks like you don’t have access to this section."
          );
        }
        next();
      })
      .catch((err) => next(err));
  };
};

module.exports = auth;
