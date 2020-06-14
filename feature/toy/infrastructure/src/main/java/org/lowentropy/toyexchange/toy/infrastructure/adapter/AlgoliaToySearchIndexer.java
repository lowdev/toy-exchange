package org.lowentropy.toyexchange.toy.infrastructure.adapter;

import com.algolia.search.SearchIndex;
import org.lowentropy.toyexchange.toy.domain.model.Toy;
import org.lowentropy.toyexchange.toy.domain.model.ToyField;
import org.lowentropy.toyexchange.toy.domain.model.port.ToySearchIndexer;

public class AlgoliaToySearchIndexer implements ToySearchIndexer {

    private SearchIndex<AlgoliaToy> index;

    public AlgoliaToySearchIndexer(SearchIndex<AlgoliaToy> index) {
        this.index = index;
    }

    @Override
    public void index(Toy toy) {
        this.index.saveObjectAsync(toAlgoliaToy(toy));
    }

    private AlgoliaToy toAlgoliaToy(Toy toy) {
        return new AlgoliaToy(
                toy.toMap().get(ToyField.ID),
                toy.toMap().get(ToyField.TITLE),
                toy.toMap().get(ToyField.DESCRIPTION));
    }
}
