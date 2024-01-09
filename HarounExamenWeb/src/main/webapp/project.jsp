<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Projects</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="path/to/your/custom.css">
<style>
body {
	background-color: #f8f9fa;
	background: url('back.jpg') no-repeat center center fixed;
	background-size: cover;
}

.container {
	margin-top: 50px;
}

.task-details-container {
	background-color: #fff;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 15px;
}

.btn-container {
	margin-bottom: 10px;
}

.btn {
	margin-right: 8px;
	background-color: #007bff;
	color: #fff;
	padding: 8px 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #0056b3;
}

table {
	width: 100%;
	max-width: 800px;
	margin: 20px 0;
}

th, td {
	text-align: center;
	padding: 8px;
}

th {
	background-color: #007bff;
	color: #fff;
}

td {
	background-color: #f8f9fa;
}

.btn-sm {
	padding: 5px 10px;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Projects</h2>

		<div class="table-container">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>Code</th>
						<th>Description</th>
						<th>Start Date</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${projects}">
						<tr>
							<td>${project.code}</td>
							<td>${project.description}</td>
							<td>${project.startDate}</td>
							<td><a class="btn btn-warning btn-sm"
								href="${pageContext.request.contextPath}/ProjectController?action=updateProject&code=${project.code}"
								role="button">Edit</a> <a class="btn btn-danger btn-sm"
								href="${pageContext.request.contextPath}/ProjectController?action=removeProject&code=${project.code}"
								role="button">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="btn-container">
			<a class="btn btn-primary"
				href="${pageContext.request.contextPath}/ProjectController?action=listProjects"
				role="button">Go pack to Project page</a>
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
