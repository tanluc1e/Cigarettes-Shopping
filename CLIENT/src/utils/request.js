import axios from "axios";
const request = axios.create({
  // 'http://localhost:8080/'
  baseURL: "https://cuahangthuocla.onrender.com/api",
});
export default request;
