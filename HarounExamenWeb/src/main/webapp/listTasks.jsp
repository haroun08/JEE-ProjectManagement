<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	background: url('back.jpg') no-repeat center center fixed;
	background-size: cover;
	background-color: #f8f9fa;
}

.container {
	margin-top: 50px;
}

.task-details-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

.table-header {
	font-weight: bold;
}

.table-content {
	margin-bottom: 10px;
}

.btn-container {
	margin-bottom: 20px;
}

.btn-group {
	display: flex;
	justify-content: space-between;
}

.table-responsive {
	overflow-x: auto;
}
</style>

<title>Task Information</title>
</head>

<body>

	<div class="container">
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead class="thead-dark">
					<tr>
						<th>Code</th>
						<th>Description</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Associated Project</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="task" items="${taskModel.tasks}">
						<tr>
							<td>${task.code}</td>
							<td>${task.description}</td>
							<td>${task.startDate}</td>
							<td>${task.endDate}</td>
							<td>${task.project.code}</td>
							<td><a class="btn btn-warning btn-sm"
								href="${pageContext.request.contextPath}/TaskController?action=updateTask&code=${task.code}"
								role="button">Edit</a> <a class="btn btn-danger btn-sm"
								href="${pageContext.request.contextPath}/TaskController?action=removeTask&code=${task.code}"
								role="button">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="btn-container">
			<a class="btn btn-success"
				href="${pageContext.request.contextPath}/TaskController?action=createTask"
				role="button">Create New Task</a> <a class="btn btn-secondary"
				href="${pageContext.request.contextPath}/TaskController?action=showTasks"
				role="button">List of Tasks</a>
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
