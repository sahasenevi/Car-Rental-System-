<%@ page import="OfferController.*, java.util.*" %>
<%
    List<Offer> allOffers = OfferModel.getLatestOffers(100); // Show many
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Offers</title>
</head>
<body>

    <h2>All Offers</h2>
    <div style="display: flex; flex-wrap: wrap; gap: 20px;">
        <% for (Offer o : allOffers) { %>
            <div style="border: 1px solid #ccc; padding: 10px; width: 300px; border-radius: 10px;">
                <% if (o.getImage() != null && !o.getImage().isEmpty()) { %>
                    <img src="uploads/offer/<%= o.getImage() %>" width="100%" height="160">
                <% } else { %>
                    <div style="width:100%; height:160px; background:#eee;">No Image</div>
                <% } %>
                <h3><%= o.getTitle() %></h3>
                <p><%= o.getDescription() %></p>
                <p><strong>Discount:</strong> <%= o.getDiscount() %>%</p>
                <p><strong>Valid Until:</strong> <%= o.getValidUntil() %></p>
            </div>
        <% } %>
    </div>

    <br><a href="HomePage.jsp">Back to Home</a>
</body>
</html>
