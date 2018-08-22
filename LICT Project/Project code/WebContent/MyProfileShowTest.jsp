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
	else {
		int user_reg = (Integer) session.getAttribute("user_reg");
		System.out.println(user_reg);
		
		
	}
	%>
	<a href= Home.jsp> Home</a><br><br>
	<a href= SearchStudent.jsp> Search Student</a><br><br>
	<a href= Departments.jsp> Departments</a><br><br>
	<a href= MyProfile.jsp> Add Data</a>
	<a href= MyProfileEdit.jsp> Edit</a><br><br>
	<br>
	<br>
	<form action= "LoggingOut" method= "Post">
		<input type="submit" value="Logout">
	</form>
	<%
	
	Connection c = MySQL.connect();
	int user_reg_int = (Integer)session.getAttribute("user_reg");
	String user_reg = Integer.toString(user_reg_int);
	System.out.println(user_reg);
	String imageDir="D:/Study/4-1/Web Engineering Lab/WebContent/Img/"+user_reg+".jpg";
	System.out.println(imageDir);
	
	String ProjectQuery = "";
	String ContactQuery = "";
	String FieldOfInterestQuery = "";
	String CoCurriculamQuery = "";
	%>
	<img src="<%=imageDir %>"  width="128" height="128">
	
	<%
		Statement statement = c.createStatement();
		String SkillQuery = "SELECT  * FROM account where user_reg="+ user_reg + ";";
		ResultSet rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			
			String user_name =rs.getString("user_name");
			String user_primary_email=rs.getString("Email_id");
			out.println("<h1>"+user_name +"</h1><br>");
			out.println("<h3>Primary Email : "+user_primary_email+"</h3><br>");
			}
		rs.close();
		
		
	%>
	<h1> Contact Information</h1><br><br>
	<%
		
		SkillQuery = "SELECT  * FROM contact where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String user_mobile =rs.getString("user_mobile");
			String user_email=rs.getString("user_email");
			String user_address=rs.getString("user_address");
			out.println("<h3>Contact No : "+user_mobile+"</h3><br>");
			out.println("<h3>Email : "+user_email+"</h3><br>");
			out.println("<h3>Contact Address : "+user_address+"</h3><br>");
		}
		rs.close();
		
		
	%>
	<h1> Projects</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM project where user_reg = "+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String project_name =rs.getString("project_name");
			String project_details =rs.getString("project_details");
			String project_technology=rs.getString("project_technology");
			String project_git_link =rs.getString("project_git_link");
			
			//Testing
			System.out.println("MyProfileShow.jsp project query test");
			
			out.println("<h3>Name of the Project : "+project_name+"</h3><br>");
			out.println("<h3>Details : "+project_details+"</h3><br>");
			out.println("<h3>Project Technologies : "+project_technology+"</h3><br>");
			out.println("<h3>Git Link : "+project_git_link+"</h3><br>");
		}
		rs.close();
		
		
	%>
	<h1> Field of Interest</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM field_of_interest where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String interest_field =rs.getString("interest_field");
			out.println("<h3>Interest : "+interest_field+"</h3><br>");
			}
		rs.close();
		
		
	%>
	<h1> Skills</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM skills where user_reg="+ user_reg + ";";
		rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String skill_field =rs.getString("skill_field");
			out.println("<h3>Skills : "+skill_field+"</h3><br>");
			}
		rs.close();
		
		
	%>
	<h1> Co-Curricular Participation</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM cocurricular_participation where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		 String CoCurricularParticipation=null;
		 String CoCurricular_achievement=null;
		 String CoCurricular_Sports =null;
		 String CoCurricular_Cultural=null;
		 String CoCurricular_Organizational=null;
		while(rs.next()){
			CoCurricularParticipation =rs.getString("CoCurricularParticipation");
			CoCurricular_achievement=rs.getString("CoCurricular_achievement");
			CoCurricular_Sports=rs.getString("CoCurricular_Sports");
			CoCurricular_Cultural=rs.getString("CoCurricular_Cultural");
			CoCurricular_Organizational=rs.getString("CoCurricular_Organizational");
			out.println("<h3>CoCurricular Name : "+CoCurricularParticipation+"</h3><br>");
			out.println("<h3>Achievement : "+CoCurricular_achievement+"</h3><br>");
			out.println("<h3>Sports : "+CoCurricular_Sports+"</h3><br>");
			out.println("<h3>Cultural : "+CoCurricular_Cultural+"</h3><br>");
			out.println("<h3>Organizations : "+CoCurricular_Organizational+"</h3><br>");
			
		}
		rs.close();
		
		
	%>
	<% 
		MySQL.close(c);
	%>
</body>
</html>