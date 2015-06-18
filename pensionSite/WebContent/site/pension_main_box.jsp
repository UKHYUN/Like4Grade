<%@page import="pkg.pension.PensionTable"%>
<%@page import="pkg.pension.PensionBean"%>

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
 		local_code = request.getParameter("local_code") ; // 파라미터 가져옴.
	
 	PensionBean dao = new PensionBean();
 	PensionTable pension_lists = dao.getPensionInfoByLikeCode(local_code); //지역코드로 펜션 객체 불러옴.
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

				<div col-md-6 class="main_local_photo">
					<span>
					<img src="http://image.wooripension.com/pension_images/w0101002/2014124162718.jpg" width="50%" height="250px" alt="">
					</span>		
				</div>
						
				<div col-md-6 class="main_local_info">
					<p><strong class="ps_name"><%= pension_lists.getPension_name() %></strong></p>
					<p><%= pension_lists.getPay_code() %></p>
					<p><%= pension_lists.getThema_code() %></p>
						</div>
			</div>
			
			<div class="col-md-5 favorBox">
				<label>♥ 지역별 선호</label>
				<ul class="nav nav-tabs nav-justified">
					<li role="presentation" class="active"><a href="#">스파 및 온천</a></li>
 					<li role="presentation"><a href="#">캠핑&바베큐</a></li>
					<li role="presentation"><a href="#">가족여행</a></li>
					<li role="presentation"><a href="#">커플여행</a></li>
					<li role="presentation"><a href="#">그외</a></li>
				</ul>
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