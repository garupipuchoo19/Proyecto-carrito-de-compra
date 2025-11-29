const db = require("../config/db");

module.exports = {

    verCarrito(req, res) {
        if (!req.session.user) return res.redirect("/login");

        const uid = req.session.user.id;

        db.query(`
            SELECT c.id, p.nombre, p.precio, p.imagen, c.cantidad 
            FROM carrito c
            INNER JOIN productos p ON c.producto_id = p.id
            WHERE c.usuario_id = ?
        `, [uid], (err, items) => {

            let total = 0;
            items.forEach(i => total += i.precio * i.cantidad);

            res.render("carrito", {
                titulo: "Mi Carrito",
                user: req.session.user,
                items,
                total
            });
        });
    },

    agregar(req, res) {
        if (!req.session.user) return res.redirect("/login");

        const uid = req.session.user.id;
        const pid = req.params.id;

        db.query(`
            INSERT INTO carrito(usuario_id, producto_id, cantidad)
            VALUES (?, ?, 1)
            ON DUPLICATE KEY UPDATE cantidad = cantidad + 1
        `, [uid, pid], () => res.redirect("/"));
    },

    menos(req, res) {
        db.query(`
            UPDATE carrito SET cantidad = cantidad - 1
            WHERE id = ? AND cantidad > 1
        `, [req.params.id], () => res.redirect("/carrito"));
    },

    mas(req, res) {
        db.query(`
            UPDATE carrito SET cantidad = cantidad + 1
            WHERE id = ?
        `, [req.params.id], () => res.redirect("/carrito"));
    },

    eliminar(req, res) {
        db.query("DELETE FROM carrito WHERE id = ?", [req.params.id], () => {
            res.redirect("/carrito");
        });
    }

};
