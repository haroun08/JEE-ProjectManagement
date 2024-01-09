<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .error-container {
            background-color: #ffe6e6;
            padding: 20px;
            border: 1px solid #ff9999;
            border-radius: 5px;
            margin-top: 20px;
        }
        h2 {
            color: #ff3333;
        }
    </style>
</head>
<body>
    <h2>Error Page</h2>
    <div class="error-container">
        <p>An unexpected error occurred:</p>
        <p><strong>${errors}</strong></p>
        <p>Please try again later or contact support.</p>
    </div>
</body>
</html>
