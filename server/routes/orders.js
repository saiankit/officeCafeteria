const express = require('express');
require('dotenv').config();
const Order = require('../models/order.js');
const regId = require('../middlewares/registrationID');

const router = express.Router();

router.post('/save', (req, res) => {
  const order = Order({
    createdAt: Date.now(),
    orderProducts: req.body.orderProducts,
    registrationId: req.body.registrationId,
    orderId: regId(),
  });
  res.status(201).send(order);
  order.save();
});
module.exports = router;
