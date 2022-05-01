const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

// get all routes
var commodities = require("./rotas/commodities");
var noticias = require("./rotas/noticias");
const app = express();
const port = 3000;

app.use(cors());

// Configuring body parser middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/commodities", commodities);
app.use("/noticias", noticias);

app.listen(port, () =>
  console.log(`Hello world app listening on port ${port}!`)
);
