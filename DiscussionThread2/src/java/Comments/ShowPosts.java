package Comments;

import Comments.model.FileCommentHandler;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* @author james_olney */
@WebServlet(name = "ShowPosts", urlPatterns = {"/ShowPosts"})
public class ShowPosts extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShowPosts</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShowPosts at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            FileCommentHandler handler = new FileCommentHandler("CommentList.txt");
            request.setAttribute("comments", handler.getComments());
            request.getRequestDispatcher("ViewPosts.jsp").forward(request,response);
    }
}
