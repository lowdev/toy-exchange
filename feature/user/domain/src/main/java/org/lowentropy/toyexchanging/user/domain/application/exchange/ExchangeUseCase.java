package org.lowentropy.toyexchanging.user.domain.application.exchange;

import org.lowentropy.toyexchanging.user.domain.model.ToyId;
import org.lowentropy.toyexchanging.user.domain.model.User;
import org.lowentropy.toyexchanging.user.domain.model.UserId;
import org.lowentropy.toyexchanging.user.domain.model.UserReadRepository;

public class ExchangeUseCase {

    private UserReadRepository userRepository;

    public ExchangeUseCase(UserReadRepository userRepository) {
        this.userRepository = userRepository;
    }

    /**
     * Todo : Should do event sourcing ? this.userRepository.publish(event)
     */
    void execute(UserId userAId, ToyId toyAId, UserId userBId, ToyId toyBId) {
        User userA = getUser(userAId);
        checkIfUserHasToy(userA, toyAId);

        User userB = getUser(userBId);
        checkIfUserHasToy(userB, toyBId);

        userA.give(toyAId);
        userA.take(toyBId);

        userB.give(toyBId);
        userA.take(toyAId);

        this.userRepository.save(userA);
        this.userRepository.save(userB);
    }

    private User getUser(UserId userId) {
        return userRepository
                .findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("Cannot find user on with Id " + userId));
    }

    private void checkIfUserHasToy(User user, ToyId toyId) {
        if (user.hasToy(toyId)) {
            throw new IllegalArgumentException("Cannot find book on hold with Id");
        }
    }
}
