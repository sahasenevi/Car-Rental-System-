<%@ page import="UserController.User, VehicleController.VehicleModel, VehicleController.Vehicle, OfferController.OfferModel, OfferController.Offer, BookingController.BookingModel, BookingController.Booking, java.util.*" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"user".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }

    int bid = Integer.parseInt(request.getParameter("bid"));
    Booking booking = BookingModel.getBookingById(bid);

    List<Vehicle> vehicles = VehicleModel.getAllVehicles();
    List<Offer> offers = OfferModel.getLatestOffers(50);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Booking</title>
    <script>
        let prices = {};
        <% for (Vehicle v : vehicles) { %>
            prices[<%= v.getVid() %>] = <%= v.getPrice() %>;
        <% } %>

        let discounts = {};
        <% for (Offer o : offers) { %>
            discounts[<%= o.getOid() %>] = <%= o.getDiscount() %>;
        <% } %>

        function calculateTotal() {
            const vehicleId = document.getElementById("vid").value;
            const offerId = document.getElementById("oid").value;
            const start = new Date(document.getElementById("start").value);
            const end = new Date(document.getElementById("end").value);

            if (!vehicleId || !start || !end || isNaN(start) || isNaN(end)) return;

            const days = (end - start) / (1000 * 3600 * 24);
            if (days <= 0) return;

            let pricePerDay = prices[vehicleId];
            let discount = offerId !== "" ? discounts[offerId] : 0;

            let total = pricePerDay * days;
            let discounted = total - (total * discount / 100);

            document.getElementById("total").value = discounted.toFixed(2);
        }
    </script>
</head>
<body>

<h2>Update Booking</h2>
<form action="UpdateBookingServlet" method="post">
    <input type="hidden" name="bid" value="<%= booking.getBid() %>">

    Vehicle:
    <select name="vid" id="vid" onchange="calculateTotal()" required>
        <option value="">Select</option>
        <% for (Vehicle v : vehicles) { %>
            <option value="<%= v.getVid() %>" <%= (v.getVid() == booking.getVid() ? "selected" : "") %>>
                <%= v.getVname() %> (Rs. <%= v.getPrice() %>/day)
            </option>
        <% } %>
    </select><br><br>

    Offer (Optional):
    <select name="oid" id="oid" onchange="calculateTotal()">
        <option value="">None</option>
        <% for (Offer o : offers) { %>
            <option value="<%= o.getOid() %>" <%= (o.getOid() == booking.getOid() ? "selected" : "") %>>
                <%= o.getTitle() %> - <%= o.getDiscount() %>% off
            </option>
        <% } %>
    </select><br><br>

    Start Date: <input type="date" name="startDate" id="start" value="<%= booking.getStartDate() %>" onchange="calculateTotal()" required><br><br>
    End Date: <input type="date" name="endDate" id="end" value="<%= booking.getEndDate() %>" onchange="calculateTotal()" required><br><br>

    Total (Rs.): <input type="text" name="total" id="total" value="<%= booking.getTotalPrice() %>" readonly><br><br>

    <button type="submit">Update Booking</button>
</form>

<br><a href="UserDashboard.jsp">Back to Dashboard</a>

</body>
</html>
