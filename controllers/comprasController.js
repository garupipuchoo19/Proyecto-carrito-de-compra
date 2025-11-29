const db = require("../config/db");
const PDFDocument = require("pdfkit");
const fs = require("fs");

module.exports = {

    comprar(req, res) {
        const uid = req.session.user.id;

        db.query(`
            SELECT c.*, p.precio 
            FROM carrito c 
            JOIN productos p ON c.producto_id = p.id
            WHERE usuario_id = ?
        `, [uid], (err, carrito) => {

            let total = 0;
            carrito.forEach(i => total += i.cantidad * i.precio);

            db.query(`
                INSERT INTO compras(usuario_id, total)
                VALUES (?, ?)
            `, [uid, total], (err, comp) => {

                const compraId = comp.insertId;

                carrito.forEach(item => {
                    db.query(`
                        INSERT INTO compra_detalle (compra_id, producto_id, cantidad, precio_unitario)
                        VALUES (?, ?, ?, ?)
                    `, [compraId, item.producto_id, item.cantidad, item.precio]);
                });

                db.query("DELETE FROM carrito WHERE usuario_id = ?", [uid]);

                const pdf = new PDFDocument();
                const filePath = `./public/ticket_${compraId}.pdf`;
                pdf.pipe(fs.createWriteStream(filePath));

                pdf.fontSize(22).text("TICKET DE COMPRA");
                pdf.text(`ID Compra: ${compraId}`);
                pdf.text(`Total: $${total}`);
                pdf.text(`Fecha: ${new Date().toLocaleString()}`);

                pdf.end();

                res.redirect(`/ticket/${compraId}`);
            });
        });
    },

    historial(req, res) {
        const uid = req.session.user.id;

        db.query("SELECT * FROM compras WHERE usuario_id = ?", [uid], (err, compras) => {
            res.render("compras", {
                titulo: "Historial",
                user: req.session.user,
                compras
            });
        });
    },

    verTicket(req, res) {
        res.sendFile(process.cwd() + `/public/ticket_${req.params.id}.pdf`);
    }
};
