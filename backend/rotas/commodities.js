var express = require("express");
var router = express.Router();

const listCommodities = require("../data/commodities.json");
// Home page route
router.get("/", function (req, res) {
  console.log(listCommodities);
  res.json(listCommodities);
});

module.exports = router;
