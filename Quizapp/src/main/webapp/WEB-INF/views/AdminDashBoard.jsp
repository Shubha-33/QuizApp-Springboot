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
    
     <a href="/question/addQuestion"><button>Add New Question :</button></a>
    
    
    
</body>
</html>
