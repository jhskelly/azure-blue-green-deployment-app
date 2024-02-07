package com.developingjudoka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@EnableWebMvc
@RestController
@EnableScheduling
@SpringBootApplication
public class AzureBlueGreenDeploymentAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(AzureBlueGreenDeploymentAppApplication.class, args);
    }
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }
}
