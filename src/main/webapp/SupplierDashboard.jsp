<%@ page import="VehicleController.*, UserController.*, java.util.*" %>
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("user") : null;
    if (user == null || !"supplier".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }
    List<Vehicle> vehicleList = VehicleModel.getVehiclesBySupplier(user.getUsername());
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Supplier Dashboard</title>
</head>
<body>
    <h1>Welcome, <%= user.getName() %> (Supplier)</h1>

		<% if ("added".equals(msg)) { %>
		    <script>alert('Vehicle added successfully!');</script>
		<% } else if ("updated".equals(msg)) { %>
		    <script>alert('Vehicle updated successfully!');</script>
		<% } else if ("deleted".equals(msg)) { %>
		    <script>alert('Vehicle deleted successfully!');</script>
		<% } else if ("fail".equals(msg)) { %>
		    <script>alert('Operation failed!');</script>
		<% } %>


    <a href="insertVehicle.jsp">Add New Vehicle</a> |
    <a href="LogoutServlet">Logout</a>

    <h2>Your Vehicles</h2>
    <table border="1">
        <tr>
            <th>Brand</th><th>Name</th><th>Fuel</th><th>Seats</th><th>Price</th><th>Image</th><th>Actions</th>
        </tr>
        <% for (Vehicle v : vehicleList) { %>
        <tr>
            <td><%= v.getVbrand() %></td>
            <td><%= v.getVname() %></td>
            <td><%= v.getFuel() %></td>
            <td><%= v.getSeatno() %></td>
            <td><%= v.getPrice() %></td>
            <td>
                <% if (v.getImage() != null && !v.getImage().isEmpty()) { %>
                    <img src="uploads/<%= v.getImage() %>" width="100">
                <% } else { %>
                    No Image
                <% } %>
            </td>
            <td>
                <a href="viewVehicle.jsp?vid=<%= v.getVid() %>">View</a> |
                <a href="updateVehicle.jsp?vid=<%= v.getVid() %>">Update</a> |
                <a href="DeleteVehicleServlet?vid=<%= v.getVid() %>" onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
