import User from "../models/UserModel.js";
import "dotenv/config";
import PDFDocument from "pdfkit";
import fs from "fs";
import { extractFilename } from "./SignatureController.js";
import { join, dirname } from "path";
import { fileURLToPath } from "url";
import Jimp from "jimp";
import xl from "excel4node";

function extractPictureName(url) {
  // Split the URL by the '/' character to get the segments
  const segments = url.split("/");

  // The last segment is the name of the picture with the extension
  const pictureNameWithExtension = segments.pop();

  // Return the picture name with the extension
  return pictureNameWithExtension;
}

export async function teachersListPdf(req, res) {
  try {
    const wb = new xl.Workbook();
    const ws = wb.addWorksheet("Sheet 1");
    const headers = [
      "matricule",
      "fullName",
      // "email",
      "status",
      "signatureImage",
    ];
    const __dirname = dirname(fileURLToPath(import.meta.url));

    const users = await User.find({ role: "ENSEIGNANT" });
    const headerStyle = wb.createStyle({
      font: { bold: true },
      border: {
        left: { style: "thin", color: "black" },
        right: { style: "thin", color: "black" },
        top: { style: "thin", color: "black" },
        bottom: { style: "thin", color: "black" },
      },
    });

    const cellStyle = wb.createStyle({
      border: {
        left: { style: "thin", color: "black" },
        right: { style: "thin", color: "black" },
        top: { style: "thin", color: "black" },
        bottom: { style: "thin", color: "black" },
      },
    });

    headers.forEach((header, index) => {
      ws.cell(1, index + 1)
        .string(header)
        .style(headerStyle);
    });

    // Set column width for the E column
    ws.column(4).setWidth(20);

    ws.column(2).setWidth(34);

    // Set row height for header to accommodate two lines of text
    ws.row(1).setHeight(40);

    // Function to read image and convert to base64
    const getImageBase64 = async (imagePath) => {
      try {
        const image = await Jimp.read(imagePath);
        return await image.getBase64Async(Jimp.MIME_PNG);
      } catch (error) {
        console.error("Error processing image:", error);
        return null;
      }
    };

    for (let rowIndex = 0; rowIndex < users.length; rowIndex++) {
      const item = users[rowIndex];
      ws.row(rowIndex + 2).setHeight(30);
      for (let colIndex = 0; colIndex < headers.length; colIndex++) {
        const header = headers[colIndex];
        if (header === "signatureImage" && item[header]) {
          const imagePath = join(
            __dirname,
            "../public/images/",
            extractPictureName(item[header])
          );
          const base64Image = await getImageBase64(imagePath);
          if (base64Image) {
            const image = await Jimp.read(
              Buffer.from(base64Image.split(",")[1], "base64")
            );

            // Resize image to fit within the column width
            const columnWidth = 20 * 7; // Approx 7 pixels per character
            const aspectRatio = image.bitmap.width / image.bitmap.height;
            const imageHeight = columnWidth / aspectRatio;

            const resizedImage = await image
              .resize(columnWidth, imageHeight)
              .getBufferAsync(Jimp.MIME_PNG);
            const tempImagePath = join(
              __dirname,
              `../public/temp/${item.matricule}.png`
            );
            fs.writeFileSync(tempImagePath, resizedImage);
            ws.addImage({
              path: tempImagePath,
              type: "picture",
              position: {
                type: "oneCellAnchor",
                from: {
                  col: 4, // E column
                  colOff: 0,
                  row: rowIndex + 2,
                  rowOff: 0,
                },
              },
            });
          }
          ws.cell(4).style(cellStyle);
        } else {
          const value = item[header] ? item[header].toString() : "";
          ws.cell(rowIndex + 2, colIndex + 1)
            .string(value)
            .style(cellStyle);
        }
      }
    }

    const outputFilePath = join(__dirname, "../public/files/output.xlsx");
    wb.write(outputFilePath, (err, stats) => {
      if (err) {
        console.error(err.message);
        res.status(400).json({ error: err.message });
      } else {
        console.log("Excel file has been created!");
        res.status(200).json({ pdfLink: `${process.env.PDF_LINK}output.xlsx` });
      }
    });
  } catch (error) {
    console.error(error.message);
    res.status(500).send("An error occurred while generating the PDF.");
  }
}

