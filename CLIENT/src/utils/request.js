import axios from "axios";
const request = axios.create({
  // 'http://localhost:8080/'
  baseURL: "http://localhost:8000/api",
});
export default request;
