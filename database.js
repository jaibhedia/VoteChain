var mysql = require("mysql");

var conn = mysql.createConnection({
  host: "localhost", // Replace with your actual host name
  user: "root", // Replace with your actual database username
  password: "mysql", // Replace with your actual database password
  database: "adhar", // Replace with your actual database name
});

conn.connect(function (err) {
  if (err) {
    console.error("Error connecting: " + err.stack);
    return;
  }
  console.log("Database is connected successfully!");
});

module.exports = conn;
