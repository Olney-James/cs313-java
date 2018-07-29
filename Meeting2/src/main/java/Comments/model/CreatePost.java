package Comments.model;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import Comments.model.Comment;
//import Comments.model.FileCommentHandler;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
//import static java.util.jar.Pack200.Packer.PASS;
import javax.servlet.http.HttpSession;
//import static javax.ws.rs.Priorities.USER;
import java.sql.*;

/**
 * @author james_olney
 */
@WebServlet(name = "CreatePost", urlPatterns = {"/CreatePost"})
public class CreatePost extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreatePost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePost at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String comment = request.getParameter("comment");
        String user = (session.getAttribute("user")).toString();
        DateFormat df = new SimpleDateFormat("MM/dd/yy HH:mm:ss");
        Date today = Calendar.getInstance().getTime();
        String logDate = df.format(today);
        Comment newComment = new Comment(comment, logDate, user);
        String nc = newComment.toFileString();
        //FileCommentHandler handler = new FileCommentHandler("CommentList2.txt");
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        //String DB_URL = "jdbc:mysql://localhost/meeting";
        //String USER = "root";
        //String PASS = "";
        String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
        String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
        String USER = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
        String PASS = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(JDBC_DRIVER);
            //conn = DriverManager.getConnection(DB_URL, USER, PASS);
            conn = DriverManager.getConnection("jdbc:mysql://" + host + ":" + port + "/meeting", USER, PASS);
            stmt = conn.createStatement();

            String sql = "INSERT INTO comment (user_name, comment) VALUES ('" + user + "' , '" + nc + "')";
            stmt.executeUpdate(sql);
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            se.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    conn.close();
                }
            } catch (SQLException se) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
