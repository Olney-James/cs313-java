 <%-- 
    Document   : index
    Created on : Mar 14, 2016, 7:57:52 AM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Search</title>
    </head>
    <body>
        <h1>Movie Search</h1>
        <form method="Post" action="MovieSearch">
            <input type="text" id="searchParam" name="searchParam" placeHolder="query"></input>
            <br/>
            <br/>
            <input type="submit" value="Search"/>
        </form>
        
        <h2>Movies</h2>
        <c:forEach var="movie" items="${movies}">
            <img src="${movie.Poster}" style="width:89px;height:132px;">
            <p>${movie.Title} (${movie.Year})</p>
            <form method="Post" action="MovieLink">
                <input type="text" id="searchParam" name="searchParam" value="${movie.Title}" readonly></input>
                <br/>
                <br/>
                <input type="submit" value="More Information"/>
            </form>
            
        </c:forEach>
    </body>
</html>
