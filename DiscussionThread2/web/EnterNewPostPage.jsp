<%-- 
    Document   : EnterNewPostPage
    Created on : Mar 5, 2016, 5:32:10 PM
    Author     : james_olney
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Post</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <style>
            .user {
                position: absolute;
                right: 25px;
                top: 10px;
                float: right;
            }
            .post{
                border-radius: 7px;
                width: 260px;
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
            span{
                color:black;
            }
            form{
                display: inline;
            }
            p{
                display:inline;
            }
            .logout{
                border-radius: 5px;
                color: black;
                padding: 0px;
            }
        </style>
    </head>
    <body>
        <% 
            if(session.getAttribute("validationMsg") != null){
                out.print(session.getAttribute("validationMsg"));
                session.setAttribute("validationMsg", null);
            }
        %>
        <div class="user">
            <p><span class="glyphicon glyphicon-user">Account:<% out.print(session.getAttribute("user")); %></p>
            <form method="POST" action="logOut">
                <input class="logout" type="submit" value="Log Out" />
            </form>
        </div>
        <div class="post">
            <form method="POST" action="CreatePost">
                <textarea class="text" rows="4" cols="27" type="text" name="comment" placeholder="Comment"/></textarea><br />

                <br />
                <input class="submit"  type="submit" value="Post" />
            </form>
            <form action="ShowPosts">
                <input class="submit" type="submit" value="View Posts" />
            </form>
            <form method="POST" action="CreateFile">
                <input class="submit" type="submit" value="CreateFile" />
            </form>
        </div>
    </body>
</html>
