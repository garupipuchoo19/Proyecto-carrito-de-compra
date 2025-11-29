const express = require("express");
const router = express.Router();
const controller = require("../controllers/productosController");

router.get("/", controller.listaProductos);

module.exports = router;
