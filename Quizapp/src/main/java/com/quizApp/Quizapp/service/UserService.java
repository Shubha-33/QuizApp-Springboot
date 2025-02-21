package com.quizApp.Quizapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quizApp.Quizapp.model.User;
import com.quizApp.Quizapp.repo.UserRepo;

@Service
public class UserService {

	@Autowired 
	private UserRepo userRepo;
	
   

    public String saveUserDetails(String username, String email, String password, String role) {
        if (userRepo.findByEmail(email) != null) {
            return "Email id already taken!";
        }

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role); 

        userRepo.save(user);

        return "Registration successful!";
    }

    public User userLogin(String email, String password) {
        User user = userRepo.findByEmail(email);
        
        if (user != null && user.getPassword().equals(password)) { 
            return user;
        }
        
        return null; // return nothing if pass not match with corresponding email
    }



	
	
}
