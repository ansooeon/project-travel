<%@page import="util.PageInfo"%>
<%@page import="TravelInfo.TravelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount=pageInfo.getListCount();
	int nowPage=pageInfo.getPage();
	int maxPage=pageInfo.getMaxPage();
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Info board</title>
</head>

<link href="css/travelinfo.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/travelinfo.js"></script>
<body>
	<div class="mainbody">
        <!--header-->
        <%@ include file="headerfooter/header.jsp" %>
        <div class="mainbody">
        	<div class="mainbody-Inner">
        		<div class="item">
        			<div class="page-title-area">
        				<div class="page-title">
        					<h2 class="traveltitle">Travel Information</h2>
        					
        				</div>
        			</div>
		        	<div class="left-img">
		        		<img src="img/travelinfomain.jpg">
		        		<div class="text">
		        			<h3>당신의 여행을<br/>자랑해보세요</h3>
		        		</div>
		        	</div>
					<form action="travelinfoList.ti" method="get">
						<table >
							<tr>
								<td class="search-area">
									<select id="searchCondition" name="searchCondition" class="selectbtn">
										<option value="TITLE">제목</option>
										<option value="CONTENT">내용</option>
									</select>
									<input id="searchKeyword" name="searchKeyword" type="text" class="searchbtn">
									<input type="submit" value="검색 " class="submitbtn">
								</td>
							</tr>		
						</table>
					</form>		        	
		        	<div class="travel-item">
		        		<% 
		        			ArrayList<TravelDTO> list = (ArrayList<TravelDTO>) request.getAttribute("articleList");
		        		if(list.size()>0) {
		        			for(int i=0;i<list.size();i++) {		        		
		        		%>
			        	<div class="travel_item_active2">
			        		<a href="travelinfodetail.ti?travel_num=<%= list.get(i).getTravelboard_num() %>&page=<%=nowPage%>">
			        		<img class="item-img" src="img/<%=list.get(i).getImg() %>" />
			        		<div class="item-info">
                                <p class="tit"><%=list.get(i).getTitle() %></p>
                                <p class="cont"><%=list.get(i).getContent() %></p>
                                <div class="btn-detail"><%=list.get(i).getMember_id() %> 님</div>
                            </div>
                            </a>
			        	</div>
			        	<%} %>			        		        	
		        	</div>
		        	<div class="paging-wrap">
		        		<div class="paging">
							<%	if(nowPage<=1){ %>
								[이전]&nbsp;
								<%}else{ %>
								<a href="travelinfoList.ti?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
								<%} %>
						
								<%for(int a=startPage;a<=endPage;a++){
										if(a==nowPage){%>
								[<%=a %>]
								<%}else{ %>
								<a href="travelinfoList.ti?page=<%=a %>">[<%=a %>]
								</a>&nbsp;
								<%} %>
							<%} %>					
							<%if(nowPage>=maxPage){ %>
							[다음]
							<%}else{ %>
							<a href="travelinfoList.ti?page=<%=nowPage+1 %>">[다음]</a>
							<%} %>
		        		</div>
		        	</div>		
		        	<div class="list-btn">
		        	<a href="travelinfowrite.jsp" class="btn-type write"><strong>작성하기</strong></a>	
		        	</div>  
		        	<%}else{ %>
		        	<div style=" height:250px; padding: 150px 0 140px; text-align: center;">검색 결과 없음</div>
		        	<%} %>     	 	
	        	</div>
	        	
	        	
		        
        	</div>
        	
        </div>
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
</body>
</html>