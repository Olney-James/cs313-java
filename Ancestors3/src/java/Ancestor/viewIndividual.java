/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ancestor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author james_olney
 */
@WebServlet(name = "viewIndividual", urlPatterns = {"/viewIndividual"})
public class viewIndividual extends HttpServlet {

    //static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //static final String DB_URL = "jdbc:mysql://localhost/ancestors";
    //static final String USER = "root";
    //static final String PASS = "";
    static final String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
    static final String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
    static final String USER = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
    static final String PASS = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewIndividual</title>");
            out.println("</head>");
            out.println("<body>");
            Connection conn = null;
            Statement stmt = null;
            HttpSession session = request.getSession();
            session.setAttribute("msg", "msg");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                session.setAttribute("msg", "Connecting to database...");
                conn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/ancestors", USER, PASS);
                //conn = DriverManager.getConnection(DB_URL, USER, PASS);
                //out.println("Creating statement...");
                //out.println(request.getParameter("first_name"));
                stmt = conn.createStatement();
                String sql;
                sql = "SELECT * FROM ancestors WHERE first_name ='" + request.getParameter("first_name") + "'";
                //out.println(sql);
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String first_name = rs.getString("first_name");
                    String last_name = rs.getString("last_name");
                    String birthday = rs.getString("birthday");
                    String fn = first_name;
                    String ln = last_name;
                    String bd = "Birthday: " + birthday;
                    out.println("<p>" + fn + " " + ln + "</p>");
                    out.println("<p>" + bd + "</p>");
                    out.println("<hr>");
                }
                session.setAttribute("msg", "success");
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
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
