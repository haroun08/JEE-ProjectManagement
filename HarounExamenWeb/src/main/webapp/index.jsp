<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Index Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-color: #f8f9fa;
	background: url('test.jpg') no-repeat center center fixed;
	background-size: cover;
}

.container {
	margin-top: 50px;
}

.jumbotron {
	padding: 20px;
	border: 2px solid #ccc;
	border-radius: 10px;
	text-align: center;
}

.btn-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.btn {
	margin: 0 10px;
	padding: 15px 30px;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.btn:hover {
	background-color: #5bc0de;
	color: #fff; 
}
</style>
</head>

<body>

	<div class="container">
		<div class="jumbotron">
			<div class="btn-container">
				<a class="btn btn-primary btn-lg"
					href="${pageContext.request.contextPath}/TaskController?action=listTasks"
					role="button">Go to Task Page</a> <a class="btn btn-success btn-lg"
					href="${pageContext.request.contextPath}/ProjectController?action=listProjects"
					role="button">Go to Project Page</a>
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