export async function getLastUpdatedUsers(req, res) {
  try {
    const lastUpdatedUsers = await User.find({ role: "ENSEIGNANT" })
      .sort({ updatedAt: -1 })
      .limit(5); // Limiting to 10 users for example
    const formattedUsers = lastUpdatedUsers.map((user) => {
      const updatedAt = new Date(user.updatedAt);
      const formattedDate = new Intl.DateTimeFormat("en-US", {
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
      }).format(updatedAt);

      return {
        ...user.toObject(),
        updatedAt: formattedDate,
      };
    });
    res.status(200).send(formattedUsers);
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: "Internal server error" });
  }
}

// get all users
export async function getAllUsers(req, res, next) {
  try {
    const sort = req.query.sort || ""; // Default to empty string if sort parameter is not provided
    const search = req.query.search || ""; // Default to empty string if search parameter is not provided
    let query = { role: "ENSEIGNANT" };

    // Add search condition if search parameter is provided
    if (
      search !== "" &&
      search !== "null" &&
      search !== undefined &&
      search !== null
    ) {
      query = {
        ...query,
        // Define the field you want to search on and the search term
        // Here I'm assuming you want to search on the "name" field
        email: { $regex: search, $options: "i" }, // Case-insensitive search
      };
    }

    // Apply sorting if sort parameter is provided
    if (
      sort !== "" &&
      sort !== null &&
      sort !== undefined &&
      sort !== "null" &&
      sort !== "ALL"
    ) {
      query = {
        ...query,
        // Define the field you want to search on and the search term
        // Here I'm assuming you want to search on the "name" field
        status: { $regex: sort, $options: "i" }, // Case-insensitive search
      };
    }
    const users = await User.find(query);
    console.log(users);

    const formattedUsers = users.map((user) => {
      const updatedAt = new Date(user.updatedAt);
      const formattedDate = new Intl.DateTimeFormat("en-US", {
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
      }).format(updatedAt);

      return {
        ...user.toObject(),
        updatedAt: formattedDate,
      };
    });
    res.status(200).send(formattedUsers);
  } catch (error) {
    console.log(error);
  }
}

export async function addUser(req, res, next) {
  const user = await User.create(req.body);
  res.status(200).send(user);
  try {
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: error.message });
  }
}

export async function getNumberOfConnectedUser(req, res, next) {
  try {
    const users = await User.countDocuments({
      role: "ENSEIGNANT",
      status: "LOGIN",
    });
    res.status(200).json(users);
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: error.message });
  }
}
export async function getNumberOfSignedUser(req, res, next) {
  try {
    const users = await User.countDocuments({
      role: "ENSEIGNANT",
      status: "DONE",
    });
    res.status(200).json(users);
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: error.message });
  }
}
export async function getAllUsersCount(req, res, next) {
  try {
    const users = await User.countDocuments({
      role: "ENSEIGNANT",
    });
    res.status(200).json(users);
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: error.message });
  }
}

export async function getDashboardData(req, res, next) {
  try {
    const getAllUsersCount = await User.countDocuments({
      role: "ENSEIGNANT",
    });

    const getAllSignedUsers = await User.countDocuments({
      role: "ENSEIGNANT",
      status: "DONE",
    });
    const getAllLogedInUsers = await User.countDocuments({
      role: "ENSEIGNANT",
      $or: [{ status: "LOGIN" }, { status: "DONE" }],
    });
    console.log(getAllSignedUsers);
    console.log(getAllLogedInUsers);

    let data = {
      allUsersCount: getAllUsersCount,
      allSignedUsers: getAllSignedUsers,
      allSignedUsersPercentage: (getAllSignedUsers / getAllUsersCount) * 100,
      allLogedInUsers: getAllLogedInUsers,
      allLogedInUsersPercentage: (getAllLogedInUsers / getAllUsersCount) * 100,
      signedTeachers: getAllSignedUsers / getAllUsersCount,
      connectedTeachers: getAllLogedInUsers / getAllUsersCount,
    };
    console.log(data);
    res.status(200).send(data);
  } catch (error) {
    console.error(error);
    res.status(500).send({ error: error.message });
  }
}
