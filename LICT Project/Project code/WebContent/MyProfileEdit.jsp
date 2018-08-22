<%@page import = "jsp.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file = "Topper.jsp"%>
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
	<a href= UserIndex.jsp> Home</a><br><br>
	<a href=MyProfileShow.jsp> My Profile</a><br>
	<br>
	<br>
	
	<%-- Update Starts --%>
	
	<form action="UpdateData" method="post">
	<%
	
	Connection c = MySQL.connect();
	int user_reg_int = (Integer)session.getAttribute("user_reg");
	String user_reg = Integer.toString(user_reg_int);
	System.out.println(user_reg);
	String imageDir="Img/"+user_reg+".jpg";
	System.out.println(imageDir);
	
	%>
	
	
	<%
		Statement statement = c.createStatement();
		String SkillQuery = "SELECT  * FROM account where user_reg="+ user_reg + ";";
		ResultSet rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			
			String user_name =rs.getString("user_name");
			String user_primary_email=rs.getString("Email_id");
			//out.println("<h1>"+user_name +"</h1><br>");
			//out.println("<h3>Primary Email : "+user_primary_email+"</h3><br>");
			}
		rs.close();
		
		
	%>
	
	<%-- --%>
	<h1> Contact Information</h1><br><br>
	<%
		
		SkillQuery = "SELECT  * FROM contact where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String user_mobile =rs.getString("user_mobile");
			String user_email=rs.getString("user_email");
			String user_address=rs.getString("user_address");
			out.println("User Number:<input type=number name=\"user_mobile\" value="+ user_mobile+">  <br>");
			out.println("User Email:<input type=email name=\"user_email\" value= "+user_email+"><br>");
			out.println("User Address:<input type=text name=\"user_address\" value="+user_address+"><br>");
		}
		rs.close();
		
		
	%>
	<%-- Contact edit or deletation button will be added --%>
	<%--Contact Update done --%>
	
	
	<h1> Projects</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM project where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String project_name =rs.getString("project_name");
			String project_details=rs.getString("project_details");
			String project_technology=rs.getString("project_technology");
			String project_git_link =rs.getString("project_git_link");
			
			out.println("Project Name :<input type=\"text\" name=\"project_name\" value= "+project_name+"><br>");
			out.println("Project Details:<input type=\"text\" name=\"project_details\" value =" +project_details+"><br>");
			
			//Testing 
			System.out.println("here projtct details is "+project_details);
			
			out.println("Project Technologies :<input type=\"text\" name=\"project_technology\" value= "+project_technology+"><br>");
			out.println("Project git Link :<input type=\"text\" name=\"project_git_link\" value= "+project_git_link+"><br>");
			out.println("<input type= \"submit\" value=\"Update\"/>");
			out.println("<input type= \"submit\" value=\"Delete\"/>");
		}
		rs.close();
		
		
	%>
	<%-- Project edit or deletation button will be added --%>
	<h1> Field of Interest</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM field_of_interest where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String interest_field =rs.getString("interest_field");
			out.println("Interest items:<input type=\"text\" name=\"interest_field\" value= "+interest_field+"><br>");
			}
		rs.close();
		
		
	%>
	<%-- Field of interest edit or deletation button will be added --%>
	<h1> Skills</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM skills where user_reg="+ user_reg + ";";
		rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String skill_field =rs.getString("skill_field");
			out.println("Skill :<input type=\"text\" name=\"skill_field\" value= "+skill_field+"><br>");
			}
		rs.close();
		
		
	%>
	<%--Skill edit or deletation button will be added --%>
	<h1> Co-Curricular Participation</h1><br>
	<%
		
		SkillQuery = "SELECT  * FROM cocurricular_participation where user_reg="+ user_reg + ";";
		 rs = statement.executeQuery(SkillQuery);
		while(rs.next()){
			String CoCurricularParticipation =rs.getString("CoCurricularParticipation");
			String CoCurricular_achievement=rs.getString("CoCurricular_achievement");
			String CoCurricular_Sports=rs.getString("CoCurricular_Sports");
			String CoCurricular_Cultural=rs.getString("CoCurricular_Cultural");
			String CoCurricular_Organizational=rs.getString("CoCurricular_Organizational");
			out.println("CoCurricular Name :<input type=\"text\" name=\"CoCurricularParticipation\"value= "+CoCurricularParticipation+"><br>");
			out.println("Achievement :<input type=\"text\" name=\"CoCurricular_Achievement\" value="+CoCurricular_achievement+"><br>");
			out.println("Sports :<input type=\"text\" name=\"CoCurricular_Sports\" value= "+CoCurricular_Sports+"><br>");
			out.println("Cultural :<input type=\"text\" name=\"CoCurricular_Cultural\" value= "+CoCurricular_Cultural+"><br>");
			out.println("Organizations :<input type=\"text\" name=\"CoCurricular_Organizational\" value= "+CoCurricular_Organizational+"><br>");
			
		}
		rs.close();
		
		
	%>
	<%--Co Curricular Participation edit or deletation button will be added --%>
	<% 
		MySQL.close(c);
	%>
	<input type= "submit" value="Update"/>
	</form>
</body>
</html>
<%@ include file = "Footer.jsp"%>