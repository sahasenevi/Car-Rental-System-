package BookingController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int bid = Integer.parseInt(request.getParameter("bid"));
        boolean success = BookingModel.deleteBooking(bid);
        response.sendRedirect("UserDashboard.jsp?msg=" + (success ? "deleted" : "fail"));
    }
}
