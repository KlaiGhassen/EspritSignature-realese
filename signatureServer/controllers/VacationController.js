import Vacation from "../models/Vacation.js";

export const getVacationByPeriod = async (req, res) => {
  try {
    console.log(req.params.vacation_period_id);
    const vacation = await Vacation.find({
      vacation_period_id: req.params.vacation_period_id,
    }).populate("user_id");

    if (!vacation) {
      return res.status(404).json({ message: "Vacation not found" });
    }
    res.status(200).json(vacation);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
// Create a new vacation
export const createVacation = async (req, res) => {
  try {
    const {
      user_id,
      vacation_period_id,
      start_date,
      end_date,
      signatureImageStart,
      signatureImageEnd,
      status,
    } = req.body;
    const newVacation = new Vacation({
      user_id,
      vacation_period_id,
      start_date,
      end_date,
      signatureImageStart,
      signatureImageEnd,
      status,
    });
    await newVacation.save();
    res.status(201).json(newVacation);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Read all vacations
export const getVacations = async (req, res) => {
  try {
    const vacations = await Vacation.find()
      .populate("user_id")
      .populate("vacation_period_id");
    res.status(200).json(vacations);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Read a single vacation by ID
export const getVacationById = async (req, res) => {
  try {
    const vacation = await Vacation.findById(req.params.id).populate("user_id");
    if (!vacation) {
      return res.status(404).json({ message: "Vacation not found" });
    }
    res.status(200).json(vacation);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Update a vacation by ID
export const updateVacation = async (req, res) => {
  try {
    const {
      user_id,
      vacation_period_id,
      start_date,
      end_date,
      signatureImageStart,
      signatureImageEnd,
      status,
    } = req.body;
    const vacation = await Vacation.findByIdAndUpdate(
      req.params.id,
      {
        user_id,
        vacation_period_id,
        start_date,
        end_date,
        signatureImageStart,
        signatureImageEnd,
        status,
      },
      { new: true, runValidators: true }
    )
      .populate("user_id")
      .populate("vacation_period_id");
    if (!vacation) {
      return res.status(404).json({ message: "Vacation not found" });
    }
    res.status(200).json(vacation);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Delete a vacation by ID
export const deleteVacation = async (req, res) => {
  try {
    const vacation = await Vacation.findByIdAndDelete(req.params.id);
    if (!vacation) {
      return res.status(404).json({ message: "Vacation not found" });
    }
    res.status(200).json({ message: "Vacation deleted" });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Find vacations by user ID
export const getVacationsByUser = async (req, res) => {
  try {
    const { user_id } = req.query;
    if (!user_id) {
      return res.status(400).json({ message: "User ID is required" });
    }

    const vacations = await Vacation.find({ user_id }).populate(
      "vacation_period_id"
    );
    res.status(200).json(vacations);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

// Find vacations by date range
export const getVacationsByDuration = async (req, res) => {
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

    // Query vacations that overlap with the given date range
    const vacations = await Vacation.find({
      start_date: { $lte: endDate },
      end_date: { $gte: startDate },
    })
      .populate("user_id")
      .populate("vacation_period_id");

    res.status(200).json(vacations);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};
// Read a single vacation by ID
