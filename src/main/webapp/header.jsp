<%@ page session="true" %>
<link rel="stylesheet" href="css/style.css">

<header>
  <div class="header-content">
    <!-- Logo + Brand -->
    <a href="HomePage.jsp" class="header-logo">
      <img src="Logo.jpg" alt="Rentora Logo">
      Rentora
    </a>

    <!-- Navigation -->
    <nav>
      <a href="HomePage.jsp">Home</a>
      <a href="AllVehicles.jsp">Vehicles</a>
      <a href="AllOffers.jsp">Offers</a>
      <a href="aboutUs.jsp">About</a>
      <a href="contact.jsp">Contact</a>
      <%
        Object user = session.getAttribute("user");
        if (user != null) {
      %>
        <a href="LogoutServlet">Logout</a>
      <% } else { %>
        <a href="Login.jsp">Login</a>
      <% } %>
    </nav>
  </div>
</header>
