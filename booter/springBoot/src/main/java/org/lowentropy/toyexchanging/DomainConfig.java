package org.lowentropy.toyexchanging;

import org.lowentropy.toyexchange.toy.domain.model.application.GetToysUseCase;
import org.lowentropy.toyexchange.toy.domain.model.port.ToyReadRepository;
import org.lowentropy.toyexchange.toy.infrastructure.adapter.DumbToyReadRepository;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DomainConfig {
    @Bean
    GetToysUseCase createGetToysUseCase(ToyReadRepository toyRepository) {
        return new GetToysUseCase(toyRepository);
    }

    @Bean
    ToyReadRepository createToyReadRepository() {
        return new DumbToyReadRepository();
    }
}
