<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Update Question</title>
</head>
<body>
    <h2>Update Question</h2>

    <form action="/question/updateQuestion/${id}">

 		<input type="hidden" id="questionId" name="questionId" value="${question.id}">


        <label for="question">Question:</label><br>
        <input type="text" id="question" name="question" value="${question.question}" required><br>

        <label for="option1">Option A:</label><br>
        <input type="text" id="option1" name="option1" value="${question.option1}" required><br>

        <label for="option2">Option B:</label><br>
        <input type="text" id="option2" name="option2" value="${question.option2}" required><br>

        <label for="option3">Option C:</label><br>
        <input type="text" id="option3" name="option3" value="${question.option3}" required><br>

        <label for="option4">Option D:</label><br>
        <input type="text" id="option4" name="option4" value="${question.option4}" required><br>

        <label for="answare">Correct Answer:</label>
        <input type="text" id="answare" name="answare" value="${question.answare}" required><br>

        <label for="level">Level:</label><br>
        <select id="level" name="level" required>
            <option value="easy" ${question.level == 'easy' ? 'selected' : ''}>Easy</option>
            <option value="medium" ${question.level == 'medium' ? 'selected' : ''}>Medium</option>
            <option value="hard" ${question.level == 'hard' ? 'selected' : ''}>Hard</option>
        </select><br>

        <label for="category">Category:</label><br>
        <select id="category" name="category" required>
            <option value="java" ${question.category == 'java' ? 'selected' : ''}>Java</option>
            <option value="python" ${question.category == 'python' ? 'selected' : ''}>Python</option>
            <option value="html" ${question.category == 'html' ? 'selected' : ''}>HTML</option>
        </select><br>

        <button type="submit">Update Question</button>
    </form>

    <script>
    document.querySelector("form").addEventListener("submit", function(event) {
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
