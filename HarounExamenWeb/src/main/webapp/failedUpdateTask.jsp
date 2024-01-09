<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Failed Update Task</title>
</head>
<body>
    <h2>Failed to Update Task</h2>
    
    <c:if test="${not empty errors}">
        <p style="color: red;">Error Message: ${errors}</p>
    </c:if>
    
    <p>There was an error while attempting to update the task.</p>
    

    <p><a href="<%= request.getContextPath() %>/task.jsp">Back to Task Page</a></p>
</body>
</html>
