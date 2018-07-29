<%-- 
    Document   : sources
    Created on : Mar 26, 2016, 10:19:17 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <title>Sources</title>
        <style>
            .headDiv{
                background-image: url("backgroundColor.png");
                height: 50px;
                width: 100%;
            }
            .dropdowns{
                position: absolute;
                left: 10px;
                top: 8px; 
            }
            .account{
                position: absolute;
                right: 10px;
                top: 8px;
                float: right; 
                text-align: right;
            }
            .container{
                margin: auto;
                width: 887px;
            }
            .likeDragons{
                display: inline;
            }
            .manual{
                display: inline;
            }
            p.copyright{
                text-align: center;
                color: cadetblue;
            }
            .center{

                text-align: center;
                bottom: 50px;
            }
        </style>
    </head>
    <div class='headDiv'>
        <div class="dropdowns">
            <a href="index.jsp" class="btn btn-primary">Main Page</a>
        </div>
        <%
            if (session.getAttribute("validationMsg") != null) {
                out.print(session.getAttribute("validationMsg"));
                session.setAttribute("validationMsg", null);
            }
        %>
        <div class="account">
            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-user">Account:<% out.print(session.getAttribute("user"));%>
                        <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <%
                        if (session.getAttribute("user") == "Admin") {
                            out.println("<li><form method='POST' action='logOut'><input class='long' type='submit' value='Log Out' /></form></li>");
                        } else {
                            out.println("<li><a href='Login.jsp'>Login as Admin</a></li>");
                        }
                    %>
                </ul>
            </div>
        </div>
    </div> 
    <body>
        <br/>
        <div class="container">
            <div class="manual">
                <a href="https://addictionrecovery.lds.org/bc/content/arp/content/manuals/ARPGuide_English_36764.pdf"><img src="manual.png"></a>
            </div>
            <div class="likeDragons">
                <a href="https://books.google.com/books/about/Like_Dragons_Did_They_Fight_A_Look_Into.html?id=vxoOngEACAAJ"><img src="likeDragonsDidTheyFight.png"></a>
            </div>
        </div>
        <div class="center">
            <hr>
            <p class="copyright">© 2016 by Olney. All rights reserved.</p>   

        </div>
    </body>
</html>
