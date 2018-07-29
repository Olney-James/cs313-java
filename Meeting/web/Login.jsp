<%-- 
    Document   : Login
    Created on : Mar 15, 2016, 1:43:21 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <style>
            .login{
                border-radius: 7px;
                width: 215px;
                height: 190px;
                padding: 20px;
                margin: 0 auto; 
                background-image: url("foregroundColor.png");
                box-shadow: 5px 5px 5px #8080ff;
            }
            .text{
                border-radius: 5px;
                color: black;
            }
            span{
                color:whitesmoke;
            }
            .long{
                width: 100%;
                border-radius: 5px;
                padding: 5px;
                color: black;
                display: inline;
            }
            p{
                color: whitesmoke;
                text-align: center;
            }
            p.copyright{
                text-align: center;
                color: cadetblue;
            }
            .center{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <br/>
        <br/>
        <div class="login">
            <form action="Verify" method="POST">
                <span class="glyphicon glyphicon-user"><input class="text" type="text" name="user" value="Admin" disabled/></span><br />
                <span class="glyphicon glyphicon-lock"><input class="text" type="password" name="password" placeholder="Password" autofocus/></span><br /> 
                </br><input class="long" type="submit" value="LOGIN" /></input>
            </form> 
            <hr>
            <a href="index.jsp"><p>Enter as Guest</p></a>
        </div>
        <%
            if (session.getAttribute("validationMsg") != null) {
                out.print(session.getAttribute("validationMsg"));
                session.setAttribute("validationMsg", null);
            }
        %>
        <div class="center">
            <hr>
            <p class="copyright">© 2016 by Olney. All rights reserved.</p>            
        </div>
    </body>
</html>
