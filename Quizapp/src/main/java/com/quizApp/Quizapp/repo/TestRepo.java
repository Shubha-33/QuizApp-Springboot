package com.quizApp.Quizapp.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.quizApp.Quizapp.model.TestQuestion;

@Repository
public interface TestRepo extends JpaRepository<TestQuestion, Long> {
    
    
    
}
