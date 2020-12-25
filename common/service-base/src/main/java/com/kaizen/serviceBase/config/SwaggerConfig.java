package com.kaizen.serviceBase.config;

import com.google.common.base.Predicates;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@Configuration
@EnableSwagger2
public class SwaggerConfig {

    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                .enable(true)
                .apiInfo(apiInfo())
                .select()
                // 这里配置要扫描的包，接口在哪个包就配置哪个包
                .apis(RequestHandlerSelectors.basePackage("com.kaizen"))
                .paths(PathSelectors.any())
                .paths(Predicates.not(PathSelectors.regex("/error.*"))) // 错误路径不监控
                .build();
    }

    public ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("KaizenScholl在线学习平台")
                .description("KaizenScholl在线学习平台接口")
                .termsOfServiceUrl("kaizen")
                .contact(new Contact("weizujie", "http://weizujie.vip", "byojiaoxianz7@outlook.com"))
                .version("1.0")
                .build();
    }
}