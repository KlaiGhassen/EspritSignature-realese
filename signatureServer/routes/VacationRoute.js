import express from "express";
import {
  createVacation,
  deleteVacation,
  getVacationById,
  getVacationByPeriod,
  getVacations,
  getVacationsByDuration,
  getVacationsByUser,
  updateVacation,
} from "../controllers/VacationController.js";

const router = express.Router();

// Create a new vacation
router.post("/", createVacation);

// Get all vacations
router.get("/", getVacations);
// Get vacations by user ID
router.get("/by-user", getVacationsByUser);


router.get("/by-period/:vacation_period_id", getVacationByPeriod);

// Get vacations by duration (date range)
router.get("/by-duration", getVacationsByDuration);

// Get a single vacation by ID
router.get("/:id", getVacationById);

// Update a vacation by ID
router.put("/:id", updateVacation);

// Delete a vacation by ID
router.delete("/:id", deleteVacation);

export default router;
