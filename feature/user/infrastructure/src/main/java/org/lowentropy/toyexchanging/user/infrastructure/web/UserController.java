package org.lowentropy.toyexchanging.user.infrastructure.web;

import org.lowentropy.toyexchanging.user.domain.application.GetUserUseCase;
import org.lowentropy.toyexchanging.user.domain.model.UserId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

import static org.springframework.http.ResponseEntity.notFound;
import static org.springframework.http.ResponseEntity.ok;

@RestController("user")
public class UserController {

    /**
     * Todo - Should do i pass by domain to getUser
     * or use directly repository here.
     */
    private GetUserUseCase getUserUseCase;

    public UserController(GetUserUseCase getUserUseCase) {
        this.getUserUseCase = getUserUseCase;
    }

    @GetMapping("/{userId}")
    public ResponseEntity<UserRepresentationModel> getUser(@PathVariable UUID userId) {
        return getUserUseCase.getUser(new UserId(userId))
                .map(user -> ok(new UserRepresentationModel(user.toMap())))
                .orElse(notFound().build());
    }
}
