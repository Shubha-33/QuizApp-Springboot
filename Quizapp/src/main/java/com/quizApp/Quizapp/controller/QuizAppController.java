package com.quizApp.Quizapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quizApp.Quizapp.model.Question;
import com.quizApp.Quizapp.service.QuizAppService;

@Controller
@RequestMapping("question")
public class QuizAppController {
	
	@Autowired
	QuizAppService questionService;

	public QuizAppController(QuizAppService questionService) {
		super();
		this.questionService = questionService;
	}
	
	
	@GetMapping("/dashboard")
    public String showAdminDashboard() {
        return "AdminDashBoard"; 
    }


//	@GetMapping("allQuestion")
//	public String getAllQuestion(Model model) {
//		List<Question> questions =  questionService.getAllQuestions();
//		model.addAttribute("questions",questions);
//		return "Question";
//			
//	}
	
//	@GetMapping("category/{category}")
//	public String getQuestionByCategory(@RequestParam("category") String category , Model model) {
//		List<Question> questionByCategory = questionService.getQuestionsByCategory(category);
//		model.addAttribute("questionByCategory",questionByCategory);
//		return "Question";
//	
//	}
	
		   @GetMapping("/allquestions")
	    public String getQuestions(@RequestParam(value = "category", required = false) String category, Model model) {
	        List<Question> questions;

	        if (category == null || category.isEmpty()) {
	        	 questions = questionService.getAllQuestions();  // for all question
	        } else {
	        	 questions = questionService.getQuestionsByCategory(category);  // For category wise questions
	            model.addAttribute("selectedCategory", category); 
	        }
	        
	        if(questions.isEmpty()) {
	        	model.addAttribute("noData",true);
	        }

	        model.addAttribute("questions",  questions);
	        return "Question";  
	    }
	
//	@PostMapping("/addQuestion")
//	public String addQuestion(@RequestBody Question question) {
//	 questionService.addQuestions(question);
//	 return "QuestionForm";
//	}
		   
	@GetMapping("/addQuestion")
	public String showAddQuestionForm(Model model) {
	model.addAttribute("question", new Question()); 
		  return "QuestionForm"; 
	}   
	
	
	@PostMapping("/addQuestion")
	public String addQuestion(@ModelAttribute Question question) {  // we use modelAttribute in place of requestparam , it bind data into object
	    questionService.addQuestions(question);
	    return "redirect:/dashboard"; 
	}	   
	
	@GetMapping("/deleteQuestion/{id}")
	public String deleteQuestion(@PathVariable Long id) {
		 questionService.DeleteQuestions(id);
		
		return "redirect:/question/allquestions"; 
	}
	
	@GetMapping("/updateQuestion/{id}")
	public String updateQuestions(@PathVariable Long id, @RequestBody Question newQuestionData)
	{
		return questionService.UpdateQuestions(id,newQuestionData);
	}
}
