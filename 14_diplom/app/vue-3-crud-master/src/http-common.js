import axios from "axios";

export default axios.create({
  baseURL: "http://158.160.113.227:8080/api",
  headers: {
    "Content-type": "application/json"
  }
});
