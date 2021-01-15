const express = require('express');
const bcrypt = require('bcrypt');
const User = require('../models/user.js');

const router = express.Router();

router.post('/', (req, res) => {
  const newUser = User(req.body);
  bcrypt.genSalt(10, (err, salt) => bcrypt.hash(newUser.password, salt, (err, hash) => {
     if (err) throw err;
      newUser.password = hash;
      newUser
        .save()
        .then((user) => {
          res.status(201).send('user saved to database');
        })
        .catch((err) => {
          res.status(400).send(`unable to save to database ${err}`);
        });
    }),
  );
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
