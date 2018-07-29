<%-- 
    Document   : ViewPosts
    Created on : Mar 4, 2016, 6:41:59 PM
    Author     : james_olney
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <title>Comments</title>
        <style>
            .user {
                position: absolute;
                right: 25px;
                top: 10px;
                float: right;
            }
            p{
                display:inline;
            }
            form{
                display: inline;
            }
            .comments{
                border-radius: 7px;
                width: 400px;
                padding: 20px;
                margin: 0 auto; 
                background:#4d4dff;
                box-shadow: 5px 5px 5px #8080ff;
                color: whitesmoke;
            }
            .submit{
                border-radius: 5px;
                padding: 5px;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="user">
            <p><span class="glyphicon glyphicon-user">Account:<% out.print(session.getAttribute("user")); %></p>
            <form method="POST" action="logOut">
                <input class="logout" type="submit" value="Log Out" />
            </form>
        </div>
        <div class="comments">
        Comments:<br /><br /> 
            
            <c:forEach var="comment" items="${comments}"> 
                <span class="glyphicon glyphicon-user"></span><strong>${comment.user} </strong> ${comment.time}<br />-->${comment.comment} </br>
            </c:forEach>
            
            <form action="EnterNewPostPage.jsp">
                <input class="submit" type="submit" value="ENTER NEW POST" />
            </form>
        </div>
            
    </body>
</html>
