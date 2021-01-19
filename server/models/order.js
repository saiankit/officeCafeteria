const mongoose = require('mongoose');

const { Schema } = mongoose;

const orderSchema = new Schema({
  createdAt: {
    type: Date,
    required: true,
  },
  orderProducts: {
    type: Array,
    required: true,
  },
  registrationId: {
    type: String,
    required: true,
  },
  orderId: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model('Order', orderSchema);
