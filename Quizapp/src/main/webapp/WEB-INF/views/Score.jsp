<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quiz Result</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card p-4 shadow-sm" style="max-width: 600px; width: 100%;">
        <div class="card-body text-center">
            <h2 class="text-primary">Quiz Result</h2>
            <p class="fs-4">Your Score: <strong>${score}</strong> out of <strong>${totalQuestions}</strong></p>
            <p>Wrong Answers: <strong>${wrongAnswers}</strong></p>
            <p>Skipped Questions: <strong>${skippedAnswers}</strong></p>

            <c:choose>
                <c:when test="${score < (totalQuestions / 2)}">
                    <p class="text-danger fw-bold">Better Luck Next Time!</p>
                </c:when>
                <c:otherwise>
                    <p class="text-success fw-bold">Good Job!</p>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
