<%@ page import="UserController.*" %>
<%
    int uid = Integer.parseInt(request.getParameter("uid"));
    User u = UserModel.getUserById(uid);
%>
<!DOCTYPE html>
<html>
<head>
    <title>View User</title>
</head>
<body>
    <h2>User Full Details</h2>

    <p><strong>User ID:</strong> <%= u.getUid() %></p>
    <p><strong>Name:</strong> <%= u.getName() %></p>
    <p><strong>Email:</strong> <%= u.getEmail() %></p>
    <p><strong>Phone:</strong> <%= u.getPhone() %></p>
    <p><strong>Address:</strong> <%= u.getAddress() %></p>
    <p><strong>Username:</strong> <%= u.getUsername() %></p>
    <p><strong>Password:</strong> <%= u.getPassword() %></p>
    <p><strong>Role:</strong> <%= u.getRollno() %></p>

    <br>
    <a href="AdminDashboard.jsp">Back to Dashboard</a>
</body>
</html>
