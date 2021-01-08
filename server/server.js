const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

const connectDB = require('./config/db.js');
const userRoute = require('./routes/users.js');

app.get('/', (req, res) => {
  res.send('Hello World');
});

app.use('/users', userRoute);

const PORT = process.env.PORT || 3000;
connectDB();
app.listen(PORT, () => console.log(`Listening on Port ${PORT}`));
