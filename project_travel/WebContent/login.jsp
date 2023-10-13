<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link href="css/login.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/login.js"></script>
<body>
    
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
                </div>
            </div>
        </form>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
</body>
</html>