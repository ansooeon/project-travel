<%@page import="Qboard.QboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/qboardcontent.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css" />
<link rel="stylesheet" href="css/slick-theme.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/travelinfo.js"></script>
<%
	if (session.getAttribute("userid") == null) {
%>
<script type="text/javascript">
	alert("로그인후 이용해 주세요. ");
	location.href = "login.jsp";
</script>

<%}
	%>
<body>
	<div class="mainbody">
        <!--header-->
        <%@ include file="headerfooter/header.jsp" %>
        
	        <div class="main_body">
	        	<div class="mainInner">
	        		<h1 style="font-size: 50px; text-align: center; border-bottom: 2px solid #e5e5e5;">문의 하기</h1>
	        		<div class="titleform">
	        		<%
					request.setCharacterEncoding("UTF-8");//한글화
					
					QboardDTO dto = new QboardDTO();
					
					int num = Integer.parseInt(request.getParameter("board_num")); 
					
					dto.setBoardnum(num);					
				
					%>
					<jsp:useBean id="selectOne" class="Qboard.QboardDao"/>
					<%
						QboardDTO list = selectOne.selectOneInfo(dto); 
					%>
					<form action="qboardmodify.jsp">
		        		<input type="text" class="title" placeholder="글 제목을 입력해주세요." name="title" value="<%=list.getTitle()%>">
		        		</div>
		        		<div class="contentform">
		        		<textarea class="content" placeholder="글 내용을 입력해주세요." name="content"><%=list.getContent()%><%=list.getWriter()%></textarea> 
		        		</div>
		        		<% 
		        		String id = (String)session.getAttribute("userid");
		        		
		        		if( id.equals(list.getWriter())) {%>
		        		<a href="qboarddelete.jsp?num=<%=list.getBoardnum()%>"><input type="button" class="body_enter" value="삭제하기"></a>
		        		<input type="submit" class="body_enter" value="수정하기">
		        		<% } %>
	        		</form>
	        		
	        	</div>
	        </div>
	        <!-- 글쓰기 버튼 생성 -->
			
        
        <!-- footer -->
        <%@ include file="headerfooter/footer.jsp" %>
    </div>
</body>
</html>