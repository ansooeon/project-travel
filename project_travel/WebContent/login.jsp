<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="918286908212-pk893npuaqfdi2vqtah0304bdf0lg4j8.apps.googleusercontent.com">
    <title>Document</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link href="css/login.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script src="js/login.js"></script>
<body>
    <%
    String clientId = "8U_3z6L99b_5D6frcCoj";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8081/project_travel/login_api/naver_callback.html", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>
    <div class="mainbody">
        <!--header-->
        <%@ include file="headerfooter/header.jsp" %>
        <!-- login from -->
        <form name="form" action="login_ok.jsp" method="post">
            <div class="main_body">
                <div class="loginform">
                    <div>
                        <h1 class="title">로그인 화면</h1>
                    </div>
                    <input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요."><br>
                    <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력해 주세요."><br>
                    <input type="checkbox" class="radio" value="idsave">아이디 저장
                    <input type="submit" class="submit" value="로그인">
                    <div style="position: relative; float: right; margin-top: 10px;" id="naver_id_login"></div>
                    <div style="position: relative; float: right; margin-top: 10px; width:105px; height: 40px" class="g-signin2" data-onsuccess="onSignIn"></div>
                </div>
            </div>
        </form>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
</body>
<script type="text/javascript">
	
	var naver_id_login = new naver_id_login("8U_3z6L99b_5D6frcCoj", "http://localhost:8081/project_travel/login_api/naver_callback.html");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("black", 2,40);
	naver_id_login.setDomain("YOUR_SERVICE_URL");
	naver_id_login.setState(state);
	//naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();

	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>
</html>