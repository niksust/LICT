
<%@ include file = "Topper.jsp"%>
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
	<hr/>
	<br>
	<% 
		out.println("Reg No : " + session.getAttribute("user_reg"));
	%>
	<br>
	<br><br><br><br>
	<form action="AddData" method="post">  
		<h1>Contact Information</h1>
			User Number:<input type="number" name="user_mobile"/><br/><br/>  
			User Email:<input type="email" name="user_email"/><br/><br/>  
			User Address:<input type="text" name="user_address"/><br/><br/> 
		<h1>Project</h1>
			Project Name :<input type="text" name="project_name"/><br/><br/>  
		  	Project Detail:<input type="text" name="project_details"/><br/><br/> 
			Project Technologies :<input type="text" name="project_technology"/><br/><br/>
			Project git Link :<input type="text" name="project_git_link"/><br/><br/>
			
		<h1>Field of Interest</h1>
			Interest items:<input type="text" name="interest_field"/><br/><br/>  
		<h1>Skills</h1>
			Skill :<input type="text" name="skill_field"/><br/><br/>  
		
		<h1>Co-curricular Activities</h1> 
			CoCurricular Name :<input type="text" name="CoCurricularParticipation"/><br/><br/>
			Achievement :<input type="text" name="CoCurricular_Achievement"/><br/><br/>
		  	Sports :<input type="text" name="CoCurricular_Sports"/><br/><br/>
			Cultural :<input type="text" name="CoCurricular_Cultural"/><br/><br/>
			Organizations :<input type="text" name="CoCurricular_Organizational"/><br/><br/>
			
		
		<input type="submit" value="Add"/>  
	</form>
</body>
</html>

<%@ include file = "Footer.jsp"%>