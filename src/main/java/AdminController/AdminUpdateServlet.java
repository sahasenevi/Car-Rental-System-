package AdminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminUpdateServlet")
public class AdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("AdminId");
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String userName= request.getParameter("uname");
		String password= request.getParameter("pass");
		
		
		boolean isTrue;
		isTrue=AdminModel.updateAdmin(id, name, email, phone, userName, password);
		
		if(isTrue==true) {
			List<Admin> Admin_Details=AdminModel.getAdminDetails(id);
			request.setAttribute("Admin_Details", Admin_Details);
			
			RequestDispatcher dis=request.getRequestDispatcher("adminProfile.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis2=request.getRequestDispatcher("unsuccessful.jsp");
			dis2.forward(request, response);
		}
		
		
	}

}
