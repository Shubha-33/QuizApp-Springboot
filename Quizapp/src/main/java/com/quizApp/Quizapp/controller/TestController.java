package com.quizApp.Quizapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quizApp.Quizapp.model.QuestionWrapper;
import com.quizApp.Quizapp.model.Response;
import com.quizApp.Quizapp.model.TestQuestion;
import com.quizApp.Quizapp.service.TestService;

@Controller
//@RestController
@RequestMapping("test")
public class TestController {
	
	@Autowired
	private TestService testService;

//	 @PostMapping("create")
//	    public TestQuestion createQuestionForTest(@RequestParam String testName,@RequestParam String category, @RequestParam int num) {
//	            
//	            return testService.findRandomQuestion(testName, category, num);
//	 }
	
	 @PostMapping("create")
	 public String createQuestionForTest(Model model,
             @RequestParam String testName,
             @RequestParam String category,
             @RequestParam int num) {
            
		 TestQuestion questions = testService.findRandomQuestion(testName, category, num);
             model.addAttribute("testName",testName);
             model.addAttribute("testQuestion",questions.getQuestion());
             return "CreateTest";
	 	}
	 
	 @GetMapping("GetQuiz/{id}")
	 public String getTheQuizQuestion(@PathVariable Long id,Model model){
		 List<QuestionWrapper> question = testService.getQuizQuestions(id);
		 model.addAttribute("questions", question);
		 return "Test";
		 
	 }
	
	 @PostMapping("score/{id}")
	 public String displayScore(Model model, @PathVariable Long id, List<Response> response ) {
		int score= testService.calculateScore(id,response);
		model.addAttribute("score",score);
		 return "Score";
	 }
	        
}
