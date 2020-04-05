package org.lowentropy.toyexchanging.user.domain.application.exchange;

import org.lowentropy.toyexchanging.user.domain.model.ToyId;
import org.lowentropy.toyexchanging.user.domain.model.UserId;

public class ExchangeCommand {
    private ExchangeUseCase exchangeUseCase;

    private UserId userAId;
    private ToyId toyA;

    private UserId userBId;
    private ToyId toyB;

    public ExchangeCommand(ExchangeUseCase exchangeUseCase, UserId userAId, ToyId toyA, UserId userBId, ToyId toyB) {
        this.exchangeUseCase = exchangeUseCase;
        this.userAId = userAId;
        this.toyA = toyA;
        this.userBId = userBId;
        this.toyB = toyB;
    }

    /**
     * TODO: Return list of event
     */
    public void execute() {
        this.exchangeUseCase.execute(this.userAId, this.toyA, this.userBId, this.toyB);
    }
}
