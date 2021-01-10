const express = require('express');
const User = require('../models/user.js');

const router = express.Router();

router.post('/', (req, res) => {
  const userToSave = User(req.body);
  userToSave
    .save()
    .then((user) => {
      res.status(201).send('user saved to database');
    })
    .catch((err) => {
      res.status(400).send(`unable to save to database ${err}`);
    });
});

router.get('/', (req, res) => {
  User.find((error, items) => {
    if (error) {
      res.status(500).send(error);
      return;
    }
    res.send(items[0].name);
  });
});

module.exports = router;
