package com.developingjudoka.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class ApplicationController {

    @GetMapping("/static")
    public String applicationStatic() {
        log.info("Calling static page");
        return "application";
    }

    @GetMapping("/realtime")
    public String applicationWebSocket() {
        log.info("Calling websocket page");
        return "websocket";
    }
}