package org.lowentropy.toyexchanging;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.lowentropy.toyexchange.toy.domain.model.Description;
import org.lowentropy.toyexchange.toy.domain.model.Title;
import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyId;
import org.lowentropy.toyexchange.toy.infrastructure.web.NewToyRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

import java.util.Arrays;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ToyControllerITest {

    @LocalServerPort
    private int port;

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    public void getAllToyShouldReturnAllToys() {
        // Given
        String url = "http://localhost:" + port + "/toys";
        Class<String> typeReturned = String.class;

        // When
        String response = this.restTemplate.getForObject(url, typeReturned);

        // Then
        System.out.println(response);
    }

    @Test
    public void saveShouldSave() {
        // Given
        String url = "http://localhost:" + port + "/toys";
        Class<String> typeReturned = String.class;
        NewToyRequest toy = new NewToyRequest();
        toy.setDescription("description");
        toy.setImages(Arrays.asList(""));
        toy.setNumberOfPieces(100);
        toy.setTitle("New Puzzle");

        String body = toJson(toy);

        HttpHeaders headers = new HttpHeaders();
        headers.add("content-type", "application/json");
        HttpEntity httpEntity = new HttpEntity(body, headers);

        // When
        ResponseEntity<String> response = this.restTemplate.postForEntity(url, httpEntity, typeReturned);

        // Then
        System.out.println(response.getStatusCode());
        System.out.println(response.getHeaders());
    }

    private String toJson(NewToyRequest toy) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            return mapper.writeValueAsString(toy.toMap());
        } catch (JsonProcessingException e) {
            throw new IllegalArgumentException(e);
        }
    }
}
