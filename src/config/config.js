import mysql2 from "mysql2"; // Needed to fix sequelize issues with WebPack
module.exports = {
  development: {
    username: "sql6635735",
    password: "1bmsJepqQz",
    database: "sql6635735",
    host: "sql6.freesqldatabase.com",
    port: "3306",
    dialect: "mysql",
  },
  /* test: {
        username: 'root',
        password: null,
        database: 'database_test',
        host: '127.0.0.1',
        dialect: 'mysql',
        dialectModule: mysql2,
    }, */
  production: {
    username: "tanluc1",
    password: "tanluc1",
    database: "testShopping",
    host: "localhost",
    port: "3306",
    dialect: "mysql",
  },
};
