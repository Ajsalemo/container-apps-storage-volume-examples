import express from "express";
import { homeController } from "./controllers/homeController.js";

const app = express();
const port = process.env.PORT || 3000;

app.use("/", homeController);

app.listen(port, () => console.log(`Server is listening on port ${port}.`));
