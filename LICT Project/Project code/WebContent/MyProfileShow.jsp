<%@page import = "jsp.*, java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SUST Student Profile</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700,900' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Superfish -->
	<link rel="stylesheet" href="css/superfish.css">

	<link rel="stylesheet" href="css/style.css">


	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

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
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		<div id="fh5co-header">
			<header id="fh5co-header-section">
				<div class="fh5co-cover" >
					<div class="nav-header">
						<h1 id="fh5co-logo" ><a href="UserIndex.jsp">SUST <span>Student Profile</span></a></h1>
						<nav id="fh5co-menu-wrap" role="navigation" >
							<ul class="sf-menu" id="fh5co-primary-menu">
								<li >
									<a href="UserIndex.jsp">Home</a>
								</li>
								<li>
									<a href= SearchStudent.jsp> Search Student</a>
								</li>
								<li>
									<a href= AddData.jsp> Add Data</a>
								</li>
								<li>
									<a href= MyProfileEdit.jsp> Edit</a>
								</li>
								<li>
									<a href= LogOut.jsp> Log Out</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</header>		
		</div>
		
		<%
	
		Connection c = MySQL.connect();
		String user_reg_string = String.valueOf(session.getAttribute("user_reg"));
		int user_reg = Integer.valueOf(user_reg_string);
		System.out.println(user_reg);
		String imageDir="Img/"+user_reg+".jpg";
		System.out.println(imageDir);
		
		%>
		
		<div id="fh5co-team-section" class="fh5co-lightgray-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="heading-section text-center animate-box">
							<br>
						</div>
					</div>
				</div>
				<div class="row text-center">
					
					<div class="col-md-4 col-sm-6">
						<img src="<%=imageDir %>"  width="256" height="256">
					</div>
					<div class="col-md-8 col-sm-6">
						<!-- student info start
						-->
						<div class="price-box animate-box">
							<h2 class="pricing-plan" style="text-align: center;">Basic Information</h2>
							

							<ul class="classes" style="list-style-type:none;text-align: left; display: inline-block;">
								<%
								Statement statement = c.createStatement();
								String SkillQuery = "SELECT  * FROM account where user_reg="+ user_reg + ";";
								ResultSet rs = statement.executeQuery(SkillQuery);
								while(rs.next()){
									
									String user_name =rs.getString("user_name");
									//String user_reg =rs.getString("user_reg");
									String user_primary_email=rs.getString("Email_id");
									out.println("<li> Name : "+user_name +"</li>");
									out.println("<li> Email : "+user_primary_email +"</li>");
									out.println("<li> Reg No : "+user_reg +"</li>");
									
									}
								rs.close();
								
								SkillQuery = "SELECT  * FROM contact where user_reg="+ user_reg + ";";
								 rs = statement.executeQuery(SkillQuery);
								while(rs.next()){
									String user_mobile =rs.getString("user_mobile");
									String user_address=rs.getString("user_address");
									out.println("<li>Mobile No : "+user_mobile +"</li>");
									out.println("<li>Contact Address : "+user_address+"</li>");
								}
								rs.close();
							%>
							</ul>
	
						</div>

						<!--student info end-->
					</div>
				</div>
			</div>
		</div>
		
		<div id="fh5co-programs-section">
		<h1 class="text-center">Projects</h1>
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="heading-section text-center animate-box">
							<h2>My Projects</h2>
							<p>Till now, I have done the following projects:</p>
						</div>
					</div>
				</div>
				<div class="row text-center">
					<%
						SkillQuery = "SELECT  * FROM project where user_reg = "+ user_reg + ";";
						 rs = statement.executeQuery(SkillQuery);
						while(rs.next()){
							String project_name =rs.getString("project_name");
							String project_details =rs.getString("project_details");
							String project_technology=rs.getString("project_technology");
							String project_git_link =rs.getString("project_git_link");
							
							out.println("<div class=\"col-md-4 col-sm-6\">");
							out.println("<div class=\"program animate-box\">");
							out.println("<h3 style=\"text-align: left;\">Project name:"+ project_name+"</h3>");
							out.println("<p style=\"text-align: left;\">Details: "+project_details+"</p>");
							out.println("<p style=\"text-align: left;\">Technology: "+project_technology+"</p>");
							out.println("<p style=\"text-align: left;\">Github : "+project_git_link+"</p>");
							out.println("</div>");
							out.println("</div>");
						}
						rs.close();					
					%>
				</div>
			</div>
		</div>

		<div id="fh5co-team-section" class="fh5co-lightgray-section">
		<h1 class="text-center">Skills</h1>
			<div class="container">
				
				<div class="row text-center">
					
				
					<div class="col-md-12 col-sm-6">
						<!-- student info start
						-->
						<div class="price-box animate-box">
							

							<ul class="classes" style="list-style-type:disc;text-align: left; display: inline-block;font: bold;font-size: 200%">
								<%
		
									SkillQuery = "SELECT  * FROM skills where user_reg="+ user_reg + ";";
									rs = statement.executeQuery(SkillQuery);
									while(rs.next()){
										String skill_field =rs.getString("skill_field");
										out.println("<li>"+skill_field+"</li>");
										}
									rs.close();
									
									
								%>
	
							</ul>
	
						</div>

						<!--student info end-->
					</div>
				</div>
			</div>
		</div>
		
		<div id="fh5co-team-section" class="fh5co-lightgray-section">
		<h1 class="text-center">Field of Interest</h1>
			<div class="container">
				
				<div class="row text-center">
					
				
					<div class="col-md-12 col-sm-6">
						<!-- student info start
						-->
						<div class="price-box animate-box">
							

							<ul class="classes" style="list-style-type:disc;text-align: left; display: inline-block;font: bold;font-size: 200%">
								<%
		
									SkillQuery = "SELECT  * FROM field_of_interest where user_reg="+ user_reg + ";";
									 rs = statement.executeQuery(SkillQuery);
									while(rs.next()){
										String interest_field =rs.getString("interest_field");
										out.println("<li>"+interest_field+"</li>");
										}
									rs.close();
									
									
								%>
						
	
							</ul>
	
						</div>

						<!--student info end-->
					</div>
				</div>
			</div>
		</div>

		
		<div id="fh5co-team-section" class="fh5co-lightgray-section">
		<h1 class="text-center">Co-curricular Activities</h1>
			<div class="container">
				
				<div class="row text-center">
					
				
					<div class="col-md-12 col-sm-6">
						<!-- student info start
						-->
						<div class="price-box animate-box">
							

							<ul class="classes" style="list-style-type:disc;text-align: left;display: inline-block; font: bold;font-size: 200%">
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
										out.println("<li>CoCurricular Name : "+CoCurricularParticipation+"</li>");
										out.println("<li>Achievement : "+CoCurricular_achievement+"</li>");
										out.println("<li>Sports : "+CoCurricular_Sports+"</li>");
										out.println("<li>Cultural : "+CoCurricular_Cultural+"</li>");
										out.println("<li>Organizations : "+CoCurricular_Organizational+"</li>");
										
									}
									rs.close();
								%>
								
							</ul>
	
						</div>

						<!--student info end-->
					</div>
				</div>
			</div>
		</div>

		
		<div class="footer">
            <div>
                <form>
                    <p>
                        <a href="devoloper.html">About</a>
                        &#169; Copyright &#169: SUST-CSE all rights reserved.
                    </p>
                </form>
            </div>
        </div>
	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->


	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Superfish -->
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	</body>
</html>

