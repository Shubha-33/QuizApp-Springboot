<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

    <!-- Navbar with Logout Button -->
    <nav class="navbar navbar-light bg-primary p-3">
        <div class="container">
            <span class="navbar-brand text-white fw-bold">Quiz App</span>
            <a href="/user/logout" class="btn btn-light btn-sm">Logout</a>
        </div>
    </nav>

    <!-- Welcome Message -->
    <div class="container text-center mt-5">
        <h2 class="text-primary">Welcome, <c:out value="${sessionScope.User}" /></h2>
        <p class="text-muted">Get ready for test your skill  ! </p>
    </div>

    <!-- Test Selection Section -->
    <div class="container d-flex justify-content-center mt-4">
        <form id="testForm" action="/test/testStart" method="get" class="w-50">
            <label for="testSelect" class="form-label fw-bold">Select a Test:</label>
            <select id="testSelect" name="testId" class="form-select mb-3" required>
                <option value="" disabled selected>Choose a test</option>
                <c:forEach var="test" items="${tests}">
                    <option value="${test.id}">${test.title} - (${test.questions[0].category})</option>
                </c:forEach>
            </select>
            <button type="submit" class="btn btn-primary w-100">Start Test</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
