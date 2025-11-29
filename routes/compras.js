const express = require("express");
const router = express.Router();
const controller = require("../controllers/comprasController");

router.post("/comprar", controller.comprar);
router.get("/historial", controller.historial);
router.get("/ticket/:id", controller.verTicket);

module.exports = router;
