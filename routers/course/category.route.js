const express = require("express");
const router = express.Router();
const controller = require("../../controllers/course/category.controller");

router.get("/", controller.allCategory);

module.exports = router;
