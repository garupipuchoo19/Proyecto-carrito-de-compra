const db = require("../config/db");

exports.listar = (req, res) => {
    db.query("SELECT * FROM productos", (err, results) => {

        if (err) {
            console.error("Error obteniendo productos:", err);
            return res.render("index", { productos: [] }); // evitar crash
        }

        // Si no hay productos, enviamos un arreglo vacío
        if (!results || results.length === 0) {
            return res.render("index", { productos: [] });
        }

        res.render("index", { productos: results });
    });
};
