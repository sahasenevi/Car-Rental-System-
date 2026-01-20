<%@ page import="BookingController.BookingModel, BookingController.Booking" %>
<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    Booking b = BookingModel.getBookingById(bid);
%>
<!DOCTYPE html>
<html>
<head><title>View Booking</title></head>
<body>

<h2>Booking Details</h2>
<p><strong>Booking ID:</strong> <%= b.getBid() %></p>
<p><strong>Vehicle ID:</strong> <%= b.getVid() %></p>
<p><strong>Offer ID:</strong> <%= b.getOid() %></p>
<p><strong>Start Date:</strong> <%= b.getStartDate() %></p>
<p><strong>End Date:</strong> <%= b.getEndDate() %></p>
<p><strong>Total Price:</strong> Rs. <%= b.getTotalPrice() %></p>

<br><a href="UserDashboard.jsp">← Back</a>

</body>
</html>
