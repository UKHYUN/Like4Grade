<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>

<% request.setCharacterEncoding("UTF-8") ; %>

<%@page import="pkg.code.LocalTable" %>
<%@page import="pkg.code.ThemaTable" %>
<%@page import="pkg.code.CodeBean"%>

<%@page import="pkg.pension.PensionTable" %>
<%@page import="pkg.pension.PensionBean"%>

<%@page import="java.util.ArrayList"%>

<%
	PensionTable pension = new PensionTable() ;

	pension.setLocal_code( request.getParameter("local_code"));
	pension.setThema_code( request.getParameter("thema_code"));
	// pension.setDay_code( request.getParameter("Day_code")); => date형을 day_code로 변환하는것 구현하기
	// 숙박 일수 계산하는 것 구현하기
	pension.setPay_code( request.getParameter("pay_code"));
	pension.setRoom_user( request.getParameter("room_user"));
	
	
	PensionBean dao = new PensionBean();
	ArrayList<PensionTable> search_lists = dao.getPensionListBysearch(pension);

	CodeBean dao2 = new CodeBean();
%>

<html>
<head>
  <title>Like 4grade</title>
  
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  
  <link rel="stylesheet" href="pension_sty.css" type="text/css" media="screen" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="col-md-8 col-md-offset-2 loginDiv">

		<h2 align="left">♥ 검색내용 출력할거얌 헤헤 ♥</h2>
		<hr>
		
		<div class="col-md-12 localDiv paddingZero">

			<ul class="local_list_Box">

				<!-- loop -->
	<%
		for (PensionTable list : search_lists) {
	%>
			<form action=pension_info.jsp method="post"> <!-- 펜션이름 디비값 받아와서 info 페이지로 넘기기 -->
					<input type="hidden" name="pension_name" value=<%=list.getPension_name()%> />
				<li> <!-- DB에서 사진 불러오는것 구현해야함 -->
					
				<span>
				<img src="http://image.wooripension.com/pension_images/w0101002/2014124162718.jpg" width="100%" height="250px" alt="">
				</span>

				<div class="pension_list_info" align="center">

						<p><strong><%=list.getPension_name()%></strong></p>
						<p>♥ 지역 : <%=dao2.getLocalNameByLocalCode(list.getLocal_code()).getLocal_name()%> &nbsp;&nbsp;&nbsp;
						♥ 테마 :<%=dao2.getThemaNameByThemaCode(list.getThema_code()).getThema_name()%></p>
						<p>♥ 입실 인원: <%=list.getRoom_user()%>명&nbsp;&nbsp;&nbsp; ♥ 선호도 : <%=list.getLike_code()%></p>
			</form>
						
						<input type="submit" value="더보기" class="btn btn-default login_btn">
					</div>
				</li>

		<!--  for 문 여기까지 와야함 -->
		<%
			}
		%>

		</ul>

	</div>
	</div>
	
	
</div>
	
<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>