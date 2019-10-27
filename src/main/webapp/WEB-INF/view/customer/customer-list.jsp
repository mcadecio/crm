<%--
  Created by IntelliJ IDEA.
  User: ddaio
  Date: 27/10/2019
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Customers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<br>

<div style="background-color: forestgreen">
    <h1 style="color: white">
        CRM -Customer Relationship Manager
    </h1>
</div>

<table class="table table-hover" style="text-align: center">
    <thead>
    <tr>
        <td>First Name</td>
        <td>Last Name</td>
        <td>Email</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="temp" items="${customers}">
        <tr>
            <td>${temp.firstName}</td>
            <td>${temp.lastName}</td>
            <td>${temp.email}</td>
            <td><a href="">Update</a> |<a href="">Delete</a></td>
        </tr>
    </c:forEach>

    </tbody>

</table>

</body>
</html>
