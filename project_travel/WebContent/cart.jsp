<%@page import="java.text.DecimalFormat"%>
<%@page import="cart.cartDTO"%>
<%@page import="java.util.ArrayList"%>
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
					<h1 style="text-align: center; font-size: 50px">카트 목록</h1>
					<div class="cartform">
						<ul class="cart_item">
							<li class="item_img">사진</li>
							<li class="item_title">내용</li>							
							<li class="item_check">삭제</li>
						</ul>
						<%
							DecimalFormat df = new DecimalFormat("###,###");
							ArrayList<cartDTO> list = (ArrayList<cartDTO>) request.getAttribute("cartlist");

							for (int i = 0; i < list.size(); i++) {
								
								int price = list.get(i).getPrice();
						%>
						
						<div class="cart_items">
							<a href="traveldetail.co?travel_num=<%= list.get(i).getTravelNum() %>">
							<img class="items_img" src="img/<%=list.get(i).getImg()%>"/>
							</a>
							<div class="items_title">
								<a href="traveldetail.co?travel_num=<%= list.get(i).getTravelNum() %>">
								<div class="body-title"><%=list.get(i).getTitle()%></div>
								<div class="body-content"><%=list.get(i).getTitlesub()%></div>
								<div class="body-day"><%=list.get(i).getStartdate()%>~
									<%=list.get(i).getEnddate()%></div>
								<div class="body-price"><%=df.format(price)%><em style="font-size: 15px; ">원~</em></div>
								</a>
							</div>		
												
							<div class="items_check">
								<a class="item_checkbox" name="delete" href="cartdelete.ca?travel_num=<%=list.get(i).getTravelNum() %>&userid=<%= session.getAttribute("userid") %>">삭제</a>
							</div>
						</div>
						
						<%
							}
						%>
						<!-- 
						<div class="cartbutton">							
							<input type="button" name="order" value="주문하기" style="float: right;" class="body-enter">
						</div>
						 -->
					</div>
				</div>
			</div>
		</form>
		<!-- footer -->
		<%@ include file="headerfooter/footer.jsp"%>
	</div>
</body>
</html>