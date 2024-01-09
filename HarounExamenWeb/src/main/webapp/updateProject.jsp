<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page import="Entity.Project"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	background: url('test.jpg') no-repeat center center fixed;
	background-size: cover;
}

.container {
	max-width: 400px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	margin-bottom: 8px;
	color: #333;
}

input {
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	width: 100%;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>

<title>Update Project</title>
</head>
<body>

	<div class="container">
		<h2>Update Project</h2>

		<form action="${pageContext.request.contextPath}/ProjectController"
			method="post">
			<input type="hidden" name="action" value="updateProject"> <input
				type="hidden" name="code" value="${model.project.code}">

			<div class="form-group">
				<label for="code">Code:</label> <input type="text"
					class="form-control" id="code" value="${model.project.code}"
					readonly>
			</div>

			<div class="form-group">
				<label for="description">Description:</label> <input type="text"
					class="form-control" name="description"
					value="${projectModel.project.description}" required>
			</div>

			<div class="form-group">
				<label for="startdate">Start Date:</label> <input type="date"
					class="form-control" name="startdate"
					value="${projectModel.project.startDate}" required>
			</div>

			<button type="submit" class="btn btn-primary">Update Project</button>
			<div class="mt-3">
				<a class="btn btn-secondary"
					href="${pageContext.request.contextPath}/ProjectController?action=listProjects"
					role="button"> Back to Project Page </a>
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
