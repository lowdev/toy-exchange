package org.lowentropy.toyexchange.toy.infrastructure.web;

import org.lowentropy.toyexchange.toy.domain.model.ToyField;
import org.springframework.hateoas.RepresentationModel;

import java.util.Map;

public class ToyRepresentationModel extends RepresentationModel {
    private Map<ToyField, String> toyAsMap;

    public ToyRepresentationModel(Map<ToyField, String> toyAsMap) {
        this.toyAsMap = toyAsMap;
    }

    public String getId() {
        return this.toyAsMap.get(ToyField.ID);
    }

    public String getTitle() {
        return this.toyAsMap.get(ToyField.TITLE);
    }

    public String getDescription() {
        return this.toyAsMap.get(ToyField.DESCRIPTION);
    }

    public String getThumbnail() {
        return this.toyAsMap.get(ToyField.THUMBNAIL);
    }
}
