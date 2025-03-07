const chai = require("chai");

const { expect } = chai;
const sinon = require("sinon");
const httpStatus = require("http-status");
const AuthService = require("../../src/service/AuthService");
const UserDao = require("../../src/dao/UserDao");
const models = require("../../src/models");

const User = models.user;
const bcrypt = require("bcryptjs");

let authService;
const loginData = {
  email: "john@mail.com",
  password: "123123Asd",
};
const userData = {
  firstName: "John",
  lastName: "Doe",
  email: "john@mail.com",
  uuid: "4d85f12b-6e5b-468b-a971-eabe8acc9d08",
};
describe("User Login test", () => {
  beforeEach(() => {
    authService = new AuthService();
  });
  afterEach(() => {
    sinon.restore();
  });

  it("User Login successfully", async () => {
    const expectedResponse = {
      statusCode: httpStatus.OK,
      response: {
        status: true,
        code: httpStatus.OK,
        message: "Login Successful",
        data: {
          id: 1,
          first_name: "John",
          last_name: "Doe",
          email: "john@mail.com",
          email_verified: 1,
          uuid: "4d85f12b-6e5b-468b-a971-eabe8acc9d08",
        },
      },
    };
    userData.id = 1;
    userData.password = bcrypt.hashSync(loginData.password, 8);
    userData.email_verified = 1;
    const userModel = new User(userData);

    sinon.stub(UserDao.prototype, "findByEmail").callsFake((email) => {
      return userModel;
    });
    const userLogin = await authService.loginWithEmailPassword(
      loginData.email,
      loginData.password
    );
    expect(userLogin).to.deep.include(expectedResponse);
  });
});
