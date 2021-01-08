const express = require('express');
const User = require('../models/user.js');

const router = express.Router();

router.post('/create_user', (req, res) => {
  const userToSave = User(req.body);
  userToSave
    .save()
    .then((item) => {
      res.send('item saved to database');
    })
    .catch((err) => {
      res.status(400).send(`unable to save to database ${err}`);
    });
});

module.exports = router;
