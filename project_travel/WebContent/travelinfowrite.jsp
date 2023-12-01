<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Info board</title>
</head>
<link rel="stylesheet" href="css/header.css">
<link href="css/travelinfowrite.css" type="text/css" rel="stylesheet">
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
        <div class="main_body">
        	<div class="mainInner">
        		<div class="page-title-area">
       				<div class="page-title">
       					<h2 class="traveltitle">여행 정보 글쓰기</h2>       					
       				</div>
       			</div>
       			<div class="write-area">
       				<div class="write-inner">
       					<form action="infowrite.ti" method="post" enctype="multipart/form-data" name="infoform">
       						<div class="form-area">
       							<div class="form-grid">
       								<dl class="form-item">
       									<dt class="label">이름</dt>
       									<dd class="cont">
       										<div class="inp-box">
       											<input type="text" class="inp-base" value="<%=session.getAttribute("userid") %>" name="member_id" readonly placeholder> 
       										</div>
       									</dd>
       								</dl>
       							</div>
       						</div>
       						<div class="form-area">
       							<div class="form-grid">
       								<dl class="form-item">
       									<dt class="label">제목</dt>
       									<dd class="cont">
       										<div class="inp-box">
       											<input type="text" class="inp-base" name="title" placeholder="제목을 입력해주세요"> 
       										</div>
       									</dd>
       								</dl>
       							</div>
       						</div>
       						<div class="form-area">
       							<div class="form-grid">
       								<dl class="form-item">
       									<dt class="label">여행지</dt>
       									<dd class="cont">
       										<div class="inp-box">
       											<input type="text" class="inp-base" name="region" placeholder="여행지를 입력해주세요">
       										</div>
       									</dd>
       								</dl>
       							</div>
       						</div>
       						<div class="form-area">
       							<div class="form-grid">
       								<dl class="form-item">
       									<dt class="label">내용</dt>
       									<dd class="cont">
       										<div class="inp-box">
       											<textarea type="text" class="text-base" name="content" value="가나다라"></textarea> 
       										</div>
       									</dd>
       								</dl>
       							</div>
       						</div>       						
       						<div class="form-area">
       							<div class="form-grid">
       								<dl class="form-item">
       									<dt class="label">계획</dt>
       									<dd class="cont">
       										<div class="inp-box">
       											<textarea type="text" class="text-base" name="myplan" value="가나다라"></textarea> 
       										</div>
       									</dd>
       								</dl>
       							</div>
       						</div>
       						<div class="form-area">
       							<div class="form-grid">
       								<dl class="form-item">
       									<dt class="label">이미지 파일</dt>
       									<dd class="cont">
       										<div class="inp-box">
       											<input type="file" class="inp-base" name="img" value="이미지"/> 
       										</div>
       									</dd>
       								</dl>
       							</div>
       						</div>
       						<input type="submit" class="body_enter" value="작성" id="created">       						
       					</form>
       				</div>
       			</div>
        	</div>
        </div>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
</body>
</html>