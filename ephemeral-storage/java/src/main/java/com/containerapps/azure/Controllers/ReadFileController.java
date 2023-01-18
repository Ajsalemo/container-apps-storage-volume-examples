package com.containerapps.azure.Controllers;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReadFileController {
    @GetMapping("/api/read")
    public ResponseEntity<String> readFile() throws IOException {
        String line = "";
        String filename = "file.txt";
        String directoryName = "files";

        File file = new File(directoryName + File.separator + filename);
        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNextLine()) {
                line = scanner.nextLine();
                System.out.println(line);
            }
            scanner.close();
        }
        return new ResponseEntity<String>(line, HttpStatus.OK);
    }
}
