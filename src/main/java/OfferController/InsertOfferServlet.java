package OfferController;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/InsertOfferServlet")
@MultipartConfig
public class InsertOfferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String validUntil = request.getParameter("validUntil");
        String addedBy = request.getParameter("addedBy");

        Part filePart = request.getPart("image");
        String fileName = new File(filePart.getSubmittedFileName()).getName();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads/offer";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        if (!fileName.isEmpty()) {
            filePart.write(uploadPath + File.separator + fileName);
        }

        boolean success = OfferModel.insertOffer(title, description, discount, validUntil, addedBy, fileName);
        response.sendRedirect("StaffDashboard.jsp?msg=" + (success ? "added" : "fail"));
    }
}
