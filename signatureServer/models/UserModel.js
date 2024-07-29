import mongoose from "mongoose";
const { Schema, model } = mongoose;

const userSchema = new Schema(
  {
    fullName: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    matricule: {
      type: String,
      required: true,
      unique: true,
    },
    image: {
      type: String,
    },
    role: {
      type: String,
      enum: ["ENSEIGNANT", "ADMIN", "SUPERADMIN"],
      default: "ENSEIGNANT",
      required: true,
    },
    status: {
      type: String,
      enum: ["LOGIN", "DONE", "NOLOG"],
      default: "NOLOG",
      required: true,
    },

    signatureImage: {
      type: String,
    },
    verificationCode: {
      type: String,
    },
    verified: {
      type: Boolean,
      default: false,
      required: true,
    },
  },
  {
    timestamps: true,
  }
);

export default model("User", userSchema);
