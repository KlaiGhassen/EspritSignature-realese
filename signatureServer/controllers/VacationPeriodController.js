import VacationPeriod from "../models/VacationPeriod.js";

// Create a new vacation period
export const createVacationPeriod = async (req, res) => {
  try {
    const { name, start_date, end_date } = req.body;
    const newVacationPeriod = new VacationPeriod({
      name,
      start_date,
      end_date,
    });
    await newVacationPeriod.save();
    res.status(201).json(newVacationPeriod);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Read all vacation periods
export const getVacationPeriods = async (req, res) => {
  try {
    const vacationPeriods = await VacationPeriod.find();
    res.status(200).json(vacationPeriods);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Read a single vacation period by ID
export const getVacationPeriodById = async (req, res) => {
  try {
    const vacationPeriod = await VacationPeriod.findById(req.params.id);
    if (!vacationPeriod) {
      return res.status(404).json({ message: "Vacation period not found" });
    }
    res.status(200).json(vacationPeriod);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Update a vacation period by ID
export const updateVacationPeriod = async (req, res) => {
  try {
    const { name, start_date, end_date } = req.body;
    const vacationPeriod = await VacationPeriod.findByIdAndUpdate(
      req.params.id,
      { name, start_date, end_date },
      { new: true, runValidators: true }
    );
    if (!vacationPeriod) {
      return res.status(404).json({ message: "Vacation period not found" });
    }
    res.status(200).json(vacationPeriod);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete a vacation period by ID
export const deleteVacationPeriod = async (req, res) => {
  try {
    const vacationPeriod = await VacationPeriod.findByIdAndDelete(
      req.params.id
    );
    if (!vacationPeriod) {
      return res.status(404).json({ message: "Vacation period not found" });
    }
    res.status(200).json({ message: "Vacation period deleted" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
// Find vacation periods by duration
export const getVacationPeriodsByDuration = async (req, res) => {
  try {
    const { start_date, end_date } = req.query;
    if (!start_date || !end_date) {
      return res
        .status(400)
        .json({ message: "Start date and end date are required" });
    }

    // Parse dates
    const startDate = new Date(start_date);
    const endDate = new Date(end_date);

    // Query vacation periods that overlap with the given date range
    const vacationPeriods = await VacationPeriod.find({
      start_date: { $lte: endDate },
      end_date: { $gte: startDate },
    });

    res.status(200).json(vacationPeriods);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
// Get the last inserted vacation period
export const getLastInsertedVacationPeriod = async (req, res) => {
  try {
    const lastVacationPeriod = await VacationPeriod.findOne().sort({
      createdAt: -1,
    });
    if (!lastVacationPeriod) {
      return res.status(404).json({ message: "No vacation period found" });
    }
    res.status(200).json(lastVacationPeriod);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
