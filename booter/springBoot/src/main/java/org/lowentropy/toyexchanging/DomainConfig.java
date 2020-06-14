package org.lowentropy.toyexchanging;

import com.algolia.search.DefaultSearchClient;
import com.algolia.search.SearchClient;
import com.algolia.search.SearchIndex;
import org.lowentropy.toyexchange.toy.domain.model.application.CrudToysUseCase;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.domain.model.port.ToySearchIndexer;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyWriteRepository;
import org.lowentropy.toyexchange.toy.infrastructure.adapter.AlgoliaToy;
import org.lowentropy.toyexchange.toy.infrastructure.adapter.AlgoliaToySearchIndexer;
import org.lowentropy.toyexchange.toy.infrastructure.adapter.DumbToyRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DomainConfig {
    @Bean
    CrudToysUseCase createGetToysUseCase(@Qualifier("ToyReadRepository")  ToyReadRepository toyReadRepository,
                                         @Qualifier("ToyWriteRepository") ToyWriteRepository toyWriteRepository,
                                         ToySearchIndexer toySearchIndexer) {
        return new CrudToysUseCase(toyReadRepository, toyWriteRepository, toySearchIndexer);
    }

    @Bean(name = "ToyReadRepository")
    ToyReadRepository createToyReadRepository(DumbToyRepository dumbToyRepository) {
        return dumbToyRepository;
    }

    @Bean(name = "ToyWriteRepository")
    ToyWriteRepository createToyWriteRepository(DumbToyRepository dumbToyRepository) {
        return dumbToyRepository;
    }

    @Bean
    DumbToyRepository createDumbToyRepository() {
        return new DumbToyRepository();
    }

    @Bean
    ToySearchIndexer createToySearchIndexer() {
        String algoliaAdminKey = System.getenv("ALGOLIA_ADMIN_KEY");
        SearchClient client = DefaultSearchClient.create("AY5KHPHF89", algoliaAdminKey);
        SearchIndex<AlgoliaToy> index = client.initIndex("dev_toy", AlgoliaToy.class);
        return new AlgoliaToySearchIndexer(index);
    }
}
