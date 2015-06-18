<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>

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

<div class="col-md-8 col-md-offset-2 entireDiv">
			
		<ul class="nav nav-pills nav-justified menuDiv">
			<li class="active"><a href="pension_main.jsp">Home</a></li>
			<li><a href="pension_area.jsp?">지역별</a></li>
			<li><a href="pension_thema.jsp">테마별</a></li>
			<li><a href="pension_tour.jsp">관광지별</a></li>
		</ul>
	
	<!-- OnClick="this.class=active" -->
	
	<!-- 선호도 박스 -->
		<%@ include file="pension_main_box.jsp"%>
		
</div>


<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>
