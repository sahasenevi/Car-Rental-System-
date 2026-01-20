<!DOCTYPE html>
<html>
<head>
    <title>Insert User</title>
</head>
<body>
    <h2>Insert New User</h2>
    <form action="UserInsertServlet" method="post">
        Name: <input type="text" name="name" required><br>
        Email: <input type="email" name="email" required><br>
        Phone: <input type="text" name="phone" required><br>
        Address: <input type="text" name="address" required><br>
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        Role:
        <select name="rollno" required>
            <option value="user">User</option>
            <option value="staff">Staff</option>
            <option value="supplier">Supplier</option>
            <option value="admin">Admin</option>
        </select><br>
        <button type="submit">Submit</button>
    </form>
    <a href="AdminDashboard.jsp">Back</a>
</body>
</html>
