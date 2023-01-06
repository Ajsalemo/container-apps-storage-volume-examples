package com.containerapps.azure.Controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
    String message = "storage-volume-examples-container-storage-java";

    @GetMapping("/")
    public String index() {
        return message;
    }
}