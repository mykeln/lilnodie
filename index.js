const dotenv = require('dotenv').config();
const express = require('express');
const app = express();
const path = require('path');
const ejs = require('ejs');

// setting any .env variables
// const sessionKey = process.env.SESSION_KEY;


// Set EJS as the view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static(path.join(__dirname)));
app.use(express.static('public'));


app.get('/', async (req, res) => {
  try {
    res.render('layout', { 
      body: await ejs.renderFile('./views/home.ejs')
      // If you don't need any special content in the head, you don't need to pass a head property
    });
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
});

app.get('/about', async (req, res) => {
  try {
    // If the user is not logged in, render the home page
    res.render('layout', { 
      body: await ejs.renderFile('./views/about.ejs')
      // If you don't need any special content in the head, you don't need to pass a head property
    });
  } catch (error) {
    console.error(error);
    res.status(400).json({ error: error.message });
  }
});

app.listen(3000, () => {
  console.log('Server is running on http://localhost:3000');
});
