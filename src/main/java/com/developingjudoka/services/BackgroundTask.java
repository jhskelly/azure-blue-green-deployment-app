package com.developingjudoka.services;

import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class BackgroundTask {
    @Scheduled(fixedRate = 1000)
    public void run(){
        log.info("BACKGROUND TASK: Running");
    }

}
