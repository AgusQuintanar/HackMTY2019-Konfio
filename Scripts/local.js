var mysql = require('mysql');
var pool = mysql.createPool({
    host            : 'konfiodb.cklpdzvncjnq.us-east-1.rds.amazonaws.com',
    user            : 'konfio',
    password        : 'a1b2c3d4e5',
    database        : 'konfiodb',
    connectionLimit : 10,               // this is the max number of connections before your pool starts waiting for a release
    multipleStatements : true           // I like this because it helps prevent nested sql statements, it can be buggy though, so be careful
});

pool.getConnection(function (err, conn) {
    if (err)
        return res.send(400);

    // if you got a connection...
    conn.query('SELECT * FROM table WHERE id=? AND name=?', [id, name], function(err, rows) {
        if(err) {
            conn.release();
            return res.send(400, 'Couldnt get a connection');
        }

        // for simplicity, just send the rows
        res.send(rows);

        // CLOSE THE CONNECTION
        conn.release();
    }
});