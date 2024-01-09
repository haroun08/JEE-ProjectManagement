<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Task</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 50px;
}

.form-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.btn-submit {
	margin-top: 20px;
}

.error-message {
	color: red;
}

.back-link {
	margin-top: 10px;
	display: inline-block;
	font-size: 14px;
	text-decoration: none;
	color: #007bff;
	transition: color 0.3s ease;
}

.back-link:hover {
	color: #0056b3;
}
</style>
</head>
<body>

	<div class="container">
		<div class="form-container">
			<h2>Create Task</h2>

			<form action="${pageContext.request.contextPath}/TaskController"
				method="post">
				<input type="hidden" name="action" value="createTask">

				<div class="form-group">
					<label for="code">Code:</label> <input type="text"
						class="form-control" id="code" name="code" required>
				</div>
				<div class="form-group">
					<label for="description">Description:</label> <input type="text"
						class="form-control" id="description" name="description" required>
				</div>
				<div class="form-group">
					<label for="startdate">Start Date:</label> <input type="date"
						class="form-control" id="startdate" name="startdate" required>
				</div>
				<div class="form-group">
					<label for="enddate">End Date:</label> <input type="date"
						class="form-control" id="enddate" name="enddate" required>
				</div>
				<div class="form-group">
					<label for="projectCode">Project Code:</label> <select
						class="form-control" id="projectCode" name="projectCode" required>
						<c:forEach var="projectCode" items="${model.optionsList}">
							<option value="${projectCode}">${projectCode}</option>
						</c:forEach>
					</select>
				</div>

				<button type="submit" class="btn btn-primary btn-submit">Create
					Task</button>
				</button>
			</form>

			<div class="mt-3">
				<a class="btn btn-secondary"
					href="${pageContext.request.contextPath}/TaskController?action=listTasks"
					role="button"> Back to Task Page </a>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

</body>
</html>

