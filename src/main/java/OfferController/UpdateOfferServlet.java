package OfferController;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/UpdateOfferServlet")
@MultipartConfig
public class UpdateOfferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int oid = Integer.parseInt(request.getParameter("oid"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String validUntil = request.getParameter("validUntil");

        Part filePart = request.getPart("image");
        String fileName = new File(filePart.getSubmittedFileName()).getName();

        if (!fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads/offer";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            filePart.write(uploadPath + File.separator + fileName);
        } else {
            Offer existing = OfferModel.getOfferById(oid);
            fileName = existing.getImage(); // retain old image
        }

        boolean success = OfferModel.updateOffer(oid, title, description, discount, validUntil, fileName);
        response.sendRedirect("StaffDashboard.jsp?msg=" + (success ? "updated" : "fail"));
    }
}
