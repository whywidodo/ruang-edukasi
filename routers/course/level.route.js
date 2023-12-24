const express = require("express");
const router = express.Router();
const controller = require("../../controllers/course/level.controller");

router.get("/", controller.allLevel);

module.exports = router;
