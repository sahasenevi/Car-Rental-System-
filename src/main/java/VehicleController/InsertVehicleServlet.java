package VehicleController;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/InsertVehicleServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 5 * 1024 * 1024,    // 5MB
                 maxRequestSize = 10 * 1024 * 1024) // 10MB
public class InsertVehicleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String supplier = request.getParameter("supplier");
        String vbrand = request.getParameter("vbrand");
        String vname = request.getParameter("vname");
        String mdate = request.getParameter("mdate");
        String fuel = request.getParameter("fuel");
        int seatno = Integer.parseInt(request.getParameter("seatno"));
        double price = Double.parseDouble(request.getParameter("price"));

        Part filePart = request.getPart("image");
        String fileName = new File(filePart.getSubmittedFileName()).getName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        if (!fileName.isEmpty()) {
            filePart.write(uploadPath + File.separator + fileName);
        }

        boolean isSuccess = VehicleModel.insertVehicle(supplier, vbrand, vname, mdate, fuel, seatno, price, fileName);
        response.sendRedirect("SupplierDashboard.jsp?msg=" + (isSuccess ? "added" : "fail"));
    }
}
