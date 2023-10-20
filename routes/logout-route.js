var express = require('express');
var router = express.Router();
/* GET users listing. */
router.get('/logout', function(req, res) {
  req.session.destroy();
  res.redirect('/');
});
module.exports = router;