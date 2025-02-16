package com.quizApp.Quizapp.service;

import java.util.ArrayList;
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
		testQuestion.setQuestion(question);
		return testRepo.save(testQuestion);
				
	}

	public List<QuestionWrapper> getQuizQuestions(Long id) {
		
		Optional<TestQuestion>  test= testRepo.findById(id);
		List<Question> questionFromDB =test.get().getQuestion();
	    List<QuestionWrapper> questionForUser = new ArrayList<>();
		for(Question q: questionFromDB) {
			QuestionWrapper qw=new QuestionWrapper(q.getId(),q.getQuestion(),q.getOption1(),q.getOption2(),q.getOption3(),q.getOption4());
			questionForUser.add(qw);
		}
		
		return questionForUser;
		}

	public int calculateScore(Long id, Map<String, String> responses) {
		int score =0;
		 TestQuestion test = testRepo.findById(id).orElse(null);

		    if (test == null) {
		        return 0; // Handle case where test is not found
		    }

		    List<Question> questions = test.getQuestion();
		int i=0;
		 for (Question question : questions) {
		        String selectedOption = responses.get("question_" + question.getId());
		        
		        if (selectedOption != null && selectedOption.equals(question.getAnsware())) {
		            score++;
		        }
	
		 } 
			return score;
	}	
	
	
}


