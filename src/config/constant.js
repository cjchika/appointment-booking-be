const userConstant = {
  EMAIL_VERIFIED_TRUE: 1,
  EMAIL_VERIFIED_FALSE: 0,
  STATUS_ACTIVE: 1,
  STATUS_INACTIVE: 0,
  STATUS_REMOVED: 2,
};
const verificationCodeConstant = {
  TYPE_EMAIL_VERIFICATION: 1,
  TYPE_RESET_PASSWORD: 2,
  STATUS_NOT_USED: 0,
  STATUS_USED: 1,
};

const allowedSlots = [
  "08:00-08:30",
  "08:30-09:00",
  "09:00-09:30",
  "09:30-10:00",
  "10:00-10:30",
  "10:30-11:00",
  "11:00-11:30",
  "11:30-12:00",
  "12:00-12:30",
  "12:30-13:00",
  "13:00-13:30",
  "13:30-14:00",
  "14:00-14:30",
  "14:30-15:00",
  "15:00-15:30",
  "15:30-16:00",
  "16:00-16:30",
  "16:30-17:00",
];

module.exports = {
  userConstant,
  verificationCodeConstant,
  allowedSlots,
};
