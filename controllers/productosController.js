exports.listaProductos = (req, res) => {
    db.query("SELECT * FROM productos", (err, results) => {
        if (err) {
            console.error("❌ Error SQL:", err);
            return res.render("index", { productos: [] });
        }

        console.log("📦 Productos recibidos:", results);

        res.render("index", { productos: results, user: req.session.user });
    });
};
