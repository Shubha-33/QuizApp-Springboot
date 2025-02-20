<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-4">
    <h2 class="text-center text-primary mb-3">Admin Dashboard</h2>

    <!-- Action Buttons -->
       <div class="card p-3 mb-3">
        <h5 class="text-center text-secondary">Manage Questions</h5>
        <div class="d-flex justify-content-center gap-2">
            <a href="/question/allquestions" class="btn btn-primary w-50 mt-2">View All Questions</a>
            <a href="/question/addQuestion" class="btn btn-warning w-50 mt-2">Add  New Question</a>
        </div>
    </div>
    <!-- Filter Questions -->
    <div class="card p-3 mb-3">
        <h5 class="text-center text-secondary">Filter Questions</h5>
        <form action="/question/allquestions" method="get">
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label">Category</label>
                    <select name="category" class="form-select">
                        <option value="java">Java</option>
                        <option value="python">Python</option>
                        <option value="html">HTML</option>
                        <option value="css">CSS</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Level</label>
                    <select name="level" class="form-select">
                        <option value="easy">Easy</option>
                        <option value="medium">Medium</option>
                        <option value="hard">Hard</option>
                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-success mt-3 w-100">Apply Filters</button>
        </form>
    </div>

    <!-- Create Quiz -->
    <div class="card p-3">
        <h5 class="text-center text-secondary">Create Quiz</h5>
        <form action="/test/create" method="post">
            <div class="mb-2">
                <label class="form-label">Test Name</label>
                <input type="text" name="testName" class="form-control" required>
            </div>
            <div class="mb-2">
                <label class="form-label">Number of Questions</label>
                <input type="number" name="num" class="form-control" required>
            </div>
            <div class="mb-2">
                <label class="form-label">Category</label>
                <select name="category" class="form-select">
                    <option value="java">Java</option>
                    <option value="python">Python</option>
                    <option value="html">HTML</option>
                </select>
            </div>
            <button type="submit" class="btn btn-dark w-100">Create Quiz</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
