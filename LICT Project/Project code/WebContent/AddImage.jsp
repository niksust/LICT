<%@ include file="MyProfile.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<hr/>
	<form action="UploadFile" method="post" enctype="multipart/form-data">
		UserPhoto: <input type="file" name= "user_image" value ="Select Image"/>
		<input type="submit" value="Upload" >
		
	</form>
	<form action="MyProfileShow.jsp" method="post" >
		<input type="submit" value="skip" >
		
	</form>
</body>
</html>
	