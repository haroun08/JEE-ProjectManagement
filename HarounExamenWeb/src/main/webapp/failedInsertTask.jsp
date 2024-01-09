<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Failed to Insert Task</title>
</head>
<body>
    <h2>Failed to Insert Task</h2>

    <p style="color: red;">${taskModel.errors}</p>

    <p><a href="${pageContext.request.contextPath}/index.jsp">Back to Index Page</a></p>
</body>
</html>
