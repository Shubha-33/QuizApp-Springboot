package com.quizApp.Quizapp.controller;

import java.util.List;
import java.util.Map;

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
             model.addAttribute("testQuestion",questions.getQuestions());
             return "CreateTest";
	 	}
	 
//	 @GetMapping("GetQuiz/{id}")
//	 public String getTheQuizQuestion(@PathVariable Long id, Model model) {
//	     List<QuestionWrapper> question = testService.getQuizQuestions(id);
//	     model.addAttribute("questions", question);
//	     model.addAttribute("id", id);  
//	     return "Test";
//	 }

	
//	 @PostMapping("score/{id}")
//	 public String displayScore(Model model, 
//	                            @PathVariable Long id, 
//	                            @RequestParam Map<String, String> responses) {
//	     int score = testService.calculateScore(id, responses);
////       int totalQuestions = responses.size();//for calculate the no of response where i put cumulsore ans to all question so it also return the total  no of question
//	     int totalQuestions =testService.getTotalQuestion(id);
//	     model.addAttribute("score", score);
//	     model.addAttribute("totalQuestions", totalQuestions);
//	     model.addAttribute("id", id); 
//
//	     return "Score";
//	 }
	 
	 // with this ce can't skip question 
//	 @PostMapping("score/{id}")
//	 public String displayScore(Model model, 
//	                            @PathVariable Long id, 
//	                            @RequestParam Map<String, String> responses) {
//	     Map<String, Integer> result = testService.calculateScore(id, responses);
//			
	 
//	     model.addAttribute("score", result.get("score"));
//	     model.addAttribute("totalQuestions", result.get("totalQuestions"));
// 	model.addAttribute("wrongAnswers", result.get("wrongAnswers"));
//	     model.addAttribute("id", id); 
//
//	     return "Score"; 
//	 }


	 //we can skip question       
	 @PostMapping("score/{id}")
	 public String displayScore(Model model, 
	                            @PathVariable Long id, 
	                            @RequestParam Map<String, String> responses) {
	     Map<String, Integer> result = testService.calculateScore(id, responses);

	     model.addAttribute("score", result.get("score"));
	     model.addAttribute("wrongAnswers", result.get("wrongAnswers"));
	     model.addAttribute("skippedAnswers", result.get("skippedAnswers"));
	     model.addAttribute("totalQuestions", result.get("totalQuestions"));
	     model.addAttribute("id", id);

	     return "Score"; 
	 }
	 
	 //for Show all test
	    @GetMapping("/userDashboard")
	    public String getAllTests(Model model) {
	        List<TestQuestion> tests = testService.getAllTests();
	        model.addAttribute("tests", tests);
	        return "UserDashBoard";  // Redirects to userDashboard.jsp
	    }
	    
	    
	    //start test 
	    
	    @GetMapping("/testStart")
	    public String startTest(@RequestParam Long testId, Model model) {
	        TestQuestion test = testService.getTestById(testId);
	        if (test == null) {
	            model.addAttribute("errorMessage", "Test not found.");
	            return "errorPage"; 
	        }
	        model.addAttribute("id", test.getId());
	        model.addAttribute("testName", test.getTitle());
	        model.addAttribute("questions", test.getQuestions());
	        return "Test";
	    }



}
