import mongoose from "mongoose";
import dotenv from "dotenv";
dotenv.config({ path: '../.env' });


const connectToDatabase = async () => {
  try {
    const mongoURI = process.env.DB_URL + "/" + process.env.DB_NAME;
    mongoose.set('strictQuery', false);

    await mongoose.connect(mongoURI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });

    console.log("Connected to MongoDB local");
  } catch (error) {
    console.error("MongoDB connection error:", error.message);
  }
};

export default connectToDatabase;
