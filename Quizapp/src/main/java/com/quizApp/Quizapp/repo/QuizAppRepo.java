package com.quizApp.Quizapp.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.quizApp.Quizapp.model.Question;

public interface QuizAppRepo extends JpaRepository<Question, Long> {
	
	List<Question> findByCategory(String category); //here we create a method which can featch data from database by category

	List<Question> findByLevel(String level); // for level wise question featch
	

	@Query(value = "SELECT * FROM quize_app WHERE category = :category ORDER BY RAND() LIMIT :num", nativeQuery = true)
	List<Question> findRandomQuestionsByCategory( String category, int num);// to featch num of  question by category from quize_app table
}
