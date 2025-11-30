const db = require("../config/db");

exports.listar = (req, res) => {
    db.query("SELECT * FROM productos", (err, results) => {

        if (err) {
            console.error("Error obteniendo productos:", err);
            return res.render("index", { 
                productos: [], 
                user: req.session.user || null 
            });
        }

        res.render("index", { 
            productos: results,
            user: req.session.user || null
        });
    });
};
