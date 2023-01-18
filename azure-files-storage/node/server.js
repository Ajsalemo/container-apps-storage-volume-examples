import express from "express";
import { homeController } from "./controllers/homeController.js";
import { writeFileController } from "./controllers/writeFileController.js";
import { readFileController } from "./controllers/readFileController.js";

const app = express();
const port = process.env.PORT || 3000;

app.use("/", homeController);
app.use("/api/write", writeFileController);
app.use("/api/read", readFileController);

app.listen(port, () => console.log(`Server is listening on port ${port}.`));
