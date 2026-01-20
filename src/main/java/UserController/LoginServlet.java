package UserController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        User user = UserModel.validateUser(username, password);
        
        HttpSession session = request.getSession();
        
        if (user != null) {
            session.setAttribute("user", user);

            // Redirect based on user role
            switch (user.getRollno()) {
                case "admin":
                    response.sendRedirect("AdminDashboard.jsp");
                    break;
                case "staff":
                    response.sendRedirect("StaffDashboard.jsp");
                    break;
                case "supplier":
                    response.sendRedirect("SupplierDashboard.jsp");
                    break;
                case "user":
                    response.sendRedirect("UserDashboard.jsp");
                    break;
                default:
                    response.sendRedirect("Login.jsp"); // fallback
                    break;
            }
        } else {
            response.sendRedirect("Login.jsp?error=InvalidCredentials");
        }
    }
}
