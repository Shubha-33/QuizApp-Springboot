package com.quizApp.Quizapp.repo;
import org.springframework.data.jpa.repository.JpaRepository;


import com.quizApp.Quizapp.model.User;


	public interface UserRepo extends JpaRepository<User, Long> {

		

		User findByEmail(String email);
	    
	}
