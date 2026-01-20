package VehicleController;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int vid = Integer.parseInt(request.getParameter("vid"));
        VehicleModel.deleteVehicle(vid);
        response.sendRedirect("SupplierDashboard.jsp?msg=deleted");
    }
}
