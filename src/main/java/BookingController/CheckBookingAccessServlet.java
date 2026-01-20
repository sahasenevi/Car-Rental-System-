package BookingController;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CheckBookingAccessServlet")
public class CheckBookingAccessServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        Object userObj = (session != null) ? session.getAttribute("user") : null;

        String vid = request.getParameter("vid");

        if (userObj != null) {
            response.sendRedirect("insertBooking.jsp?vid=" + vid);
        } else {
            response.sendRedirect("Login.jsp");
        }
    }
}
