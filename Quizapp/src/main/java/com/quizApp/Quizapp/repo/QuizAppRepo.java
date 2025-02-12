package com.quizApp.Quizapp.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.quizApp.Quizapp.model.Question;

public interface QuizAppRepo extends JpaRepository<Question, Long> {
	
	List<Question> findByCategory(String category); //here we create a method which can featch data from database by category
}
