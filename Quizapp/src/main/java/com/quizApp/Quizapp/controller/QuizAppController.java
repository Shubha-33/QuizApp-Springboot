package com.quizApp.Quizapp.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.ResponseBody;
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
	    public String getQuestions(@RequestParam(value = "category", required = false) String category,
	            @RequestParam(value = "level", required = false) String level,
	    		Model model) {
	        List<Question> questions;

	        if ((category == null || category.isEmpty()) && (level == null || level.isEmpty())) {
	            questions = questionService.getAllQuestions();
	            // Get all questions
	        } else if (category != null && !category.isEmpty()) {
	        	questions = questionService.getQuestionsByCategory(category);
	            model.addAttribute("selectedCategory", category); // For category wise questions
	        }
	        else{
	            questions = questionService.getQuestionsByLevel(level);
	            model.addAttribute("selectedLevel", level); // Filter by level
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
		   
//	@GetMapping("/addQuestion")
//	public String showAddQuestionForm(Model model) {
//	model.addAttribute("question", new Question()); 
//		  return "QuestionForm"; 
//	}   
//	
	
//	@PostMapping("/addQuestion")
//	public String addQuestion(@RequestBody Question question) {  // we use modelAttribute in place of requestparam , it bind data into object
//	    questionService.addQuestions(question);
//	    System.out.print(question);
//	    return "redirect:/dashboard"; 
//	}	   
	
	

    @GetMapping("/addQuestion")
    public String showAddQuestionForm(Model model) {
        model.addAttribute("question", new Question());
        return "QuestionForm";  // This should match the JSP file name
    }

    @PostMapping("/addQuestion")
    @ResponseBody
    public ResponseEntity<String> addQuestion(@RequestBody Question question) {
        questionService.addQuestions(question);
        return ResponseEntity.ok("Question added successfully!");
    }

	
	
//	@PutMapping("/updateQuestion/{id}")
//	public String updateQuestions(@PathVariable Long id, @RequestBody Question newQuestionData)
//	{
//		return questionService.UpdateQuestions(id,newQuestionData);
//	}
	
    
    @GetMapping("/updateQuestion/{id}")
    public String showUpdateForm(@PathVariable Long id, Model model) {
    	 Question question = questionService.getQuestionById(id)
    	            .orElseThrow(() -> new RuntimeException("Question not found with id: " + id));
    	model.addAttribute("question", question);
        return "UpdateQuestion"; // This should be the JSP file where the update form is
    }
	
	 @PutMapping("/updateQuestion/{id}")
	    public ResponseEntity<String> updateQuestion(@PathVariable Long id, @RequestBody Question updatedQuestion) {
		 String response = questionService.UpdateQuestions(id, updatedQuestion);
		 return ResponseEntity.ok(response);
	    }
	
    @GetMapping("/deleteQuestion/{id}")
	public String deleteQuestion(@PathVariable Long id) {
		 questionService.DeleteQuestions(id);
		
		return "redirect:/question/allquestions"; 
	}
	
	

}
