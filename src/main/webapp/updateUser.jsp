<%@page import="UserController.*"%>
<%
    int uid = Integer.parseInt(request.getParameter("uid"));
    User u = UserModel.getUserById(uid);
%>


<!DOCTYPE html>
<html>
<head>
    <title>Update User</title>
</head>
<body>
    <h2>Update User Details</h2>
    <form action="UserUpdateServlet" method="post">
        <input type="hidden" name="uid" value="<%=u.getUid()%>">
        Name: <input type="text" name="name" value="<%=u.getName()%>" required><br>
        Email: <input type="email" name="email" value="<%=u.getEmail()%>" required><br>
        Phone: <input type="text" name="phone" value="<%=u.getPhone()%>" required><br>
        Address: <input type="text" name="address" value="<%=u.getAddress()%>" required><br>
        Username: <input type="text" name="username" value="<%=u.getUsername()%>" required><br>
        Password: <input type="password" name="password" value="<%=u.getPassword()%>" required><br>
        Role:
        <select name="rollno">
            <option value="user" <%=u.getRollno().equals("user")?"selected":""%>>User</option>
            <option value="staff" <%=u.getRollno().equals("staff")?"selected":""%>>Staff</option>
            <option value="supplier" <%=u.getRollno().equals("supplier")?"selected":""%>>Supplier</option>
            <option value="admin" <%=u.getRollno().equals("admin")?"selected":""%>>Admin</option>

			            
        </select><br>
        <button type="submit">Update</button>
    </form>
    <a href="AdminDashboard.jsp">Back</a>
</body>
</html>
