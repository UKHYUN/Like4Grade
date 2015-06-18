<%@page import="pkg.pension.PensionTable"%>
<%@page import="pkg.pension.PensionBean"%>

<%@page import="pkg.code.ThemaTable"%>
<%@page import="pkg.code.LocalTable"%>
<%@page import="pkg.code.CodeBean"%>


<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8") ; %>

<%
 // pension_area.jsp 에서 local_code(지역코드) 파라미터 받아와서 파라미터로 DB 불러오기
	
 	String local_code = "null";
 	if(request.getParameter("local_code") == null){
 		local_code = "01";
 	}
 	else
 		local_code = request.getParameter("thema_code") ; // 파라미터 가져옴.
 		
 		
 	String thema_code = "null";
 	 if(request.getParameter("thema_code") == null){
 		thema_code = "01";
 	}
 	else
 		thema_code = request.getParameter("thema_code") ; // 파라미터 가져옴.
	
 	PensionBean dao = new PensionBean();
 	PensionTable pension_like = dao.getPensionInfoByLikeCode(local_code); //지역코드로 펜션 number 불러옴. (선호도 맥스)
 	PensionTable pension_lists = dao.getPensionListByPensionNumber(pension_like.getPension_number());
 	
 	PensionTable pension_like2 = dao.getPensionInfoByLikeCode2(thema_code);
 	PensionTable pension_lists2 = dao.getPensionListByPensionNumber(pension_like2.getPension_number());
 	
 	CodeBean dao2 = new CodeBean();
 	
 	
 %>
 
<html>
<head>
  <title>Like 4grade</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  
  <link rel="stylesheet" href="pension_sty.css" type="text/css" media="screen" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>


<!-- 선호도 박스 -->
	<div class="col-md-12 favorDiv">
		<div class="col-md-12 favorInDiv">
			<div class="col-md-5 favorBox">
 				<label>♥ 지역별 선호</label>
	 			<ul class="nav nav-tabs nav-justified">
					<li role="presentation" class="active"><a href="pension_main.jsp?local_code=01">경기도</a></li>
 					<li role="presentation"><a href="pension_main.jsp?local_code=03">인천시</a></li>
					<li role="presentation"><a href="pension_main.jsp?local_code=05">경상도</a></li>
					<li role="presentation"><a href="pension_main.jsp?local_code=07">제주도</a></li>
				</ul>
				
				<div class="col-md-6 main_local_photo">
					<form action=pension_info.jsp method="post"> <!-- 펜션이름 디비값 받아와서 info 페이지로 넘기기 -->
					<input type="hidden" name="pension_name" value=<%=pension_lists.getPension_name() %> />
					<span>
					<img src="http://image.wooripension.com/pension_images/w0101002/2014124162718.jpg" width="100%" height="250px" alt="">
					</span>
				</div>
				<div class="col-md-6 main_local_info">
					<center>
					<br>
					<p><strong><%= pension_lists.getPension_name() %></strong></p>
					<p>♥ 테마: <%= dao2.getThemaNameByThemaCode(pension_lists.getThema_code()).getThema_name() %></p>
					<p>♥ 가격: <%= pension_lists.getPay()%>원</p>
					<p>♥ 인원: <%= pension_lists.getRoom_user() %>명</p>
					<p>♥ 선호도: <%= pension_lists.getLike_code() %></p>
					<br>
						<input type="submit" value="더보기" class="btn btn-default login_btn">
					</form>
					</center>
				</div>
			</div>
			
			<div class="col-md-5 favorBox">
				<label>♥ 테마별 선호</label>
				<ul class="nav nav-tabs nav-justified">
					<li role="presentation" class="active"><a href="pension_main.jsp?thema_code=01">스파 및 온천</a></li>
 					<li role="presentation"><a href="pension_main.jsp?thema_code=02">캠핑&바베큐</a></li>
					<li role="presentation"><a href="pension_main.jsp?thema_code=03">가족여행</a></li>
					<li role="presentation"><a href="pension_main.jsp?thema_code=04">커플여행</a></li>
				</ul>
				
				<div class="col-md-6 main_local_photo">
					<form action=pension_info.jsp method="post"> <!-- 펜션이름 디비값 받아와서 info 페이지로 넘기기 -->
					<input type="hidden" name="pension_name" value=<%=pension_lists2.getPension_name() %> />
					<span>
					<img src="http://image.wooripension.com/pension_images/w0101002/2014124162718.jpg" width="100%" height="250px" alt="">
					</span>
				</div>
				<div class="col-md-6 main_local_info">
					<center>
					<br>
					<p><strong><%= pension_lists2.getPension_name() %></strong></p>
					<p>♥ 지역: <%= dao2.getLocalNameByLocalCode(pension_lists2.getLocal_code()).getLocal_name() %></p>
					<p>♥ 가격: <%= pension_lists2.getPay()%>원</p>
					<p>♥ 인원: <%= pension_lists2.getRoom_user() %>명</p>
					<p>♥ 선호도: <%= pension_lists2.getLike_code() %></p>
					<br>
						<input type="submit" value="더보기" class="btn btn-default login_btn">
					</form>
					</center>
				</div>
				
			</div>
			</div>
		</div>
		
		<div class="col-md-12 favorInDiv">
			<div class="col-md-6 favorBox">
				관광지별 선호
			</div>
			
			<div class="col-md-6 favorBox">
				MD추천
			</div>
		</div>
		
</body>
</html>