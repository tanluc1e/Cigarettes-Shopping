import { initAPIRoutes } from "./src/route/web.js";
import express from "express";
import dotenv from "dotenv";

dotenv.config();
const app = express();
const port = process.env.PORT;
const { sequelize } = require("./src/models/index");

//Hỗ trợ gửi data lên server và ngược lại
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Methods", "GET, PUT, POST, DELETE");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );

  next();
});

initAPIRoutes(app);

//404 Not Found
app.use((req, res) => {
  return res.send("404 Page Not Found");
});

async function start() {
  try {
    await sequelize.authenticate();
    await sequelize.sync();

    app.listen(port, (err) => {
      if (err) throw err;
      console.log(`\nMáy chủ đã khởi động!\nURL: http://localhost:${port}`);
    });

    console.log(
      "\nDatabase đã kết nối.\nTất cả các sơ đồ đã được đồng bộ hóa!"
    );
  } catch (error) {
    console.error(error);
  }
}

start();
