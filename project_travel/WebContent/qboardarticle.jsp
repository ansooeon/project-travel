<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/qboardarticle.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/travelinfo.js"></script>


<body>
	<div class="mainbody">
		<!--header-->
		<%@ include file="headerfooter/header.jsp"%>
		<form action="qboardcreated.jsp">
			<div class="main_body">
				<div class="mainInner">
					<h1
						style="font-size: 50px; text-align: center; border-bottom: 2px solid #e5e5e5;">질문
						게시글 작성</h1>
					<div class="titleform">
						<input type="text" class="title" placeholder="글 제목을 입력해주세요." name="title" id="title">
					</div>
					<div class="contentform">
						<textarea class="content" placeholder="글 내용을 입력해주세요."	name="content" id="content"></textarea>
					</div>
					<input type="submit" class="body_enter" id="write" value="글쓰기">
					<!-- 글쓰기 버튼 생성 -->
				</div>
			</div>
		</form>
		<!-- footer -->
		<%@ include file="headerfooter/footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	$('#write').click(function() {

		var title = document.getElementById("title");
		var content = document.getElementById("content");

		if (title.value == "") {

			alert("제목을 입력해주세요.");
			title.focus();
			return false;
		} else if (content.value == "") {
			alert("내용을 입력해주세요.");
			content.focus();
			return false;
		}
	})
</script>
</html>