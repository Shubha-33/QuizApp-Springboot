<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Dashboard</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="card shadow-lg p-4 text-center">
            <h2 class="mb-4 text-primary">Welcome to User Dashboard</h2>
            
            <!-- Dropdown for selecting test -->
            <form id="testForm" action="/test/testStart" method="get">
                <label for="testSelect" class="form-label">Select a Test:</label>
                <select id="testSelect" name="testId" class="form-select" required>
                    <option value="" disabled selected>Choose a test</option>
                    <c:forEach var="test" items="${tests}">
                        <option value="${test.id}">${test.title} - (${test.questions[0].category})</option>
                    </c:forEach>
                </select>
                
                <button type="submit" class="btn btn-primary btn-lg mt-3">Start Test</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
