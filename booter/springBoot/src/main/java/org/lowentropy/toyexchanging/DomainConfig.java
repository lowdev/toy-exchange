package org.lowentropy.toyexchanging;

import org.lowentropy.toyexchange.toy.domain.model.application.CrudToysUseCase;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyWriteRepository;
import org.lowentropy.toyexchange.toy.infrastructure.adapter.DumbToyRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DomainConfig {
    @Bean
    CrudToysUseCase createGetToysUseCase(@Qualifier("ToyReadRepository")  ToyReadRepository toyReadRepository,
                                         @Qualifier("ToyWriteRepository") ToyWriteRepository toyWriteRepository) {
        return new CrudToysUseCase(toyReadRepository, toyWriteRepository);
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
}
