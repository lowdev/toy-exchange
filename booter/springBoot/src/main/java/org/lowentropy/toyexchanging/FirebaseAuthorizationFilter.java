package org.lowentropy.toyexchanging;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

public class FirebaseAuthorizationFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String firebaseTokenAsString = request.getHeader("Firebase-token");
        FirebaseToken firebaseToken = verifyIdTokenAsync(firebaseTokenAsString);
        setUpSpringAuthentication(firebaseToken);
        filterChain.doFilter(request, response);
    }

    private FirebaseToken verifyIdTokenAsync(String firebaseTokenAsString) {
        try {
            return FirebaseAuth.getInstance().verifyIdTokenAsync(firebaseTokenAsString).get();
        } catch (InterruptedException | ExecutionException e) {
           throw new IllegalArgumentException(e);
        }
    }

    private void setUpSpringAuthentication(FirebaseToken firebaseToken) {
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(firebaseToken, null, null);
        SecurityContextHolder.getContext().setAuthentication(auth);
    }
}
