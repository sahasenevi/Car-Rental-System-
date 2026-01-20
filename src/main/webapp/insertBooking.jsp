<%@ page import="UserController.User, VehicleController.VehicleModel, VehicleController.Vehicle, OfferController.OfferModel, OfferController.Offer, java.util.*" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"user".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }

    String selectedVid = request.getParameter("vid");

    List<Vehicle> vehicles = VehicleModel.getAllVehicles();
    List<Offer> offers = OfferModel.getLatestOffers(50);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book a Vehicle</title>
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
    
    
    
    <script>
		function loadAvailableVehicles() {
		    const start = document.getElementById("start").value;
		    const end = document.getElementById("end").value;
		    if (!start || !end) return;
		
		    const xhr = new XMLHttpRequest();
		    xhr.open("POST", "CheckAvailableVehiclesServlet", true);
		    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		    xhr.onload = function () {
		        document.getElementById("vid").innerHTML = xhr.responseText;
		        calculateTotal(); // re-trigger total
		    };
		    xhr.send("start=" + start + "&end=" + end);
		}
	</script>
    
    
    
</head>
<body>

<h2>Book a Vehicle</h2>

<form action="InsertBookingServlet" method="post">
    <input type="hidden" name="uid" value="<%= user.getUid() %>">

    Vehicle:
    <select name="vid" id="vid" onchange="calculateTotal()" required>
        <option value="">Select</option>
        <% for (Vehicle v : vehicles) { 
            String selected = (selectedVid != null && selectedVid.equals(String.valueOf(v.getVid()))) ? "selected" : "";
        %>
            <option value="<%= v.getVid() %>" <%= selected %>>
                <%= v.getVname() %> (Rs. <%= v.getPrice() %>/day)
            </option>
        <% } %>
    </select><br><br>

    Offer (Optional):
    <select name="oid" id="oid" onchange="calculateTotal()">
        <option value="">None</option>
        <% for (Offer o : offers) { %>
            <option value="<%= o.getOid() %>"><%= o.getTitle() %> - <%= o.getDiscount() %>% off</option>
        <% } %>
    </select><br><br>

    Start Date: <input type="date" name="startDate" id="start" onchange="loadAvailableVehicles()" required><br><br>
	End Date: <input type="date" name="endDate" id="end" onchange="loadAvailableVehicles()" required><br><br>

    Total (Rs.): <input type="text" name="total" id="total" readonly required><br><br>

    <button type="submit">Confirm Booking</button>
</form>

<br><a href="UserDashboard.jsp">← Back to Dashboard</a>

</body>
</html>
