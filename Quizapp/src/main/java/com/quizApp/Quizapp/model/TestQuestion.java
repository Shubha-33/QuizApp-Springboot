package com.quizApp.Quizapp.model;

import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "test_question")
public class TestQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String title;

    @ManyToMany
    @JoinTable(
        name = "test_question_question", // Join table name
        joinColumns = @JoinColumn(name = "test_id", referencedColumnName = "id"), // FK to test_question
        inverseJoinColumns = @JoinColumn(name = "question_id", referencedColumnName = "id") // FK to quize_app (Question)
    )
    private List<Question> questions;

 
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }
}
