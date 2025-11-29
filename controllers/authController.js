const db = require("../config/db");
const bcrypt = require("bcryptjs");

module.exports = {

    vistaLogin(req, res) {
        res.render("login", { titulo: "Login", user: req.session.user });
    },

    vistaRegistro(req, res) {
        res.render("registro", { titulo: "Registro", user: req.session.user });
    },

    registro(req, res) {
        const { nombre, correo, password } = req.body;

        const hash = bcrypt.hashSync(password, 10);

        db.query(
            "INSERT INTO usuarios(nombre, correo, password) VALUES (?, ?, ?)",
            [nombre, correo, hash],
            () => res.redirect("/login")
        );
    },

    login(req, res) {
        const { correo, password } = req.body;

        db.query("SELECT * FROM usuarios WHERE correo = ?", [correo], (err, results) => {
            if (results.length === 0) return res.send("Usuario no encontrado");

            const user = results[0];

            if (!bcrypt.compareSync(password, user.password))
                return res.send("Contraseña incorrecta");

            req.session.user = user;
            res.redirect("/");
        });
    },

    logout(req, res) {
        req.session.destroy();
        res.redirect("/login");
    }
};
