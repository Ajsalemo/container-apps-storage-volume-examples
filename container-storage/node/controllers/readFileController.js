import * as express from "express";
import { readFile } from "fs";
import { resolve } from "path";

const router = express.Router();

export const readFileController = router.get("/", (_req, res) => {
  // READ_FILE_NAME is an environment variable that can be used if we want to read a specific file
  // This must include the full path and file name with extension - ex. /etc/t.txt
  const fileName = process.env.READ_FILE_NAME || "files/file.txt";
  const path = resolve(fileName)

  readFile(path, "utf-8", (err, data) => {
    if (err) return res.status(500).json({ error: err });
    
    res.json({ msg: data });
  });
});
