<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete account</title>
</head>
<body>
	
	<%
		String	id= request.getParameter("id");
		String	name= request.getParameter("name");
		String	email= request.getParameter("email");
		String	phone= request.getParameter("phone");
		String	address= request.getParameter("address");
		String	username= request.getParameter("username");
		
			
	%>
		
		<h2 class="text-2xl font-bold text-center text-red-600 mb-6">Delete Account</h2>
        <p class="text-center text-gray-600 mb-4">Are you sure you want to delete your account? This action cannot be undone.</p>
	
	<form action="UserDeleteServlet" method ="post">
	
		Customer ID :<input type="text" name ="cusid" value="<%=id%>" readonly><br>
		Name: <input type="text" name ="name" value="<%=name%>"readonly><br>
		Email :<input type="text" name ="email" value="<%=email%>"readonly><br>
		Phone No :<input type="text" name ="phone" value="<%=phone%>"readonly><br>
		Address :<input type="text" name ="address" value="<%=address%>"readonly><br>
		User Name :<input type="text" name ="username" value="<%=username%>"readonly><br>
		
		
		
		<input type="submit" name ="submit" value="Delete my account"><br>
		
	
	
	</form>



</body>
</html>