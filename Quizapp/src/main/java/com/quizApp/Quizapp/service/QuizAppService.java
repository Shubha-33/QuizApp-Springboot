package com.quizApp.Quizapp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quizApp.Quizapp.model.Question;
import com.quizApp.Quizapp.repo.QuizAppRepo;

@Service
public class QuizAppService {
@Autowired
	QuizAppRepo quizAppRepo;
	public List<Question> getAllQuestions(){
		return quizAppRepo.findAll();	
	}
	
	public List<Question> getQuestionsByCategory(String category){
		return quizAppRepo.findByCategory(category);
		
	}
	
	
	public List<Question> getQuestionsByLevel(String level) {
		
		return quizAppRepo.findByLevel(level);
	}
	
	public String addQuestions(Question question) {
		quizAppRepo.save(question);
		return "save Sucessfully";
	}



	  public Optional<Question> getQuestionById(Long id) {
	        return quizAppRepo.findById(id);
	    }

	public String UpdateQuestions(Long id, Question updatedQuestion) {
		 return quizAppRepo.findById(id).map(question->
		{
			question.setCategory(updatedQuestion.getCategory());
	        question.setLevel(updatedQuestion.getLevel());
	        question.setQuestion(updatedQuestion.getQuestion());
	        question.setOption1(updatedQuestion.getOption1());
	        question.setOption2(updatedQuestion.getOption2());
	        question.setOption3(updatedQuestion.getOption3());
	        question.setOption4(updatedQuestion.getOption4());
	        question.setAnsware(updatedQuestion.getAnsware());
	         quizAppRepo.save(question);
	         return "Update sucessfully";
		}).orElseThrow(() -> new RuntimeException("Question not found with id: " + id));
		
		
	}
	public String DeleteQuestions(Long id) {
	    try {
	        quizAppRepo.deleteById(id);
	        
	        return "Question deleted successfully";
	    } catch (Exception e) {
	        return "Error deleting question: " + e.getMessage();
	    }
	}


	

}