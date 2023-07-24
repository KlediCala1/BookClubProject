package com.dojo.bookclubproject.services;


import com.dojo.bookclubproject.models.Login;
import com.dojo.bookclubproject.models.User;
import com.dojo.bookclubproject.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public User register(User newUser, BindingResult result){

        Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());

        if(potentialUser.isPresent()){
            result.rejectValue("email","EmailTaken",
                    "the email has already been taken");
        }
        if(!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches",
                    "The Confirm Password must match Password!");
        }
        if(result.hasErrors()){
            return null;
        }
        else{
            String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashed);
            return userRepository.save(newUser);
        }
    }

    public User login(Login newLoginObject, BindingResult result){

        Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());

        if(!potentialUser.isPresent()){
            result.rejectValue("email","EmailNotFound","the email does not exist");
        }else{
            if(!BCrypt.checkpw(newLoginObject.getPassword(), potentialUser.get().getPassword())) {
                result.rejectValue("password", "Matches", "Invalid Password!");
            }
        }
        if(result.hasErrors()){
            return null;
        }else{
            return potentialUser.get();
        }
    }

    public User findUser(Long id){
        Optional<User> optionalUser = userRepository.findById(id);

        if(!optionalUser.isPresent()){
            return null;
        }
        else{
            return optionalUser.get();
        }
    }

}
