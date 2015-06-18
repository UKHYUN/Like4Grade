<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>

<% request.setCharacterEncoding("UTF-8") ; %>

<%@page import="pkg.pension.PensionTable" %>
<%@page import="pkg.pension.PensionBean"%>

<%@page import="java.util.ArrayList"%>

<%
	PensionTable pension = new PensionTable() ;

	pension.setPension_name( request.getParameter("Pension_name"));
	// pension.setDay_code( request.getParameter("Day_code")); => date형을 day_code로 변환하는것 구현하기
	// 숙박 일수 계산하는 것 구현하기
	pension.setPay_code( request.getParameter("Pay_code"));
	pension.setRoom_user( request.getParameter("Room_user"));
	
	
	PensionBean dao = new PensionBean();
	ArrayList<PensionTable> search_lists = dao.getPensionListBysearch(pension);

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
	
</div>
	
<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>