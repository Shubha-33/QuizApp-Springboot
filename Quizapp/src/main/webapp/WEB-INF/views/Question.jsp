<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<html>
<head>
    <title>Question List</title>
</head>
<body>
    <h2>List of ${selectedCategory} Questions</h2>

    <form:form method="post" action="/submitAnswers">
        <c:forEach var="question" items="${questions}">
            <div>
                <p><strong>Q: ${question.question}</strong></p>
                <form:radiobuttons path="answers[${question.id}]" items="${question.options}" />
            </div>
            <hr>
        </c:forEach>
        <input type="submit" value="Submit Answers" />
    </form:form>
</body>
</html>
