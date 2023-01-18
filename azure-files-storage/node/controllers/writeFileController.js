import * as express from "express";
import { v4 as uuidv4 } from "uuid";
import { writeFile } from "fs";
import { resolve } from "path";

const router = express.Router();

export const writeFileController = router.get("/", (_req, res) => {
  const content = "This is a file being stored on container storage";
  const fileName = `${uuidv4()}.txt`;
  const path = resolve("files")

  writeFile(`${path}/${fileName}`, content, (err) => {
    if (err) return res.status(500).json({ error: err });

    res.json({ msg: `File name ${fileName} created.` });
  });
});
