<%@ page import="VehicleController.*, UserController.*" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"supplier".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }

    int vid = Integer.parseInt(request.getParameter("vid"));
    Vehicle v = VehicleModel.getVehicleById(vid);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Vehicle</title>
</head>
<body>
    <h2>Update Vehicle</h2>
    <form action="UpdateVehicleServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="vid" value="<%= v.getVid() %>">
        Brand: <input type="text" name="vbrand" value="<%= v.getVbrand() %>" required><br>
        Name: <input type="text" name="vname" value="<%= v.getVname() %>" required><br>
        Manufacture Date: <input type="date" name="mdate" value="<%= v.getMdate() %>" required><br>
        Fuel: <input type="text" name="fuel" value="<%= v.getFuel() %>" required><br>
        Seats: <input type="number" name="seatno" value="<%= v.getSeatno() %>" required><br>
        Price: <input type="number" step="0.01" name="price" value="<%= v.getPrice() %>" required><br>
        Existing Image:
        <% if (v.getImage() != null && !v.getImage().isEmpty()) { %>
            <img src="uploads/<%= v.getImage() %>" width="100"><br>
        <% } %>
        Upload New Image: <input type="file" name="image"><br><br>
        <button type="submit">Update</button>
    </form>
</body>
</html>
