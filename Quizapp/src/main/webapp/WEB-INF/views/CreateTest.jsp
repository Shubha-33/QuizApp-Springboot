<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Test</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container my-5">
    <div class="bg-white p-4 shadow rounded">
        <h2 class="text-center text-primary mb-4">${testName}</h2>

        <c:forEach var="question" items="${testQuestion}" varStatus="status">
            <div class="mb-4 p-3 border rounded bg-light">
                <p class="fw-bold">Q${status.index + 1}: ${question.question}</p>
                <ol class="list-group">
                    <li class="list-group-item">${question.option1}</li>
                    <li class="list-group-item">${question.option2}</li>
                    <li class="list-group-item">${question.option3}</li>
                    <li class="list-group-item">${question.option4}</li>
                </ol>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
