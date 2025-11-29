const express = require("express");
const router = express.Router();
const controller = require("../controllers/carritoController");

router.get("/carrito", controller.verCarrito);
router.post("/carrito/agregar/:id", controller.agregar);
router.post("/carrito/menos/:id", controller.menos);
router.post("/carrito/mas/:id", controller.mas);
router.post("/carrito/eliminar/:id", controller.eliminar);

module.exports = router;
