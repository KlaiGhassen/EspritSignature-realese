import mongoose from "mongoose";

const { Schema, model } = mongoose;

const vacationSchema = new Schema(
  {
    user_id: {
      type: Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    vacation_period_id: {
      type: Schema.Types.ObjectId,
      ref: "VacationPeriod",
      required: true,
    },
    start_date: {
      type: Date,
      required: true,
    },
    end_date: {
      type: Date,
      required: true,
    },
    signatureImageStart: {
      type: String,
    },
    signatureImageEnd: {
      type: String,
    },
    status: {
      type: String,
      enum: ["ND", "HD", "FD"],
      default: "ND",
    },
  },
  { timestamps: true }
);
export default model("Vacation", vacationSchema);
