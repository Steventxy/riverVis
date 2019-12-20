package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@EnableAutoConfiguration
@EnableWebMvc
public class RiverVisApplication {
    public static void main(String[] args) {
        SpringApplication.run(RiverVisApplication.class, args);
    }
}