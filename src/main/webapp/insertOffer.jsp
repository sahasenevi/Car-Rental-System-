<%@ page import="UserController.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"staff".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Offer</title>
</head>
<body>
    <h2>Insert Offer</h2>
	<form action="InsertOfferServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="addedBy" value="<%= user.getUsername() %>">
        Title: <input type="text" name="title" required><br>
        Description: <textarea name="description" required></textarea><br>
        Discount (%): <input type="number" name="discount" required><br>
        Valid Until: <input type="date" name="validUntil" required><br>
        Image: <input type="file" name="image"><br>
        <button type="submit">Add Offer</button>
    </form>
</body>
</html>
