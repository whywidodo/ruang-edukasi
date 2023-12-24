require("dotenv").config();

const express = require("express");
const cors = require("cors");
const app = express();
const port = process.env.PORT || 3000;
const bodyParser = require("body-parser");
const router = require("./routers/router");

app.use(express.json({ strict: false }));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
app.use('/images', express.static('public/images'))
app.use("/api/v1", router);

app.listen(port, () => {
    console.log(`Server is runing at port ${port}`);
});