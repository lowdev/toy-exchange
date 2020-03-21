package org.lowentropy.toyexchanging.user.infrastructure.web;

import org.springframework.hateoas.RepresentationModel;

import java.util.Map;

public class UserRepresentationModel extends RepresentationModel {
    private Map<String, String> userAsMap;

    public UserRepresentationModel(Map<String, String> userAsMap) {
        this.userAsMap = userAsMap;
    }
}
