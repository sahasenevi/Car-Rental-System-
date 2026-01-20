package BookingController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bid = Integer.parseInt(request.getParameter("bid"));
        int vid = Integer.parseInt(request.getParameter("vid"));
        String offerStr = request.getParameter("oid");
        int oid = offerStr == null || offerStr.isEmpty() ? 0 : Integer.parseInt(offerStr);
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        double total = Double.parseDouble(request.getParameter("total"));

        boolean success = BookingModel.updateBooking(bid, vid, oid, start, end, total);
        response.sendRedirect("UserDashboard.jsp?msg=" + (success ? "updated" : "fail"));
    }
}
