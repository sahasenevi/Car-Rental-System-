package OfferController;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteOfferServlet")
public class DeleteOfferServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int oid = Integer.parseInt(request.getParameter("oid"));
        boolean success = OfferModel.deleteOffer(oid);
        response.sendRedirect("StaffDashboard.jsp?msg=" + (success ? "deleted" : "fail"));
    }
}
