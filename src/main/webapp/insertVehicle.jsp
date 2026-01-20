<%@ page import="UserController.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"supplier".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Vehicle</title>
</head>
<body>
    <h2>Add New Vehicle</h2>
    <form action="InsertVehicleServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="supplier" value="<%= user.getUsername() %>">
        Brand: <input type="text" name="vbrand" required><br>
        Name: <input type="text" name="vname" required><br>
        Manufacture Date: <input type="date" name="mdate" required><br>
        Fuel: <input type="text" name="fuel" required><br>
        Seats: <input type="number" name="seatno" required><br>
        Price: <input type="number" step="0.01" name="price" required><br>
        Image: <input type="file" name="image"><br><br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
