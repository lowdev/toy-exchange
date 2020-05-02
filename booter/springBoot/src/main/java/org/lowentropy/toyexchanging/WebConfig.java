package org.lowentropy.toyexchanging;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {
        "org.lowentropy.toyexchange.toy.infrastructure.web"
})
public class WebConfig {
}
