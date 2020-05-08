package org.lowentropy.toyexchange.toy.infrastructure.web;

import org.lowentropy.toyexchange.toy.domain.model.ToyField;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import java.util.Map;

@Relation(collectionRelation = "toys")
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

    public String getNumberOfPieces() {
        return this.toyAsMap.get(ToyField.NUMBER_OF_PIECES);
    }
}
