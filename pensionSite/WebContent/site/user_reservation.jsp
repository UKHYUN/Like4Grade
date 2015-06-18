<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>

<% request.setCharacterEncoding("UTF-8") ; %>

<%@page import="pkg.pension.PensionTable" %>
<%@page import="pkg.pension.PensionBean"%>

<%@page import="pkg.reservation.ReservationTable" %>
<%@page import="pkg.reservation.ReservationBean"%>

<%@page import="java.util.ArrayList"%>

<!-- 
	PensionTable pension = null;
	PensionBean dao = new PensionBean();
	
	pension = dao.getPensionNumberByPensionName(request.getParameter("pension_name"));
	
	//예약 정보 저장하기
	ReservationTable reservation = new ReservationTable() ;

	reservation.setMember_id( request.getParameter("member_id"));
	reservation.setPension_number( pension.getPension_number() );

	int cnt = -1 ;
	
	ReservationBean dao2 = new ReservationBean();
	cnt = dao2.InsertReservation( reservation ) ;

	String msg = "" ;
	String url = "" ;

	if(cnt != -1 ){
		msg = "입력 성공" ;
		url = "login_Form.jsp" ;
	}else{
		msg = "입력 실패" ;
		url = "join_Form.jsp" ;
	}
 -->

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

<h2 align="left">♥ 예약 내역 확인 ♥</h2>

	<hr>
	
	<table class="reservation_List_Table" border="1" width="90%" align="center">
			<tr class="head">
				<th style="background :#FFE4E1;">예약날짜</th>
				<th>펜션정보</th>
				<th>예약상태</th> <!-- 이용가능 or 이용 만료 -->
				<th>예약취소</th>
			</tr>
			
			<!-- memeber 예약현황 DB 불러와서 loop 구현하기 -->
			<tr>
				<td>06.18</td>
				<td>코스모스펜션</td>
				<td>이용가능</td>
				<td>btn</td>
			</tr>
	</table>
</div>
	
<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>