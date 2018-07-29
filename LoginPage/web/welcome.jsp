<%-- 
    Document   : welcome
    Created on : Feb 29, 2016, 6:43:36 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
        <h1>Welcome <% out.print(session.getAttribute("user")); %>!</h1>
        <a href="logOut">Log Out</a>
        <p>User: <% out.print(session.getAttribute("user")); %></p>
    </body>
</html>
