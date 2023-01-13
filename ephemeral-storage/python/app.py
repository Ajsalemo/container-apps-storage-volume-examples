from flask import Flask
import os
import uuid

app = Flask(__name__)

@app.route("/")
def index():
    return { "msg": "container-apps-storage-volume-examples-ephemeral-storage-python" }


@app.route("/api/write")
def write_file():
    try:
        id = uuid.uuid4()
        filename = f"files/{id}.txt"
        c = "This is a file being stored on container storage"

        with open(filename, "w") as file:
            file.write(c)

        return { "msg": f"File name {filename} created." }
    except IOError as e:
        return { "error": str(e) }
    


@app.route("/api/read")
def read_file():
    try:
        filename = os.path.abspath('files/file.txt')

        with open(filename, "r") as file:
            r = file.read()
            print(r)

            return { "msg": r }
    except IOError as e:
        return { "error": str(e) } 

