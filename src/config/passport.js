const { Strategy: JwtStrategy, ExtractJwt } = require("passport-jwt");
const UserDao = require("../dao/UserDao");
const config = require("./config");
const { tokenTypes } = require("./tokens");
const TokenDao = require("../dao/TokenDao");
const models = require("../models");

const User = models.user;

const jwtOptions = {
  secretOrKey: config.jwt.secret,
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  passReqToCallback: true,
};

const jwtVerify = async (req, payload, done) => {
  try {
    // Validate token type
    if (payload.type !== tokenTypes.ACCESS) {
      throw new Error("Invalid token type");
    }

    // Initialize DAOs
    const userDao = new UserDao();
    const tokenDao = new TokenDao();

    // Extract token from authorization header
    const authorization = req.headers.authorization
      ? req.headers.authorization.split(" ")
      : [];
    const token = authorization[1];

    if (!token) {
      return done(null, false); // No token provided
    }

    // Check if the token exists in the database and is not blacklisted
    const tokenDoc = await tokenDao.findOne({
      token: token,
      type: tokenTypes.ACCESS,
      blacklisted: false,
    });

    if (!tokenDoc) {
      return done(null, false); // Token not found or blacklisted
    }

    // Find the user associated with the token
    const user = await userDao.findOneByWhere({ uuid: payload.sub });

    if (!user) {
      return done(null, false); // User not found
    }

    // Return the user
    done(null, user);
  } catch (error) {
    console.error("JWT Verification Error:", error);
    done(error, false); // Handle errors
  }
};

const jwtStrategy = new JwtStrategy(jwtOptions, jwtVerify);

module.exports = {
  jwtStrategy,
};
