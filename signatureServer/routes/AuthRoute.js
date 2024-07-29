import express from "express";
import {
  getAccessTokenFromRefreshToken,
  login,
  getUserFromToken,
  logout,
  sendMail,
  checkCode,
} from "../controllers/AuthController.js";
import { authenticateToken } from "../middlewares/authorise.js";

const router = express.Router();

router.post("/email", sendMail);

//! login routes calls login method on controller

router.post("/sign-in", login);
router.post("/check-code", checkCode);
//! get access token from refresh token
router.get("/token", getAccessTokenFromRefreshToken);
// ! get a user from token
router.get(
  "/refresh-access-token",
  authenticateToken,
  getUserFromToken,
  (req, res) => {
    res.status(200).json({
      user: res.user,
      accessToken: res.accessToken,
    });
  }
);
router.get("/user", authenticateToken, getUserFromToken, (req, res) => {
  res.status(200).json(res.user);
});

//! logout the user
router.delete("/logout", authenticateToken, logout);

export default router;
