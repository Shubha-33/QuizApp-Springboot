<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quiz Questions</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4 shadow-sm">
        <h2 class="text-center text-primary mb-4">Quiz Questions</h2>
        <form action="/test/score/${id}" method="post">
        
      <!--  varStatus="status" attribute allows you to access the index of each question.-->
            <c:forEach var="question" items="${questions}" varStatus="status">
                <div class="mb-3">
                    <!-- Display the question number , index start from 0-->
                    <p><strong>Q${status.index + 1}: ${question.question}</strong></p>

                    <div class="form-check">
                        <input type="radio" name="question_${question.id}" value="${question.option1}" class="form-check-input" id="option1_${question.id}">
                        <label class="form-check-label" for="option1_${question.id}">${question.option1}</label>
                    </div>

                    <div class="form-check">
                        <input type="radio" name="question_${question.id}" value="${question.option2}" class="form-check-input" id="option2_${question.id}">
                        <label class="form-check-label" for="option2_${question.id}">${question.option2}</label>
                    </div>

                    <div class="form-check">
                        <input type="radio" name="question_${question.id}" value="${question.option3}" class="form-check-input" id="option3_${question.id}">
                        <label class="form-check-label" for="option3_${question.id}">${question.option3}</label>
                    </div>

                    <div class="form-check">
                        <input type="radio" name="question_${question.id}" value="${question.option4}" class="form-check-input" id="option4_${question.id}">
                        <label class="form-check-label" for="option4_${question.id}">${question.option4}</label>
                    </div>
                </div>
                <hr>
            </c:forEach>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary btn-lg" onclick="return confirm('Are you sure you want to submit the test?')">
                    Submit
                </button>
             </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS (optional if you need interactive components) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
