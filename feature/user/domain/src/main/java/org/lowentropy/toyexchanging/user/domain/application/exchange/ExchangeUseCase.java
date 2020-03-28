package org.lowentropy.toyexchanging.user.domain.application.exchange;

import org.lowentropy.toyexchanging.user.domain.model.UserId;
import org.lowentropy.toyexchanging.user.domain.model.UserReadRepository;

public class ExchangeUseCase {

    private UserReadRepository userRepository;

    void execute(UserId userAId, long toyA, UserId userBId, long toyB) {
        userRepository.findById(userAId);
    }
}
