var express = require("express");
var router = express.Router();

const listNoticias = require("../data/noticias.json");
// Home page route
router.get("/", function (req, res) {
  console.log(listNoticias);
  res.json(listNoticias);
});

module.exports = router;
