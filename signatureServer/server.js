import express from "express";
import mongoose from "mongoose";
import morgan from "morgan";
import cors from "cors";
import "dotenv/config";
import connectToDatabase from "./utils/databaseConnection.js";

import { notFoundError, errorHandler } from "./middlewares/error-handler.js";

// import routes
import authRoutes from "./routes/AuthRoute.js";
import userRoutes from "./routes/UserRoute.js";
import signatureRoutes from "./routes/SignatureRoute.js";
import vacationPeriod from "./routes/VacationPeriodRoute.js";
import vacation from "./routes/VacationRoute.js";
import { authenticateToken } from "./middlewares/authorise.js";

const app = express();
const port = process.env.PORT || 3000;
app.use(cors());

mongoose.set("debug", true);
mongoose.Promise = global.Promise;
connectToDatabase();

app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/api/img", express.static("public/images"));
app.use("/api/files", express.static("public/files"));

app.use("/api/auth", authRoutes);
app.use("/api/users", userRoutes);

app.use("/api/signature", signatureRoutes);
app.use("/api/vacation-period", vacationPeriod);
app.use("/api/vacation", vacation);

app.use(notFoundError);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
