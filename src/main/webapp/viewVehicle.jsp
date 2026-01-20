<%@ page import="VehicleController.*" %>
<%
    int vid = Integer.parseInt(request.getParameter("vid"));
    Vehicle v = VehicleModel.getVehicleById(vid);
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Vehicle</title>
</head>
<body>
    <h2>Vehicle Details</h2>
    <p><strong>Brand:</strong> <%= v.getVbrand() %></p>
    <p><strong>Name:</strong> <%= v.getVname() %></p>
    <p><strong>Fuel:</strong> <%= v.getFuel() %></p>
    <p><strong>Seats:</strong> <%= v.getSeatno() %></p>
    <p><strong>Price:</strong> <%= v.getPrice() %></p>
    <p><strong>Manufacture Date:</strong> <%= v.getMdate() %></p>
    <p><strong>Supplier:</strong> <%= v.getSupplier() %></p>
    <p><strong>Image:</strong><br>
        <% if (v.getImage() != null && !v.getImage().isEmpty()) { %>
            <img src="uploads/<%= v.getImage() %>" width="300">
        <% } else { %>
            No Image
        <% } %>
    </p>
    <br><a href="SupplierDashboard.jsp">Back</a>
</body>
</html>
