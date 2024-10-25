package com.qfmall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

/**
 * swagger2 配置类
 */
@Configuration
@EnableSwagger2WebMvc
public class SwaggerConfig {
    /**
     * 生成接口文档信息
     * 1.配置生成的文档信息
     * 2.配置生成规则
     * Docket 封装文档信息
     */
    @Bean
    public Docket getDocket(){

        // 封面信息对象
        ApiInfoBuilder apiInfoBuilder = new ApiInfoBuilder();
        apiInfoBuilder.title("《锋迷商城》后端接口文档")
                .description("接口文档详细信息")
                .version("2.0.1")
                .contact(new Contact("姬华凯","www.XXX.com","1261888027@qq.com"));
        ApiInfo apiInfo = apiInfoBuilder.build();

        // swagger指定文档风格
        // 指定生成的文档中的封面信息：文档标题、版本、作者
        Docket docket = new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo)
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.qfmall.controller"))
                .paths(PathSelectors.any())
                .build();
        return docket;
    }
}
