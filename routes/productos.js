const express = require("express");
const router = express.Router();
const controller = require("../controllers/productosController");

// Página principal de productos
router.get("/", controller.listaProductos);

module.exports = router;
