var express = require("express");
var app = express();
var port = process.env.PORT || 3000;
app.listen(port);

var mysql = require("mysql");
var conn = mysql.createConnection({
    user: "EEIT24",
    password: "AAAbbb111222@",
    host: "wizard71029.synology.me",
    database: "AAA"
})
conn.connect(function (err) {
    if (err) res.send(err);
})

app.get("/", function (req, res) {
    conn.query("select * from wordcard", function (error, results, fields) {
        results.forEach(function (ele, i) {
            console.log(ele);
        })
        res.send(JSON.stringify(results));
    });

})