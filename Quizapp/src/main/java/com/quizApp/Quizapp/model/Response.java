package com.quizApp.Quizapp.model;

public class Response {
 private Long id;
 public Response(Long id, String selectedOption) {
	super();
	this.id = id;
	this.selectedOption = selectedOption;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getSelectedOption() {
	return selectedOption;
}
public void setSelectedOption(String selectedOption) {
	this.selectedOption = selectedOption;
}
private String selectedOption;
 
}
