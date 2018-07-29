<%-- 
    Document   : login
    Created on : Mar 5, 2016, 5:16:41 PM
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
                height: 200px;
                padding: 20px;
                margin: 0 auto; 
                background:#4d4dff;
                box-shadow: 5px 5px 5px #8080ff;
            }
            .submit{
                border-radius: 5px;
                padding: 5px;
                color: black;
            }
            .text{
                border-radius: 5px;
                color: black;
            }
            h1{
                color: whitesmoke;
                font: Arial;
            }
            span{
                color:whitesmoke;
            }
        </style>
    </head>
    <body>
        <div class="login">
            <h1>Login</h1>
            <form action="Verify" method="POST">
                <span class="glyphicon glyphicon-user"><input class="text" type="text" name="user" placeholder="Username"/><br />
                <span class="glyphicon glyphicon-lock"><input class="text" type="password" name="password" placeholder="Password"/><br /> 
                </br><center><input class="submit" type="submit" value="LOGIN" /></center>
            </form>
        </div>
        <% 
            if(session.getAttribute("validationMsg") != null){
                out.print(session.getAttribute("validationMsg"));
                session.setAttribute("validationMsg", null);
            }
        %>
    </body>
</html>
