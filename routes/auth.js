const express = require("express");
const router = express.Router();
const controller = require("../controllers/authController");

router.get("/login", controller.vistaLogin);
router.post("/login", controller.login);
router.get("/registro", controller.vistaRegistro);
router.post("/registro", controller.registro);
router.get("/logout", controller.logout);

module.exports = router;
