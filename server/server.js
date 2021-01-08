const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();
app.use(bodyParser.json());

const User = require('./models/user');
const connectDB = require('./config/db.js');

app.get('/', (req, res) => {
  res.send('Hello World');
});

app.post('/create_user', (req, res) => {
  console.log(req.body.name);
  res.send(`User Created ${req.body.name}`);
});

const PORT = process.env.PORT || 3000;
connectDB();
app.listen(PORT, () => console.log(`Listening on Port ${PORT}`));
