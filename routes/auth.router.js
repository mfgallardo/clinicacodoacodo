const express = require("express");
const router = express.Router();

const authMiddleware = require("../middlewares/auth.middleware");

const controller = require("../controllers/auth.controller");

router.post("/register", controller.register);
router.post("/login", controller.login);

router.get(`/protected`, authMiddleware, (req, res) => {
  res.json({ userId: req.userId });
});

module.exports = router;
