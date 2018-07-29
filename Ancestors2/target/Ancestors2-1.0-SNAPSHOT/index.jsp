<%-- 
    Document   : index
    Created on : Mar 17, 2016, 8:48:28 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="readAncestors" method="POST">
                </br><input class="long" type="submit" value="Read Ancestors" /></input>
            </form>
        <p><% if (session.getAttribute("msg") != null) {
                out.println(session.getAttribute("msg"));
            }%></p>
    </body>
</html>
