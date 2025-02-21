<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Question List</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

       
        <!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#"> Questions</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link text-white" href="/question/dashboard">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/question/allquestions">All Questions</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/question/addQuestion">Add New Question</a>
                </li>
                <li class="nav-item">
<a class="nav-link btn  btn-light btn-sm text-dark " style="background-color: white; border-color: gray;" href="/user/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5">
    <div class="bg-white p-4 shadow-sm rounded">
       
      
        
     <!-- Display flash message -->     
<c:if test="${not empty message}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>



        <!-- No Data Message -->
        <c:if test="${noData}">
          <div class="alert alert-success alert-dismissible fade show" role="alert">
       		<p class="text-danger text-center">No questions available for the selected category or level.</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
   			 </div>
            
        </c:if>

        <c:forEach var="question" items="${questions}" varStatus="status">
             <div class="mb-3 p-3 bg-light border rounded position-relative">
        <!-- Question text -->
        <p class="fw-bold">Q${status.index + 1}: ${question.question}</p>

        <!-- Level & Category  -->
		<div class="position-absolute top-0 end-0 px-1 py-1 mt-1 text-secondary  ">
    		<span class="me-2 btn btn-secondary" > ${question.level}</span> 
   				 <span class ="btn btn btn-info">${question.category}</span>
		</div>

        
      <!-- Options -->
        <ul class="list-unstyled">
            <li class="p-2 border mb-2 rounded">${question.option1}</li>
            <li class="p-2 border mb-2 rounded">${question.option2}</li>
            <li class="p-2 border mb-2 rounded">${question.option3}</li>
            <li class="p-2 border mb-2 rounded">${question.option4}</li>
        </ul>
           
            <p class="text-success fw-bold">Answer: ${question.answare}</p>
                		
                		

                <!-- Update and Delete Buttons -->
                <div class="d-flex justify-content-center gap-2">
                    <a href="updateQuestion/${question.id}" class="btn btn-warning btn-sm">Update</a>
                    <a href="deleteQuestion/${question.id}" class="btn btn-danger btn-sm" 
                       onclick="return confirm('Are you sure you want to delete this question?');">Delete</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
