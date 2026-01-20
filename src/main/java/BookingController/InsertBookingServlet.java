package BookingController;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/InsertBookingServlet")
public class InsertBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        int vid = Integer.parseInt(request.getParameter("vid"));
        String offerStr = request.getParameter("oid");
        int oid = offerStr == null || offerStr.isEmpty() ? 0 : Integer.parseInt(offerStr);
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        double total = Double.parseDouble(request.getParameter("total"));

        boolean success = BookingModel.insertBooking(uid, vid, oid, start, end, total);
        response.sendRedirect("UserDashboard.jsp?msg=" + (success ? "added" : "fail"));
    }
}
