const mysql = require("mysql2");

const db = mysql.createConnection({
    host: "sql5.freesqldatabase.com",
    user: "sql5809821",
    password: "3G98hbmtN8",
    database: "sql5809821",
    port: 3306,
    ssl: {
        rejectUnauthorized: true
    }
});

db.connect(err => {
    if (err) {
        console.error("❌ Error al conectar a FreeSQLDatabase:", err);
        return;
    }
    console.log("✅ Conectado a FreeSQLDatabase!");
});

module.exports = db;
