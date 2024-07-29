import express from "express";
import {
  createVacationPeriod,
  deleteVacationPeriod,
  getLastInsertedVacationPeriod,
  getVacationPeriodById,
  getVacationPeriods,
  getVacationPeriodsByDuration,
  updateVacationPeriod,
} from "../controllers/VacationPeriodController.js";

const router = express.Router();

router.post("/", createVacationPeriod);
router.get("/", getVacationPeriods);
router.get("/by-duration", getVacationPeriodsByDuration);
router.get("/last-inserted", getLastInsertedVacationPeriod);
router.get("/:id", getVacationPeriodById);
router.put("/:id", updateVacationPeriod);
router.delete("/:id", deleteVacationPeriod);

export default router;
