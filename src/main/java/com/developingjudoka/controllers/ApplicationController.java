package com.developingjudoka.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class ApplicationController {

    @GetMapping("/properties")
    public String applicationStatic() {
        log.info("Calling properties page");
        return "properties";
    }

    @GetMapping("/basic")
    public String applicationBasic() {
        log.info("Calling basic page");
        return "basic";
    }


    @GetMapping("/realtime")
    public String applicationWebSocket() {
        log.info("Calling websocket page");
        return "websocket";
    }
}