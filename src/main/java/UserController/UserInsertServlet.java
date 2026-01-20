package UserController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UserInsertServlet")
public class UserInsertServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rollno = request.getParameter("rollno");

        UserModel.insertUser(name, email, phone, address, username, password, rollno);

        response.sendRedirect("AdminDashboard.jsp");
    }
}
