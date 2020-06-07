package org.lowentropy.toyexchange.toy.infrastructure.web;

public class SearchRequest {
    private Boolean excludeMyToys;

    public Boolean getExcludeMyToys() {
        return excludeMyToys;
    }

    public void setExcludeMyToys(Boolean excludeMyToys) {
        this.excludeMyToys = excludeMyToys;
    }
}
