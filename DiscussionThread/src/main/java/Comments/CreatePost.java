package Comments;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Comments.model.Comment;
import Comments.model.FileCommentHandler;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.http.HttpSession;

/**@author james_olney*/
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
                DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
                Date today = Calendar.getInstance().getTime();
                String logDate = df.format(today);
                Comment newComment = new Comment(comment, logDate, user);
                FileCommentHandler handler = new FileCommentHandler("CommentList2.txt");
                handler.addComment(newComment);
                response.sendRedirect("ShowPosts");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
