<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Info board</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link href="css/mypage.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/mypage.js"></script>
<% if(session.getAttribute("userid") == null) { %>
<script type="text/javascript">
	alert("로그인후 이용해 주세요. ");
	location.href= "login.jsp"; 
</script>

<% } %>
<body>
	<div class="mainbody">
        <!--header-->
        <%@ include file="headerfooter/header.jsp" %>
        <div class="">
        	
        </div>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
</body>
</html>