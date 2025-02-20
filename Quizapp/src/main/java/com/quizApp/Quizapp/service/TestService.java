package com.quizApp.Quizapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quizApp.Quizapp.model.Question;
import com.quizApp.Quizapp.model.QuestionWrapper;
import com.quizApp.Quizapp.model.Response;
import com.quizApp.Quizapp.model.TestQuestion;
import com.quizApp.Quizapp.repo.QuizAppRepo;
import com.quizApp.Quizapp.repo.TestRepo;

import ch.qos.logback.core.model.Model;

@Service
public class TestService {
    @Autowired
    private TestRepo testRepo;
    
    @Autowired
    private QuizAppRepo quizRepo;
	
	public TestQuestion findRandomQuestion(String testName, String category, int num) {
		
		List<Question> question= quizRepo.findRandomQuestionsByCategory(category,num);
		TestQuestion testQuestion=new TestQuestion();
		testQuestion.setTitle(testName);
		testQuestion.setQuestions(question);
		return testRepo.save(testQuestion);
				
	}
//
//	public List<QuestionWrapper> getQuizQuestions(Long id) {
//		
//		Optional<TestQuestion>  test= testRepo.findById(id);
//		List<Question> questionFromDB =test.get().getQuestions();
//	    List<QuestionWrapper> questionForUser = new ArrayList<>();
//		for(Question q: questionFromDB) {
//			QuestionWrapper qw=new QuestionWrapper(q.getId(),q.getQuestion(),q.getOption1(),q.getOption2(),q.getOption3(),q.getOption4());
//			questionForUser.add(qw);
//		}
//		
//		return questionForUser;
//		}

//	public int calculateScore(Long id, Map<String, String> responses) {
//		int score =0;
//		 TestQuestion test = testRepo.findById(id).orElse(null);
//
//		    if (test == null) {
//		        return 0; // Handle case where test is not found
//		    }
//
//		    List<Question> questions = test.getQuestion();
//		int i=0;
//		 for (Question question : questions) {
//		        String selectedOption = responses.get("question_" + question.getId());
//		        
//		        if (selectedOption != null && selectedOption.equals(question.getAnsware())) {
//		            score++;
//		        }
//	
//		 } 
//			return score;
//	}
	
	
	// this logic use when we can't skip the question 
//	public Map<String, Integer> calculateScore(Long id, Map<String, String> responses) {
//	    TestQuestion test = testRepo.findById(id)
//	            .orElseThrow(() -> new RuntimeException("Test not found with id: " + id));
//
//	    List<Question> questions = test.getQuestion();
//	    int totalQuestions = questions.size();
//	    
//	    int score = (int) questions.stream()
//	            .filter(q -> responses.containsKey("question_" + q.getId()) &&
//	                         responses.get("question_" + q.getId()).equals(q.getAnsware())) 
//	            .count();
//	    int wrongAnswers = totalQuestions - score;
//
//	    Map<String, Integer> result = new HashMap<>();
//	    result.put("score", score);
//	    result.put("totalQuestions", totalQuestions);
//	    result.put("wrongAnswers", wrongAnswers); 
//
//	    return result;
//	}
	
	//with this logic we can skip the question then also get all correct ans ,skipped question and wrong ans 
	public Map<String, Integer> calculateScore(Long id, Map<String, String> responses) {
	    TestQuestion test = testRepo.findById(id)
	            .orElseThrow(() -> new RuntimeException("Test not found with id: " + id));

	    List<Question> questions = test.getQuestions();
	    int totalQuestions = questions.size();
	    int score = 0;
	    int wrongAnswers = 0;
	    int skippedAnswers = 0;

	    for (Question question : questions) {
	        String selectedOption = responses.get("question_" + question.getId());

	        if (selectedOption == null || selectedOption.isEmpty()) {
	            skippedAnswers++; // No answer given
	        } else if (selectedOption.equals(question.getAnsware())) {
	            score++; // Correct answer
	        } else {
	            wrongAnswers++; // Wrong answer
	        }
	    }

	    // Storing all results in a Map
	    Map<String, Integer> result = new HashMap<>();
	    result.put("score", score);
	    result.put("wrongAnswers", wrongAnswers);
	    result.put("skippedAnswers", skippedAnswers);
	    result.put("totalQuestions", totalQuestions);

	    return result;
	}

	//featch all test from database 
	public List<TestQuestion> getAllTests() {
        return testRepo.findAll();
	}
	
	
	//for test featch question from database
	 public TestQuestion getTestById(Long testId) {
	        return testRepo.findById(testId).orElse(null);
	    }
	
	
}


