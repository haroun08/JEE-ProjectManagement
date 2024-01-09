<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Removed Successfully</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            background: url('back.jpg') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            color: #333;
        }

        h2 {
            margin-top: 50px;
        }

        p {
            margin-top: 20px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Task Removed Successfully</h2>

    <c:choose>
        <c:when test="${not empty successMessage}">
            <p>${successMessage}</p>
        </c:when>
        <c:otherwise>
            <p>No success message available.</p>
        </c:otherwise>
    </c:choose>

    <p><a href="${pageContext.request.contextPath}/TaskController?action=listTasks">Back to Task Page</a></p>
</body>
</html>
