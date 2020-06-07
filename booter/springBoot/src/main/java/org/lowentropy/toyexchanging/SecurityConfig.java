package org.lowentropy.toyexchanging;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .cors().and()
                .addFilterAfter(new FirebaseAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class)
                .authorizeRequests()
                .anyRequest().authenticated();
    }

    @Bean
    FirebaseApp initFirebase(ResourceLoader resourceLoader) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(
                "C:\\dev\\projects\\appProjects\\toy-exchange\\serviceAccountKey.json");

        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(createGoogleCredentials(fileInputStream))
                .setDatabaseUrl("https://toy-exchange.firebaseio.com")
                .build();

       return FirebaseApp.initializeApp(options);
    }

    private InputStream createInputStream(String serviceAccountJson) {
        return this.getClass().getResourceAsStream(serviceAccountJson);
    }

    private static GoogleCredentials createGoogleCredentials(InputStream fileInputStream) {
        try {
            return GoogleCredentials.fromStream(fileInputStream);
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
