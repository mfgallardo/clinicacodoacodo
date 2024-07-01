const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'clinicacodoacodo'
});

connection.connect((err) => {
    if (err) {
        console.error('error en coneccion : ' + err.stack);
        return;
    }
    console.log('Base de datos CaC conectada ');
});

module.exports = connection;
