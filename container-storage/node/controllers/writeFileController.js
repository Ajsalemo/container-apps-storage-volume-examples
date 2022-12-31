import * as express from "express";
import { writeFile } from "fs"


const router = express.Router()

export const writeFileController = router.get("/", (_req, res) => {
    const content = "This is a file being stored on container storage"

    writeFile()
    res.json({ msg: "container-storage-node" })
})