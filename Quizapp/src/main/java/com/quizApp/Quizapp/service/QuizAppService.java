package com.quizApp.Quizapp.service;

import java.util.List;

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

	public String addQuestions(Question question) {
		quizAppRepo.save(question);
		return "save Sucessfully";
	}

	public String DeleteQuestions(Long id) {
		quizAppRepo.deleteById(id);
		return "deleted sucessfully";
	}

	public String UpdateQuestions(Long id, Question newQuestionData) {
		 return quizAppRepo.findById(id).map(question->
		{
			question.setCategory(newQuestionData.getCategory());
	        question.setLevel(newQuestionData.getLevel());
	        question.setQuestion(newQuestionData.getQuestion());
	        question.setOption1(newQuestionData.getOption1());
	        question.setOption2(newQuestionData.getOption2());
	        question.setOption3(newQuestionData.getOption3());
	        question.setOption4(newQuestionData.getOption4());
	        question.setAnswer(newQuestionData.getAnswer());
	         quizAppRepo.save(question);
	         return "Update sucessfully";
		}).orElseThrow(() -> new RuntimeException("Question not found with id: " + id));
		
		
	}

	

}