<%@ page import="OfferController.*" %>
<%
    int oid = Integer.parseInt(request.getParameter("oid"));
    Offer o = OfferModel.getOfferById(oid);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Offer</title>
</head>
<body>
    <h2>Update Offer</h2>
    <form action="UpdateOfferServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="oid" value="<%= o.getOid() %>">

        Title: <input type="text" name="title" value="<%= o.getTitle() %>" required><br><br>
        Description:<br>
        <textarea name="description" required><%= o.getDescription() %></textarea><br><br>
        Discount (%): <input type="number" name="discount" value="<%= o.getDiscount() %>" required><br><br>
        Valid Until: <input type="date" name="validUntil" value="<%= o.getValidUntil() %>" required><br><br>

        <% if (o.getImage() != null && !o.getImage().isEmpty()) { %>
            <p>Existing Image:<br>
            <img src="uploads/offer/<%= o.getImage() %>" width="200"></p>
        <% } %>

        Upload New Image: <input type="file" name="image"><br><br>

        <button type="submit">Update Offer</button>
    </form>

    <br><a href="StaffDashboard.jsp">← Back to Dashboard</a>
</body>
</html>
