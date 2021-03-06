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
	<!-- Nav Bar Style Edit by saif -->

	<!-- Nav Bar Style Edit end by saif-->
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
		
	
		<div id="fh5co-wrapper">
		<div id="fh5co-page">
		<div id="fh5co-header">
			<header id="fh5co-header-section">
				<!-- modified to class container to class fh5co-cover for full screen nav bar-->
				<div class="fh5co-cover" >
					<div class="nav-header" >

						<h1 id="fh5co-logo" ><a href="index.jsp">SUST <span>Student Profile</span></a></h1><br><br><br>
						<!-- START #fh5co-menu-wrap -->
						<nav id="fh5co-menu-wrap" role="navigation">
							<ul class="sf-menu" id="fh5co-primary-menu">
								<!-- here in li class="active will light up the text"-->
								<li >
									<a href="UserIndex.jsp">Home</a>
								</li>
								<li>
									<a href="SearchStudent.jsp">Search Students</a>
								</li>
								<li>
									<a href= MyProfileShow.jsp> MyProfile</a>
								</li>
								<li>
									<a href= LogOut.jsp> Log Out</a>
								</li>
								<!--<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li> -->
								<!-- Login PopUp  -->
								
							</ul>
						</nav>
					</div>
				</div>
			</header>		
		</div>
		<!-- end:fh5co-header -->
		<div class="fh5co-hero" >
			<div class="fh5co-overlay"></div>
			<div class="fh5co-cover" data-stellar-background-ratio="0.5" style="background-image: url(images/home_image1.jpg); ">
				<div class="desc animate-box">
					<div class="container">
						<div class="row">
							<!--<div class="col-md-7">
								<h2>SUST Student Profile </h2>
								<span><a class="btn btn-primary" href="#">Start Your Journey</a></span>
							</div>-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end:fh5co-hero -->
		<div id="fh5co-schedule-section" class="fh5co-lightgray-section">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<div class="heading-section text-center animate-box" style = "top = 0;">
							<h2>Overview</h2>
							<p style="display: inline-block;text-align: left;">Department of Computer Science & Engineering got down to its journey along with that of School of Applied Science in 1992, the time from which till today it heaves the strength with non-breaking waves. This department has brought numerous graduates into reality that are speeding up not only Bangladesh but also the whole world in various IT fields by their skill that they have gathered from this department. CSE department mainly offers four-year undergraduate course in Computer Science & Engineering where courses are designed in such a way so that students graduating from this department have a balance of theory and practical skills to prepare them for the highly competitive workplace.</p>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<!--
		-->
		<!-- footer section modified-->
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
		<!-- footer section ends here-->	

	</div>
	<!-- END fh5co-page -->

	</div>
	<!-- END fh5co-wrapper -->

	<!-- jQuery -->
	<!-- popup Script Starts-->

	<script type="text/javascript">
                                            document.getElementById("done_adding_criminal").onclick = function () {
                                                var p;
                                                p = document.getElementById("New Criminal Saved !!").value;
                                                alert(p);
                                            };
                                        </script>


	<!-- popup script ends -->

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

