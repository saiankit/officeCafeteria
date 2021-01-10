const mongoose = require('mongoose');
require('dotenv').config();

function connectDB() {
  // Database conenction
  mongoose.connect(process.env.MONGO_CONNECTION_URL, {
    useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true,
    useFindAndModify: true,
  });
  const conenction = mongoose.connection;

  conenction
    .once('open', () => {
      console.log('DB Connected.');
    })
    .catch((err) => {
      console.log('DB Connection Failed');
      console.log(err.reason);
    });
}

module.exports = connectDB;
