package BookingController;

import VehicleController.VehicleModel;
import VehicleController.Vehicle;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/CheckAvailableVehiclesServlet")
public class CheckAvailableVehiclesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String start = request.getParameter("start");
        String end = request.getParameter("end");

        List<Integer> unavailable = BookingModel.getUnavailableVehicleIds(start, end);
        List<Vehicle> all = VehicleModel.getAllVehicles();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<option value=''>Select</option>");

        for (Vehicle v : all) {
            if (!unavailable.contains(v.getVid())) {
                out.println("<option value='" + v.getVid() + "'>" + v.getVname() + " (Rs. " + v.getPrice() + "/day)</option>");
            }
        }
    }
}
