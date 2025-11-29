const db = require("../config/db");

module.exports = {
    listaProductos(req, res) {
        db.query("SELECT * FROM productos", (err, productos) => {
            res.render("index", {
                titulo: "Productos",
                user: req.session.user,
                productos
            });
        });
    }
};
