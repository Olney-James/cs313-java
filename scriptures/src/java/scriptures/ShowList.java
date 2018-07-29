package scriptures; 

import java.io.IOException;  
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import scriptures.model.ScriptureDataHandler;
import scriptures.model.FileScriptureHandler;

@WebServlet("/ShowList") 
public class ShowList extends HttpServlet { 
       private static final long serialVersionUID = 1L;

   public ShowList() { 
       super();
   }
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          ScriptureDataHandler handler = new FileScriptureHandler("list.txt");
          request.setAttribute("scriptures", handler.getFavoriteScriptures());
          request.getRequestDispatcher("scriptureList.jsp").forward(request,response);
     }

}