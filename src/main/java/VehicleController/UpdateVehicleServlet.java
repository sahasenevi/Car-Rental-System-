package VehicleController;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/UpdateVehicleServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024)
public class UpdateVehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int vid = Integer.parseInt(request.getParameter("vid"));
        String vbrand = request.getParameter("vbrand");
        String vname = request.getParameter("vname");
        String mdate = request.getParameter("mdate");
        String fuel = request.getParameter("fuel");
        int seatno = Integer.parseInt(request.getParameter("seatno"));
        double price = Double.parseDouble(request.getParameter("price"));

        Part filePart = request.getPart("image");
        String fileName = new File(filePart.getSubmittedFileName()).getName();

        if (!fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);
        } else {
            Vehicle existing = VehicleModel.getVehicleById(vid);
            fileName = existing.getImage(); // keep old image if not updated
        }

        boolean isSuccess = VehicleModel.updateVehicle(vid, vbrand, vname, mdate, fuel, seatno, price, fileName);
        response.sendRedirect("SupplierDashboard.jsp?msg=" + (isSuccess ? "updated" : "fail"));
    }
}
