<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success - Task Created</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background: url('your-background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            text-align: center;
            padding-top: 50px;
        }

        h2 {
            color: #007bff;
        }

        p {
            margin: 20px 0;
            font-size: 18px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Success - Task Created</h2>

    <p>The task has been successfully created.</p>

    <p><a href="${pageContext.request.contextPath}/listTasks.jsp">View Task List</a></p>
    <p><a href="${pageContext.request.contextPath}/createTask.jsp">Create Another Task</a></p>
</body>
</html>
