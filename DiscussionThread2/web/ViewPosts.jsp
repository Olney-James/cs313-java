<%-- 
    Document   : ViewPosts
    Created on : Mar 4, 2016, 6:41:59 PM
    Author     : james_olney
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comments</title>
        <style>
            .comments{
                border-radius: 7px;
                
                padding: 20px;
                margin: 0 auto; 
                background:#4d4dff;
                box-shadow: 5px 5px 5px #8080ff;
            }
        </style>
    </head>
    <body>
        <div class="comments">
            Comments:<br /><br /> 

            <c:forEach var="comment" items="${comments}"> 
                ${comment.comment} <strong>--${comment.user}</strong><br />
            </c:forEach>
            <a href="EnterNewPostPage.html">Enter New Post</a>    
        </div>
    </body>
</html>
