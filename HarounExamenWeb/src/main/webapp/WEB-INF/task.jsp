<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task Details</title>
</head>
<body>
    <h2>Task Details</h2>

    <form action="<%= request.getContextPath() %>/TaskServlet" method="post">
        <input type="hidden" name="action" value="${tmodel.mode}" />
        <label for="code">Task Code:</label>
        <input type="text" id="code" name="code" value="${tmodel.code}" required readonly/><br/>

        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="${tmodel.description}" required/><br/>

        <label for="startdate">Start Date:</label>
        <input type="date" id="startdate" name="startdate" value="<fmt:formatDate value='${tmodel.startdate}' pattern='yyyy-MM-dd' />" required/><br/>

        <label for="enddate">End Date:</label>
        <input type="date" id="enddate" name="enddate" value="<fmt:formatDate value='${tmodel.enddate}' pattern='yyyy-MM-dd' />" required/><br/>

        <label for="projectcode">Project Code:</label>
        <select id="projectcode" name="projectcode" required>
            <c:forEach var="project" items="${pmodel.projects}">
                <option value="${project.code}" <c:if test="${project.code eq tmodel.project.code}">selected</c:if>>${project.code}</option>
            </c:forEach>
        </select><br/>


        <input type="submit" value="${tmodel.mode == 'add' ? 'Add Task' : 'Update Task'}" />
    </form>


    <p><a href="<%= request.getContextPath() %>/WEB-INF/VueTask.jsp">Back to Task Page</a></p>
</body>
</html>
