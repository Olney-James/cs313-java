<%-- 
    Document   : index
    Created on : Mar 15, 2016, 4:37:05 AM
    Author     : james_olney
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    //String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //String DB_URL = "jdbc:mysql://localhost/meeting";
    //String USER = "root";
    //String PASS = "";
    String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
    String USER = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
    String PASS = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
    Connection conn = null;
    Statement stmt = null;

    if(session.getAttribute("user") == null){
        session.setAttribute("user", "Guest");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <title>Meeting Page</title>
        <style>
            .headDiv{
                background-image: url("backgroundColor.png");
                height: 50px;
                width: 100%;
            }
            .header{
                background-image: url("foregroundColor.png");
                width: 100%;
                color: whitesmoke;
                text-align: center; 
            }
            .account{
                position: absolute;
                right: 10px;
                top: 8px;
                float: right; 
                text-align: right;
            }
            p{
                display:inline;               
                color: whitesmoke;
            }
            form{
                display:inline;
            }
            .dropdowns{
                position: absolute;
                left: 10px;
                top: 8px; 
            }
            .activity{
                width: 60%;
                border-radius: 3px;
                border: .5px solid cadetblue;
                margin-left: auto ;
                margin-right: auto ;
            }
            .table{
                padding-top: 19px;
                padding-left: 10px;
                padding-right: 10px;
                width: 100%;
            }
            .long{
                width: 100%;
            }
            .submit{
                width:100%;
            }
            p.copyright{
                text-align: center;
                color: cadetblue;
            }
            .center{
                text-align: center;
            }
            img{
                display: inline;
            }
            .external{
                width: 73%;
                display: inline-block;
            }
            .meeting{
                color: black;
            }
            .post{
                width: 60%;
                border-radius: 3px;
                border: .5px solid cadetblue;
                margin-left: auto ;
                margin-right: auto ;
            }
            
        </style>
        <script src="https://apis.google.com/js/platform.js" async defer>
        </script>
    </head>
    <body>
        
        <div class='headDiv'>
            <div class="dropdowns">
                <div class="dropdown" >
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Meetings
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <li><a href="comingSoon.jsp">General Meeting - General Addiction</a></li>
                        <li><a href="comingSoon.jsp">Spouse, Family & Friends Support - General Addiction</a></li>
                        <li><a href="comingSoon.jsp">Men's PASG - Pornography Addiction</a></li>
                        <li><a href="comingSoon.jsp">Women's Support - Pornography Addiction</a></li>
                    </ul>
                    <a href="sources.jsp" class="btn btn-primary">Resources</a>
                </div>
                
            </div>
            <%                if (session.getAttribute("validationMsg") != null) {
                    out.print(session.getAttribute("validationMsg"));
                    session.setAttribute("validationMsg", null);
                }
            %>
            <div class="account">
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-user">Account:<% out.print(session.getAttribute("user"));%>
                            <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        <% if (session.getAttribute("user") == "Admin") {
                                out.println("<li><form method='POST' action='logOut'><input class='long' type='submit' value='Log Out' /></form></li>");
                            } else {
                                out.println("<li><a href='Login.jsp'>Login as Admin</a></li>");
                            }%>
                    </ul>
                </div>
            </div>
        </div> 
        <br/>
        <div class="activity">
            <div class="header">Join A Meeting Online</div>
            <div class="table">
                <h4>ONLINE MEETINGS</h4>
                <hr>

                <%

                    try {
                        //out.println("msg");
                        Class.forName("com.mysql.jdbc.Driver");
                        //out.println("Connecting to database...");
                        conn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/meeting", USER, PASS);
                        //conn = DriverManager.getConnection(DB_URL, USER, PASS);
                        //out.println("Creating statement...");

                        stmt = conn.createStatement();
                        String sql;
                        sql = "SELECT * FROM meeting";
                        //out.println(sql);
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String purpose = rs.getString("purpose");
                            String step = rs.getString("step");
                            String hangOutLink = rs.getString("hangOutLink");
                            String day = rs.getString("day");
                            String time = rs.getString("time");
                            String duration = rs.getString("duration");
                            String d = day;
                            String t = time;
                            String dur = duration;
                            String p = purpose;
                            String s = step;
                            String hOL = hangOutLink;
                            out.println("<p class='meeting' ><b>" + p + "</b> " + s + "</p>");
                            out.println("<p class='meeting' >" + d + " " + t + "</p>");
                            out.println("<p class='meeting' >" + "</p>");
                            out.println("<hr>");
                        }
                        //session.setAttribute("msg", "success");
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (stmt != null) {
                                stmt.close();
                            }
                        } catch (SQLException se2) {
                        }
                        try {
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }

                    if (session.getAttribute("user") == "Admin") {
                        //out.println("<button class='long' type='button' onclick='AddMeeting'>Add A Meeting</button>");
                        out.println("<g:hangout render='createhangout'></g:hangout>");
                    }%>

            </div>


        </div> 
        </br>
        <div class="post">
            <div class="header">Messaging</div>
            <div class="table">
                <%
                    try {
                        //out.println("msg");
                        Class.forName("com.mysql.jdbc.Driver");
                        //out.println("Connecting to database...");
                        conn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/meeting", USER, PASS);
                        //conn = DriverManager.getConnection(DB_URL, USER, PASS);
                        //out.println("Creating statement...");

                        stmt = conn.createStatement();
                        String sql;
                        sql = "SELECT * FROM comment";
                        //out.println(sql);
                        ResultSet rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String user_name = rs.getString("user_name");
                            String comment = rs.getString("comment");;
                            String u = user_name;
                            String c = comment;
                            out.println("<span class='glyphicon glyphicon-user'></span><p class='meeting' ><b>" + u + "</b> " + c + "</p>");
                            out.println("<hr>");
                        }
                        //session.setAttribute("msg", "success");
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (stmt != null) {
                                stmt.close();
                            }
                        } catch (SQLException se2) {
                        }
                        try {
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }

                    if(session.getAttribute("msg") != null){
                        out.print(session.getAttribute("msg"));
                    }%>

                <form method="POST" action="CreatePost">
                    <textarea class="text" rows="4"  cols="74" type="text" name="comment" placeholder="Comment"/></textarea><br />

                    <br />
                    <input class="submit"  type="submit" value="Post" />
                </form>

            </div>    
        </div>
        <br/>
        <div class="activity">
            <div class="header">Find A Live Meeting Near You</div>
            <div class="table">
                <img src='lds.png'>
                <button class="external" type="button" onclick=window.open("https://addictionrecovery.lds.org/find-a-meeting?lang=eng")>Find Locations & Times</button>
            </div>    
        </div>
        <div class="center">
            <hr>
            <p class="copyright">© 2016 by Olney. All rights reserved.</p>   

        </div>
    </body>
</html>
