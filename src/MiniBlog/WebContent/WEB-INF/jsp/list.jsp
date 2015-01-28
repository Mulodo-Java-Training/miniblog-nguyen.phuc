<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.sql.*,com.blog.model.*" %>
<%@ page session="false" %>
<html>
<head>
	<title>List User</title>
</head>
<body>
<h1>
	Demo Spring MVC!  
</h1>

<table border="1" cellpadding="5" cellspacing="5">
        <tr>
            <th>ID</th>
            <th>User Name</th>
            <th>Fist name</th>
            <th>Last name </th>
            <th>Address</th>
            <th colspan=2>Action</th>
        </tr>

        <c:forEach var="user" items="${listUsers}">
        
            <tr>
                <td>${user.getUserID()}</td>
                <td>${user.getUserName()}</td>
                <td>${user.getFirstName()}</td>
                <td>${user.getLastName()}</td>
                <td>${user.getAddress()}</td>
                <td><a href="/edit/<c:out value="${user.getUserName()}"/>">Update</a></td>
                <td><a href="/remove/<c:out value="${user.getUserName()}"/>">Delete</a></td>
               
            </tr>
        </c:forEach> 
    </table>
</body>
</html>