<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Projects</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background: url('back.jpg') no-repeat center center fixed;
            background-color: #f8f9fa;
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .btn-container {
            margin-bottom: 20px;
        }

        .btn {
            margin-right: 10px;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-warning,
        .btn-danger {
            padding: 8px 15px;
        }

        .btn-sm {
            padding: 8px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Projects</h2>
        
        <!-- Table of Projects -->
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
                    <c:forEach var="project" items="${pmodel.projects}">
                        <tr>
                            <td>${project.code}</td>
                            <td>${project.description}</td>
                            <td>${project.startDate}</td>
                            <td>
                                <a class="btn btn-warning btn-sm" href="${pageContext.request.contextPath}/ProjectController?action=updateProject&code=${project.code}" role="button">Edit</a>
                                <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/ProjectController?action=removeProject&code=${project.code}" role="button">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
        <div class="btn-container">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/ProjectController?action=createProject" role="button">Create Project</a>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/ProjectController?action=showProjects" role="button">Show Projects</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
