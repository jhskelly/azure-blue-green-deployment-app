package com.developingjudoka.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class ApplicationController {

    @GetMapping("/")
    public String application() {
        log.info("Calling root page");
        return "application";
    }
}