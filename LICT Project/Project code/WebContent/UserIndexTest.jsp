<%@page import = "jsp.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	//this code is for secure login
	//secure login starts
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //for new version of HTTP protocol HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // for past versions of HTTP protocol HTTP 1.0
	response.setHeader("Expires", "0"); //deletes proxy servers
	//secure login ends
	//this code is for session tracking
	//session tracking starts
		if(session.getAttribute("user_reg")==null){
			response.sendRedirect("index.jsp");	
		}
	// session tracking ends
	%>
	<a href= Home.jsp> Home</a><br><br>
	<a href= SearchStudent.jsp> Search Student</a><br><br>
	<a href= Departments.jsp> Departments</a><br><br>
	<a href= MyProfileShow.jsp> MyProfile</a><br><br>
	<br>
	<br>
	<form action= "LoggingOut" method= "Post">
		<input type="submit" value="Logout">
	</form>
	
</body>
</html>



