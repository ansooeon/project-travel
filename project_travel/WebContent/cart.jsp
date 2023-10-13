<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
</head>
<link href="css/cart.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="js/login.js"></script>
<!-- 세션 없을경우 로그인 요구 -->
<%
	if (session.getAttribute("userid") == null) {
%>
<script type="text/javascript">
	alert("로그인후 이용해 주세요. ");
	location.href = "login.jsp";
</script>

<%
	}
%>
<body>
	<div class="mainbody">
		<!--header-->
		<%@ include file="headerfooter/header.jsp"%>
		<form>
			<!-- cart form -->
			<div class="main_body">
				<div class="mainInner">
					<h1 style="text-align: center; font-size: 50px">
						카트 목록
						</h2>
						<div class="cartform">
							<ul class="cart_item">
								<li class="item_img">사진</li>
								<li class="item_title">내용</li>
								<li class="item_personal">인원</li>
								<li class="item_check">선택</li>
							</ul>
							<div class="cart_items">
								<img class="items_img" src="img/thema1.png">
								<div class="items_title"></div>
								<div class="items_personal">
									<select class="items_option">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
								<div class="items_check">
									<input type="checkbox" class="item_checkbox" name="delete"
										value="delete">
								</div>

							</div>
							<div class="cart_items">
								<img class="items_img" src="img/thema1.png">
								<div class="items_title">
									<div class="body-title">5성급 베스트웨스턴 프리미어 소나씨 숙박</div>
									<div class="body-content">체크인케어 서비스 제공+디럭스오션뷰룸 진행,
										성인4/6/8일 진행시 소나씨 풀빌라 무료 UP+얼리체크인OR레이트체크아웃+전일조식+왕복픽업포함</div>
									<div class="body-day">2023.08.28 ~ 2023.12.13</div>
									<div class="body-price">599,000원~</div>
								</div>
								<div class="items_personal">
									<select class="items_option">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
								<div class="items_check">
									<input type="checkbox" class="item_checkbox" name="delete"
										value="delete">
								</div>
							</div>

							<div class="cart_items">
								<img class="items_img" src="img/thema1.png">
								<div class="items_title">
									<div class="body-title">5성급 베스트웨스턴 프리미어 소나씨 숙박</div>
									<div class="body-content">체크인케어 서비스 제공+디럭스오션뷰룸 진행,
										성인4/6/8일 진행시 소나씨 풀빌라 무료 UP+얼리체크인OR레이트체크아웃+전일조식+왕복픽업포함</div>
									<div class="body-day">2023.08.28 ~ 2023.12.13</div>
									<div class="body-price">599,000원~</div>
								</div>
								<div class="items_personal">
									<select class="items_option">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</div>
								<div class="items_check">
									<input type="checkbox" class="item_checkbox" name="delete"
										value="delete">
								</div>
							</div>
							<input type="button" name="delete" value="삭제"
								style="float: right" class="body-enter"> <input
								type="button" name="order" value="주문하기" style="float: right"
								class="body-enter">
						</div>
				</div>
			</div>
		</form>
		<!-- footer -->
		<%@ include file="headerfooter/footer.jsp"%>
	</div>
</body>
</html>