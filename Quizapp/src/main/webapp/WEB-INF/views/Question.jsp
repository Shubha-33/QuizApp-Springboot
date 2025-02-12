<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Question </title>
</head>
<body>
    <h2>List of ${selectedCategory} Question</h2>
    	<c:if test="${noData}">
   		   <h3 style="color: red; font-weight: bold;">No data present.</h3>
		</c:if>
    <c:forEach var="question" items="${questions}">
        <div>
        <p><strong>Q: ${question.question}</strong></p>
          <ol type="1">
                <li>${question.option1}</li>
                <li>${question.option2}</li>
                <li>${question.option3}</li>
                <li>${question.option4}</li>
            </ul>
            <p><strong>Answare: ${question.answare}</strong></p>
      </div>
    <a href="/question/deleteQuestion/${question.id}" 
   onclick="return confirm('Are you sure you want to delete this question?');">
    <button>Delete</button>
</a>
<a href="/question/updateQuestion/${question.id}">
    <button>Update</button>
</a>        <hr>
    </c:forEach>
    
     
</body>
</html>
