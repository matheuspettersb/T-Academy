package br.com.springsecurity.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import br.com.springsecurity.models.UserModel;

public interface UserRepository extends CrudRepository<UserModel, Long>{
    
    Optional<UserModel> findByUser(String username);
}
