<%@ page import="OfferController.*" %>
<%
    int oid = Integer.parseInt(request.getParameter("oid"));
    Offer o = OfferModel.getOfferById(oid);
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Offer</title>
</head>
<body>
    <h2>Offer Details</h2>

    <p><strong>Title:</strong> <%= o.getTitle() %></p>
    <p><strong>Description:</strong> <%= o.getDescription() %></p>
    <p><strong>Discount:</strong> <%= o.getDiscount() %>%</p>
    <p><strong>Valid Until:</strong> <%= o.getValidUntil() %></p>

    <% if (o.getImage() != null && !o.getImage().isEmpty()) { %>
        <p><strong>Image:</strong><br>
        <img src="uploads/offer/<%= o.getImage() %>" width="300"></p>
    <% } else { %>
        <p><em>No image uploaded for this offer.</em></p>
    <% } %>

    <br><a href="StaffDashboard.jsp">← Back to Dashboard</a>
</body>
</html>
