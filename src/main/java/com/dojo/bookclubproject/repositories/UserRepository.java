package com.dojo.bookclubproject.repositories;

import com.dojo.bookclubproject.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByEmail(String email);

    User save(User newUser);

    Optional<User> findById(Long id);
}