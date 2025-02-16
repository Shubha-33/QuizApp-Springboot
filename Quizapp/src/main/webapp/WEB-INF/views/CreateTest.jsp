<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Test</title>
</head>
<body>
    <h2>${testName}</h2>  
 <c:forEach var="question" items="${testQuestion}">
        <div>
            <p><strong>Q: ${question.question}</strong></p>
            <ol type="1">
                <li>${question.option1}</li>
                <li>${question.option2}</li>
                <li>${question.option3}</li>
                <li>${question.option4}</li>
            </ol>
        </div>
        <hr>
    </c:forEach>
</body>
</html>
