package AdminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminDeleteServlet")
public class AdminDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String AdminId = request.getParameter("AdminId");
		
		boolean isTrue;
		isTrue= AdminModel.deleteAdmin(AdminId);
		
		if(isTrue == true) {
			
			RequestDispatcher dis=request.getRequestDispatcher("adminInsert.jsp");
			dis.forward(request, response);
		}else {
			
			List<Admin> Admin_Details=AdminModel.getAdminDetails(AdminId);
			request.setAttribute("Admin_Details", Admin_Details);
			
			RequestDispatcher dis=request.getRequestDispatcher("unsuccessful.jsp");
			dis.forward(request, response);
		}
		
		
		
	}

}
