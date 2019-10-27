<%--
  Created by IntelliJ IDEA.
  User: ddaio
  Date: 27/10/2019
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
    <style>
        .myDiv {
            width: 300px;
            height: auto;
            float: left;
            font-size: large;
            align-items: start;
        }
        .myDiv1 {
            width: 100px;
            height: auto;
            float: left;
            font-size: large;
            text-align: right;
            padding-top: 10px;
            padding-right: 30px;
        }

        input[type=text], select {
            width: 100%;
            padding: 5px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: medium;
        }
        input[type=submit], select{
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: large;
        }
        input[type=submit]:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>

<div style="background-color: green; padding: 5px">
    <h1 style="color: white; vertical-align: center">
        CRM -Customer Relationship Manager
    </h1>
</div>

<br>

<h2><strong>Save Customer</strong></h2>

<br>
<form:form method="POST" action="processform" modelAttribute="newCustomer">

    <div class="myDiv1">
        First name:
        <br>
        <br>
        Last name:
        <br>
        <br>
        Email:
    </div>
    <div class="myDiv">
        <form:input path="firstName"/>
        <br>
        <form:input path="lastName"/>
        <br>
        <form:input path="email"/>
        <br>
        <br>
        <input type="submit" value="Save">
        <br>
    </div>
</form:form>
<br>
<br>
<div style="float: right">
<a href="${pageContext.request.contextPath}/customer/list">Back to list</a>
</div>
</body>
</html>
