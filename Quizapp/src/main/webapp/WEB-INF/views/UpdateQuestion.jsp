<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Question</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

        <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#"> Update Question </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link text-white" href="/question/dashboard">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/question/allquestions">All Questions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/question/addQuestion">Add New Question</a>
                </li>
                <li class="nav-item">
<a class="nav-link btn  btn-light btn-sm text-dark " style="background-color: white; border-color: gray;" href="/user/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card p-4 shadow-lg">
               
                
                <form id="updateQuestionForm">
                    <input type="hidden" id="questionId" name="questionId" value="${question.id}">

                    <div class="mb-3">
                        <label for="question" class="form-label">Question:</label>
                        <input type="text" class="form-control" id="question" name="question" value="${question.question}" required>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="option1" class="form-label">Option A:</label>
                            <input type="text" class="form-control" id="option1" name="option1" value="${question.option1}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="option2" class="form-label">Option B:</label>
                            <input type="text" class="form-control" id="option2" name="option2" value="${question.option2}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="option3" class="form-label">Option C:</label>
                            <input type="text" class="form-control" id="option3" name="option3" value="${question.option3}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="option4" class="form-label">Option D:</label>
                            <input type="text" class="form-control" id="option4" name="option4" value="${question.option4}" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="answare" class="form-label">Correct Answer:</label>
                        <input type="text" class="form-control" id="answare" name="answare" value="${question.answare}" required>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="level" class="form-label">Level:</label>
                            <select id="level" name="level" class="form-select" required>
                                <option value="easy" ${question.level == 'easy' ? 'selected' : ''}>Easy</option>
                                <option value="medium" ${question.level == 'medium' ? 'selected' : ''}>Medium</option>
                                <option value="hard" ${question.level == 'hard' ? 'selected' : ''}>Hard</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="category" class="form-label">Category:</label>
                            <select id="category" name="category" class="form-select" required>
                                <option value="java" ${question.category == 'java' ? 'selected' : ''}>Java</option>
                                <option value="python" ${question.category == 'python' ? 'selected' : ''}>Python</option>
                                <option value="html" ${question.category == 'html' ? 'selected' : ''}>HTML</option>
                            </select>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg w-100">Update Question</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
document.getElementById("updateQuestionForm").addEventListener("submit", function(event) {
    event.preventDefault();

    let formData = {
        questionId: document.getElementById("questionId").value,
        question: document.getElementById("question").value,
        option1: document.getElementById("option1").value,
        option2: document.getElementById("option2").value,
        option3: document.getElementById("option3").value,
        option4: document.getElementById("option4").value,
        answare: document.getElementById("answare").value,
        level: document.getElementById("level").value,
        category: document.getElementById("category").value
    };

    fetch("/question/updateQuestion/" + formData.questionId, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData)
    })
    .then(response => response.text())
    .then(message => {
        alert(message); // Show success message
        window.location.href = "/question/allquestions"; // Redirect to all questions page
    })
    .catch(error => console.error("Error:", error));
});
</script>

</body>
</html>
