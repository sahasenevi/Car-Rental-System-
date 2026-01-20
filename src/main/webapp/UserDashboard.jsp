<%@ page import="UserController.User, BookingController.BookingModel, BookingController.Booking, java.util.*" %>
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("user") : null;
    if (user == null || !"user".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }

    List<Booking> bookings = BookingModel.getBookingsByUser(user.getUid());
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <script>
        function confirmDelete(bid) {
            if (confirm("Do you want to delete this booking?")) {
                window.location.href = "DeleteBookingServlet?bid=" + bid;
            }
        }
    </script>
</head>
<body>

<h1>Welcome <%= user.getName() %> (User)</h1>

<% if ("added".equals(msg)) { %>
    <script>alert('Booking added successfully!');</script>
<% } else if ("updated".equals(msg)) { %>
    <script>alert('Booking updated successfully!');</script>
<% } else if ("deleted".equals(msg)) { %>
    <script>alert('Booking deleted successfully!');</script>
<% } else if ("fail".equals(msg)) { %>
    <script>alert('Operation failed!');</script>
<% } %>

<a href="insertBooking.jsp">Add New Booking</a> |
<a href="LogoutServlet">Logout</a>

<h2>Your Bookings</h2>
<table border="1">
    <tr><th>Start</th><th>End</th><th>Total</th><th>Actions</th></tr>
    <% for (Booking b : bookings) { %>
    <tr>
        <td><%= b.getStartDate() %></td>
        <td><%= b.getEndDate() %></td>
        <td>Rs. <%= b.getTotalPrice() %></td>
        <td>
            <a href="viewBooking.jsp?bid=<%= b.getBid() %>">View</a> |
            <a href="updateBooking.jsp?bid=<%= b.getBid() %>">Update</a> |
            <a href="#" onclick="confirmDelete(<%= b.getBid() %>)">Delete</a>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
