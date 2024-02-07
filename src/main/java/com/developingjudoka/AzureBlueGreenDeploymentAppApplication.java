package com.developingjudoka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@SpringBootApplication
@EnableWebMvc
public class AzureBlueGreenDeploymentAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(AzureBlueGreenDeploymentAppApplication.class, args);
    }

}
