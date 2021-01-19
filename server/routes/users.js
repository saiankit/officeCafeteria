const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();
const User = require('../models/user.js');
const regId = require('../middlewares/registrationID');

const jwtSecret = process.env.JWT_SECRET_TOKEN;
const router = express.Router();

router.post('/register', (req, res) => {
  const newUser = User({
    name: req.body.name,
    organization: req.body.organization,
    employeeID: req.body.employeeID,
    phoneNumber: req.body.phoneNumber,
    email: req.body.email,
    password: req.body.password,
    registrationId: regId(),
    createdAt: Date.now(),
    idCard: {
      data: req.body.idCard,
      contentType: 'image/png',
    },
  });
  bcrypt.genSalt(10, (err, salt) => {
    bcrypt.hash(newUser.password, salt, (error, hash) => {
      // Encrypting the password
      newUser.password = hash;
      newUser
        .save()
        .then(() => {
          const jwtpayload = {
            id: newUser.id,
            name: newUser.name,
            registrationId: newUser.registrationId,
          };
          const token = jwt.sign(jwtpayload, jwtSecret);
          const { registrationId } = newUser;
          const response = {
            token,
            registrationId,
          };
          res.status(201).send(response);
        })
        .catch((errorInStoring) => {
          res.status(400).send(`unable to save to database ${errorInStoring}`);
        });
    });
  });
});
// Step 8 - the POST handler for processing the uploaded file

router.get('/me', (req, res) => {
  const token = req.headers['x-access-token'];
  if (!token) return res.status(401).send({ auth: false, message: 'No token provided.' });
  jwt.verify(token, jwtSecret, (err, decoded) => {
    if (err) return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });
    res.status(200).send(decoded);
  });
});

router.post('/login', (req, res) => {
  User.findOne({ email: req.body.email }, (err, user) => {
    if (err) return res.status(500).send('Error on the server.');
    if (!user) return res.status(404).send('No user found.');
    const passwordIsValid = bcrypt.compareSync(req.body.password, user.password);
    if (!passwordIsValid) return res.status(401).send({ auth: false, token: null });
    const jwtpayload = {
      id: user.id,
      name: user.name,
    };
    const token = jwt.sign(jwtpayload, jwtSecret);
    const { registrationID } = user;
    const response = {
      token,
      registrationID,
    };
    res.status(201).send(response);
  });
});

module.exports = router;
