package com.containerapps.azure.Controllers;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WriteFileController {

    @GetMapping("/api/write")
    public ResponseEntity<String> writeFile() {
        UUID uuid = UUID.randomUUID();
        String text = "This is a file being stored on container storage";
        String filename = uuid + ".txt";
        String directoryName = "files";

        try {
            File directory = new File(directoryName);
            if (!directory.exists()) { 
                directory.mkdirs();
            }
            
            File file = new File(directoryName + File.separator + filename);
            try (FileWriter fWriter = new FileWriter(file.getAbsolutePath())) {
                fWriter.write(text);
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
        return new ResponseEntity<String>("File name " + filename + " created.", HttpStatus.OK);
    }
}
