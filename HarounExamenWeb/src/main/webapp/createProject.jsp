<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Project</title>
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

        p a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            display: block;
            text-align: center;
            margin-top: 10px;
        }

        p a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Create Project</h2>

        <form action="${pageContext.request.contextPath}/ProjectController" method="post">
            <input type="hidden" name="action" value="createProject">

            <label for="code">Code:</label>
            <input type="text" name="code" id="code" required>

            <label for="description">Description:</label>
            <input type="text" name="description" id="description" required>

            <label for="startdate">Start Date:</label>
            <input type="date" name="startdate" id="startdate" required>

            <button type="submit" class="btn btn-primary">Create Project</button>
        </form>

        <p><a href="${pageContext.request.contextPath}/ProjectController?action=listProjects">Back to Project Page</a></p>
        
    </div>

</body>
</html>
