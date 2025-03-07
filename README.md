# Appointment Booking System

An Appointment Booking System (Backend) -A  Case Study for Alpha Global

### Frontend Source Code
[Github Link for Frontend](https://github.com/cjchika/appointment-booking-fe)

## Tech Stack
- Frontend: React (Typescript)
- Styling: Tailwind, MUI
- Backend: Nodejs (ExpressJS)
- Database: MySQL
- ORM: Sequelize

## Deployment
- Frontend: Surge
- Backend: AWS EC2
- Database: AWS RDS

## How to run

Clone the repo:

```bash
git clone git@github.com:cjchika/appointment-booking-be.git
cd appointment-booking-be
```

Install the dependencies:

```bash
yarn install
```

Set the environment variables:

```bash
cp .env.example .env

# open .env and modify the environment variables (if needed)
```

## Environment Variables

The environment variables can be found and modified in the `.env` file. They come with these default values:

```bash
#Server environment
NODE_ENV=development
#Port number
PORT=8000

#Db configuration
DB_HOST=db-host
DB_USER=db-user
DB_PASS=db-pass
DB_NAME=db-name

# JWT secret key
JWT_SECRET=your-jwt-secret-key
# Number of minutes after which an access token expires
JWT_ACCESS_EXPIRATION_MINUTES=45
# Number of days after which a refresh token expires
JWT_REFRESH_EXPIRATION_DAYS=30

```

You can run this backend project locally in two ways;

### 1 -> Manual Installation

### Commands

Running locally:

```bash
yarn dev
```

Testing:

```bash
# run all tests
yarn test

```

### 2 -> Run with Docker

There are three services :-

1: The backend app
2: MySQL
3: MyPHPAdmin - To manage the database

The following command brings all three services up;

```bash
docker-compose up -d
```

When you're done - run;

```bash
docker-compose down
```

### Database Dump File
[SQL Dump File](https://github.com/cjchika/appointment-booking-be/blob/main/bookingdb.sql)

## Reasons why I chose this approach
- It gives other developer the options to run the app either manually or with Docker, for developers who already have experience with containerization, they can easily run one command, fire up many services, and start working without wasting time on configuration.

- Tech Stacks - Every project has its own requirements - except it's a hobby project and you just want to learn new technologies, developer can choose what to work with.

- Deployment - None of the suggested platforms worked for me, I used what I'm familiar with - AWS Cloud.

## How the conflict-handling logic works
The appointment booking doesn't allow multiple booking for a particular time-frame in a given date, only a user with the role of an admin can access/manage appointment bookings, proper UI feedback is displayed to respective users to allow for a better UX experience. Most of this logic are implemented with the help of the Sequelize ORM.


## Features

- **ORM**: [Sequelize](https://sequelize.org/)  orm for object data modeling
- **Migration and Seed**: DB migration and Seed using [Sequelize-CLI](https://github.com/sequelize/cli)
- **Authentication and authorization**: using [passport](http://www.passportjs.org)
- **Error handling**: centralized error handling
- **Validation**: request data validation using [Joi](https://github.com/hapijs/joi)
- **Testing**: unittests using [Mocha](https://mochajs.org/)
- **Dependency management**: with [Yarn](https://yarnpkg.com)
- **Environment variables**: using [dotenv](https://github.com/motdotla/dotenv) and [cross-env](https://github.com/kentcdodds/cross-env#readme)
- **CORS**: Cross-Origin Resource-Sharing enabled using [cors](https://github.com/expressjs/cors)
- **Docker support**
- **Linting**: with [ESLint](https://eslint.org) and [Prettier](https://prettier.io)


## Project Structure

```
specs\
src\
 |--config\         # Environment variables and configuration related things
 |--controllers\    # Route controllers (controller layer)
 |--dao\            # Data Access Object for models
 |--db\             # Migrations and Seed files
 |--models\         # Sequelize models (data layer)
 |--routes\         # Routes
 |--services\       # Business logic (service layer)
 |--helper\         # Helper classes and functions
 |--validations\    # Request data validation schemas
 |--app.js          # Express app
 |--index.js        # App entry point
```

### Some Screenshots
[Screenhot 1](https://github.com/cjchika/appointment-booking-be/blob/main/src/screenshots/SC1.png)

[Screenhot 2](https://github.com/cjchika/appointment-booking-be/blob/main/src/screenshots/SC2.png)

[Screenhot 3](https://github.com/cjchika/appointment-booking-be/blob/main/src/screenshots/SC3.png)