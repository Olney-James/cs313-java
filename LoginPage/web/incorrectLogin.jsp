<%-- 
    Document   : incorrectLogin
    Created on : Feb 29, 2016, 6:42:42 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incorrect Login</title>
    </head>
    <body>
        <h1>Incorrect Login! ${user} ${password}</h1>
        <a href='index.html'>Log In</a>
        <p>User: <% out.print(session.getAttribute("user")); %></p>
        
    </body>
</html>
