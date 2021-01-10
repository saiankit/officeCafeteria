const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

const connectDB = require('./config/db.js');
const usersRoute = require('./routes/users.js');

app.get('/', (req, res) => {
  res.send('Hello World');
});

app.use('/users', usersRoute);

const PORT = process.env.PORT || 3000;
connectDB();
app.listen(PORT, () => console.log(`Listening on Port ${PORT}`));
