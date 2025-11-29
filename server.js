const express = require("express");
const session = require("express-session");
const expressLayouts = require("express-ejs-layouts");
const path = require("path");

const app = express();

// Middlewares
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(session({
    secret: "secretoo123",
    resave: false,
    saveUninitialized: false
}));

// Archivos estáticos
app.use(express.static(path.join(__dirname, "public")));

// Configuración de EJS + Layouts
app.set("view engine", "ejs");
app.use(expressLayouts);
app.set("layout", "layout");

// Rutas
app.use("/", require("./routes/auth"));
app.use("/", require("./routes/productos"));
app.use("/", require("./routes/carrito"));
app.use("/", require("./routes/compras"));

// PORT para Railway
const PORT = process.env.PORT || 3000;

// Iniciar servidor
app.listen(PORT, () => {
    console.log("Servidor funcionando en el puerto: " + PORT);
});
