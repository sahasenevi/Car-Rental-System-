<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="UserController.*, java.util.*" %>
<%
    session = request.getSession(false);
    User user = (session != null) ? (User) session.getAttribute("user") : null;
    if(user == null || !"admin".equals(user.getRollno())) {
        response.sendRedirect("Login.jsp");
    }
    List<User> userList = UserModel.getUsersByRoles(Arrays.asList("user"));
    List<User> staffList = UserModel.getUsersByRoles(Arrays.asList("staff", "supplier", "admin"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <script>
        function confirmDelete(uid){
            if(confirm("Are you sure you want to delete this user?")){
                window.location.href="UserDeleteServlet?uid="+uid;
            }
        }
    </script>
</head>
<body>
    <h1>Admin Dashboard</h1>
    <p>Welcome, <%=user.getName()%></p>
    <a href="insertUser.jsp"><button>Insert New User</button></a> | 
    <a href="LogoutServlet">Logout</a>

    <h2>Users</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Actions</th>
        </tr>
        <% for(User u : userList) { %>
        <tr>
            <td><%= u.getUid() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRollno() %></td>
            <td>
            	<a href="viewUser.jsp?uid=<%= u.getUid() %>">View</a> |
                <a href="updateUser.jsp?uid=<%= u.getUid() %>">Update</a> |
                <a href="#" onclick="confirmDelete(<%= u.getUid() %>)">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>

    <h2>Staff / Suppliers / Admins</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Actions</th>
        </tr>
        <% for(User u : staffList) { %>
        <tr>
            <td><%= u.getUid() %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getRollno() %></td>
            <td>
            	<a href="viewUser.jsp?uid=<%= u.getUid() %>">View</a> |
                <a href="updateUser.jsp?uid=<%= u.getUid() %>">Update</a> |
                <a href="#" onclick="confirmDelete(<%= u.getUid() %>)">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
