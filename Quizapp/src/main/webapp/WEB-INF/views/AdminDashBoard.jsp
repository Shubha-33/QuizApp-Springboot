<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Welcome to Admin page</h2>
    
   	 <a href="/question/allquestions"><button>View All Question :</button></a>
   	 
   	 <form action="/question/allquestions" method="get">
   	 <label for="category">Choose a category</label>
     <select id="category" name="category">
     <option value="java">Java</option>
     <option value="python">Python</option>
     <option value="html">HTML</option>
     </select>
      <button type="submit">View Questions</button>
    </form>
    
    <br>
     <form action="/question/allquestions" method="get">
   	  <label for="level">Choose a Level</label>
        <select id="level" name="level" >
            <option value="easy" >Easy</option>
            <option value="medium" >Medium</option>
            <option value="hard">Hard</option>
        </select>  
      <button type="submit">View Questions</button>
    </form>
    
    
     <a href="/question/addQuestion"><button>Add New Question :</button></a>
     
    <p>Create Quiz For Test</p>
   <form action="/test/create" method="post">
    <label for="testName">Test Name</label><br>
    <input type="text" id="testName" name="testName" required><br>
    <label for="number">Number Of Questions:</label><br>
    <input type="number" id="number" name="num" required><br>
    <label for="testCategory">Choose a category</label>
    <select id="testCategory" name="category">
        <option value="java">Java</option>
        <option value="python">Python</option>
        <option value="html">HTML</option>
    </select>
    <button type="submit">Create Questions</button>
</form>

    
    
</body>
</html>
