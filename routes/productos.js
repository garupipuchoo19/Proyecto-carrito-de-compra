const express = require("express");
const router = express.Router();
const controller = require("../controllers/productosController");

// Ruta corregida
router.get("/", controller.listar);

module.exports = router;
