<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quiz Result</title>
</head>
<body>
    <h2>Quiz Result</h2>
    <p>Your Score: ${score} out of ${totalQuestions}</p>

    <c:choose>
        <c:when test="${score < (totalQuestions / 2)}">
            <strong>Better Luck Next Time</strong>
        </c:when>
        <c:otherwise>
            <strong>Good Job!</strong>
        </c:otherwise>
    </c:choose>
</body>
</html>
