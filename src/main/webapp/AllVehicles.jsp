<%@ page import="VehicleController.*, java.util.*" %>
<%
    List<Vehicle> allVehicles = VehicleModel.getAllVehicles();
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Vehicles</title>
</head>
<body>

    <h2>All Available Vehicles</h2>
    <div style="display: flex; flex-wrap: wrap; gap: 20px;">
        <% for (Vehicle v : allVehicles) { %>
            <div style="border: 1px solid #ccc; padding: 10px; width: 250px;">
                <% if (v.getImage() != null && !v.getImage().isEmpty()) { %>
                    <img src="uploads/<%= v.getImage() %>" width="100%" height="160">
                <% } else { %>
                    <div style="width:100%; height:160px; background:#eee;">No Image</div>
                <% } %>
                <h3><%= v.getVname() %></h3>
                <p><strong>Rs.<%= v.getPrice() %>/day</strong></p>
                <a href="Booking.jsp?vid=<%= v.getVid() %>"><button>Book Now</button></a>
                <a href="viewVehicle.jsp?vid=<%= v.getVid() %>"><button>Quick View</button></a>
            </div>
        <% } %>
    </div>

    <br><a href="HomePage.jsp">Back to Home</a>

</body>
</html>
