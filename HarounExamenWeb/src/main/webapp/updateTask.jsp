<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Task</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	background: url('test.jpg') no-repeat center center fixed;
	background-size: cover;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.container {
	width: 400px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-bottom: 8px;
	color: #333;
}

input, select {
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	width: 100%;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Update Task</h2>

		<form action="${pageContext.request.contextPath}/TaskController"
			method="post">
			<input type="hidden" name="action" value="updateTask"> <input
				type="hidden" name="code" value="${model.task.code}">

			<div class="form-group">
				<label for="code">Code:</label> <input type="text"
					class="form-control" id="code" value="${model.task.code}" readonly>
			</div>

			<label for="description">Description:</label> <input type="text"
				name="description" id="description"
				value="${model.task.description}" required> <label
				for="startdate">Start Date:</label> <input type="date"
				name="startdate" id="startdate" value="${model.task.startDate}"
				required> <label for="enddate">End Date:</label> <input
				type="date" name="enddate" id="enddate"
				value="${model.task.endDate}" required> <label
				for="projectCode">Project Code:</label> <select class="form-control"
				id="projectCode" name="projectCode" required>
				<c:forEach var="projectCode" items="${model.optionsList}">
					<option value="${projectCode}"
						${projectCode eq taskModel.task.project.code ? 'selected' : ''}>${projectCode}</option>
				</c:forEach>
			</select>

			<button type="submit" class="btn btn-primary">Update Task</button>

			<div class="mt-3">
				<a class="btn btn-secondary"
					href="${pageContext.request.contextPath}/TaskController?action=listTasks"
					role="button"> Back to Task Page </a>
			</div>
		</form>
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
