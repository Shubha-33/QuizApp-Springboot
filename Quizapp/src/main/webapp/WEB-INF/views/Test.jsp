<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Quiz Questions</title>
</head>
<body>
    <h2>Quiz Questions</h2>
      <form action="/test/score" method="post">
        <c:forEach var="question" items="${questions}">
            <div>
                <p><strong>Q: ${question.question}</strong></p>
                <input type="radio" name="question_${question.id}" value="${question.option1}" required> ${question.option1}<br>
                <input type="radio" name="question_${question.id}" value="${question.option2}"> ${question.option2}<br>
                <input type="radio" name="question_${question.id}" value="${question.option3}"> ${question.option3}<br>
                <input type="radio" name="question_${question.id}" value="${question.option4}"> ${question.option4}<br>
            </div>
            <hr>
        </c:forEach>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
