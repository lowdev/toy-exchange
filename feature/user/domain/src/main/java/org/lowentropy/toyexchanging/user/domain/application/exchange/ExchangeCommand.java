package org.lowentropy.toyexchanging.user.domain.application.exchange;

import org.lowentropy.toyexchanging.user.domain.model.UserId;

public class ExchangeCommand {
    private ExchangeUseCase exchangeUseCase;

    private UserId userAId;
    private long toyA;

    private UserId userBId;
    private long toyB;

    public ExchangeCommand(ExchangeUseCase exchangeUseCase, UserId userAId, long toyA, UserId userBId, long toyB) {
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
