var express = require('express');
var router = express.Router();
var conn = require('../database');
var { OAuth2Client } = require('google-auth-library');
var client = new OAuth2Client('YOUR_CLIENT_ID');

router.get('/form', function(req, res, next) {
  if (req.session.loggedinUser) {
    res.render('voter-registration.ejs');
  } else {
    res.redirect('/login');
  }
});

router.post('/google-signin', async function(req, res) {
  var id_token = req.body.id_token;
  var ticket = await client.verifyIdToken({
    idToken: id_token,
    audience: 'YOUR_CLIENT_ID',  // Specify the CLIENT_ID of the app that accesses the backend
  });
  var payload = ticket.getPayload();
  var userid = payload['sub'];
  var email = payload['email'];
  var name = payload['name'];

  // Check if the user already exists in your database
  let sql = "SELECT * FROM users WHERE email = ?";
  conn.query(sql, [email], (error, results) => {
    if (error) {
      return res.status(500).json({ success: false, message: 'Database query error' });
    }
    if (results.length > 0) {
      // User exists, log them in
      req.session.loggedinUser = true;
      req.session.email = email;
      res.json({ success: true });
    } else {
      // User does not exist, create a new record
      let sql = "INSERT INTO users (email, name, google_id) VALUES (?, ?, ?)";
      conn.query(sql, [email, name, userid], (error, results) => {
        if (error) {
          return res.status(500).json({ success: false, message: 'Database insert error' });
        }
        req.session.loggedinUser = true;
        req.session.email = email;
        res.json({ success: true });
      });
    }
  });
});

// Other routes and logic...

module.exports = router;
