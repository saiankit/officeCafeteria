const express = require('express');
const mongoose = require('mongoose');
const app = express();
const User = require('./models/user');

app.use(express.json);



app.get('/',(req,res) => {
    res.send("Hello World");
})

app.post('/create_user',(req,res) => {
    console.log(req.body.name);
    res.send(`User Created ${req.body.name}`);
})

mongoose.connect('mongodb+srv://admin:admin123@officecafetaria.jmaku.mongodb.net/<dbname>?retryWrites=true&w=majority',{ useNewUrlParser: true , useUnifiedTopology: true })
.then( result => {
    console.log('db connected');
    app.listen(3000,()=>console.log('Listening on Port 3000'));
}).catch(err => console.log(err));

