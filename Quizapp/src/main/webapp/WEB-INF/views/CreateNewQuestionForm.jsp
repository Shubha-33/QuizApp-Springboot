<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Question</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<div class="container my-5">
    <div class="bg-white p-4 shadow-sm rounded">
        <h2 class="text-center text-primary mb-4">Add New Question</h2>

        <form id="questionForm" class="row g-3">
            <div class="col-12">
                <label for="question" class="form-label">Question:</label>
                <input type="text" id="question" name="question" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="option1" class="form-label">Option A:</label>
                <input type="text" id="option1" name="option1" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="option2" class="form-label">Option B:</label>
                <input type="text" id="option2" name="option2" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="option3" class="form-label">Option C:</label>
                <input type="text" id="option3" name="option3" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="option4" class="form-label">Option D:</label>
                <input type="text" id="option4" name="option4" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="answare" class="form-label">Correct Answer:</label>
                <input type="text" id="answare" name="answare" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label for="level" class="form-label">Level:</label>
                <select id="level" name="level" class="form-select" required>
                    <option value="easy">Easy</option>
                    <option value="medium">Medium</option>
                    <option value="hard">Hard</option>
                </select>
            </div>

            <div class="col-md-6">
                <label for="category" class="form-label">Category:</label>
                <select id="category" name="category" class="form-select" required>
                    <option value="java">Java</option>
                    <option value="python">Python</option>
                    <option value="html">HTML</option>
                </select>
            </div>

            <div class="col-12 text-center">
                <button type="submit" class="btn btn-primary">Add Question</button>
            </div>
        </form>
    </div>
</div>

<!-- Success Alert (Hidden by Default) -->
<div id="successAlert" class="alert alert-success position-fixed top-0 start-50 translate-middle-x mt-3" 
     style="display: none; width: 300px;">
    Question added successfully!
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
document.querySelector("#questionForm").addEventListener("submit", function(event) {
    event.preventDefault();
    
    let formData = {
        question: document.getElementById("question").value,
        option1: document.getElementById("option1").value,
        option2: document.getElementById("option2").value,
        option3: document.getElementById("option3").value,
        option4: document.getElementById("option4").value,
        answare: document.getElementById("answare").value,
        level: document.getElementById("level").value,
        category: document.getElementById("category").value
    };

    fetch("/question/addQuestion", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData)
    })
    .then(response => response.text())
    .then(message => {
        let alertBox = document.getElementById("successAlert");
        alertBox.style.display = "block";
        setTimeout(() => {
            alertBox.style.display = "none";
            window.location.href = "/question/allquestions";
        }, 1500);
    })
    .catch(error => console.error("Error:", error));
});
</script>

</body>
</html>
