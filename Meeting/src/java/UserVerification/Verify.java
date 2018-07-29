package UserVerification;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import UserVerification.model.FileUserPassHandler;
import UserVerification.model.User;

/**
 * @author james_olney
 */
@WebServlet(urlPatterns = {"/Verify"})
public class Verify extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Verify</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Verify at " + request.getContextPath() + "</h1>");
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
        String user = request.getParameter("user");
        request.setAttribute("user", user);
        String password = request.getParameter("password");
        request.setAttribute("password", password);

        //User user1 = new User("Admin", "test");
        //FileUserPassHandler handler = new FileUserPassHandler("list.txt");
        if (password.equals("test")) {
            session.setAttribute("user", "Admin");
            request.setAttribute("password", password);
            session.setAttribute("validationMsg", "Welcome " + session.getAttribute("user") + "!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        } else {
            session.setAttribute("validationMsg", "Invalid Password!");
        }
        if (session.getAttribute(user) == "Guest") {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
        if (session.getAttribute(user) == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
