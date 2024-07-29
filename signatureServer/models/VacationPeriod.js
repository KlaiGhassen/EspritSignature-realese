import mongoose from "mongoose";
import moment from "moment";

const { Schema, model } = mongoose;
const parseAndStripTime = (date) => {
    const parsedDate = moment(date, "DD-MM-YYYY").startOf('day');
    if (!parsedDate.isValid()) {
      throw new Error('Invalid date format');
    }
    return parsedDate.toDate();
  };
const vacationPeriodSchema = new Schema(
  {
    name: {
      type: String,
      required: true,
    },
    start_date: {
      type: Date,
      required: true,
      set: parseAndStripTime,
    },
    end_date: {
      type: Date,
      required: true,
      set: parseAndStripTime,
    },
  },
  { timestamps: true }
);
export default model("VacationPeriod", vacationPeriodSchema);
