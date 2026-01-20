<%@ page import="UserController.User, OfferController.OfferModel, OfferController.Offer, java.util.*" %>
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("user") : null;
    if (user == null || !"staff".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }
    List<Offer> offers = OfferModel.getOffersByStaff(user.getUsername());
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Dashboard</title>
    <script>
        function confirmDelete(oid) {
            if (confirm("Are you sure to delete this offer?")) {
                window.location.href = "DeleteOfferServlet?oid=" + oid;
            }
        }
    </script>
</head>
<body>
    <h1>Welcome <%= user.getName() %> (Staff)</h1>

    <% if ("added".equals(msg)) { %>
        <script>alert('Offer added successfully!');</script>
    <% } else if ("updated".equals(msg)) { %>
        <script>alert('Offer updated successfully!');</script>
    <% } else if ("deleted".equals(msg)) { %>
        <script>alert('Offer deleted successfully!');</script>
    <% } else if ("fail".equals(msg)) { %>
        <script>alert('Operation failed!');</script>
    <% } %>

    <a href="insertOffer.jsp">Add New Offer</a> |
    <a href="LogoutServlet">Logout</a>

    <h2>Your Offers</h2>
    <table border="1">
        <tr><th>Title</th><th>Discount</th><th>Valid Until</th><th>Actions</th></tr>
        <% for (Offer o : offers) { %>
        <tr>
            <td><%= o.getTitle() %></td>
            <td><%= o.getDiscount() %>%</td>
            <td><%= o.getValidUntil() %></td>
            <td>
                <a href="viewOffer.jsp?oid=<%= o.getOid() %>">View</a> |
                <a href="updateOffer.jsp?oid=<%= o.getOid() %>">Update</a> |
                <a href="#" onclick="confirmDelete(<%= o.getOid() %>)">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
