package com.kaizen.eduService;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.kaizen"})  // 设置包扫描规则
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
