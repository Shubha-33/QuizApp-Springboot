<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
	<title>Add New Question</title>
</head>
<body>
    <h2>Add New Question</h2>
	
	<form action="/question/addQuestion" method="post" >
	    <input type="hidden" name="id" value="0">  
	
    
    <label for="question">Question:</label><br>
    <input type="text" id="question" name="question" required><br>

    <label for="option1">Option A:</label><br>
    <input type="text" id="option1" name="option1"  required><br>

    <label for="option2">Option B:</label><br>
    <input type="text" id="option2" name="option2" required><br>

    <label for="option3">Option C:</label><br>
    <input type="text" id="option3" name="option3" required><br>

    <label for="option4">Option D:</label><br>
    <input type="text" id="option4" name="option4" required><br>

	<label for="answer">Correct Answer:</label>
	<input type="text" id="answer" name="answer" required />

    <label for="level">Level:</label><br>
    <select id="level" name="level" required>
        <option value="easy" >Easy</option>
        <option value="medium" >Medium</option>
        <option value="hard" >Hard</option>
    </select><br>

    <label for="category">Category:</label><br>
    <select id="category" name="category" required>
        <option value="java">Java</option>
        <option value="python">Python</option>
        <option value="html">HTML</option>
    </select>
    <br>

    <button type="submit">Add Question</button>
</form>
 	
 	

 	
     
</body>
</html>
