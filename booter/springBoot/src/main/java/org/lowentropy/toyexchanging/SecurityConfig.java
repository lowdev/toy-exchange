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

import java.io.*;

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
    FirebaseApp initFirebase(ResourceLoader resourceLoader) {
        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(createGoogleCredentials(getServiceAccount()))
                .setDatabaseUrl("https://toy-exchange.firebaseio.com")
                .build();

       return FirebaseApp.initializeApp(options);
    }

    private InputStream getServiceAccount() {
        try {
            return new FileInputStream(
                    "C:\\dev\\projects\\appProjects\\toy-exchange\\serviceAccountKey.json");
        } catch (FileNotFoundException e) {
            String serviceAccount = System.getenv("SERVICE_ACCOUNT");
            return new ByteArrayInputStream(serviceAccount.getBytes());
        }
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
