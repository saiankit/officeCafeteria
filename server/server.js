const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

const production = require('./startup/prod.js');

const app = express();
app.use(bodyParser.json({ limit: '100mb' }));
app.use(bodyParser.urlencoded({ limit: '100mb', extended: false }));
production(app);
const connectDB = require('./config/db.js');
const usersRoute = require('./routes/users.js');
const orderRoute = require('./routes/orders.js');

app.use('/uploads', express.static(`${__dirname}/uploads`));
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.use('/users', usersRoute);
app.use('/orders', orderRoute);

const PORT = process.env.PORT || 3000;
connectDB();
app.listen(PORT, () => console.log(`Listening on Port ${PORT}`));
