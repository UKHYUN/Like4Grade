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

<%
	//파라미터값으로 pension_number 가져오기
	PensionTable pension_number = null;
	PensionBean dao = new PensionBean();
	
	String pension_name = request.getParameter("pension_name");
	pension_number = dao.getPensionNumberByPensionName(new String(pension_name.getBytes("8859_1"), "UTF-8"));
	
	//예약 정보 저장하기
	ReservationTable reservation = new ReservationTable() ;

	reservation.setMember_id( request.getParameter("member_id"));
	reservation.setPension_number( pension_number.getPension_number() );

	int cnt = -1 ;
	
	ReservationBean dao2 = new ReservationBean();
	cnt = dao2.InsertReservation( reservation ) ;

	if(cnt != -1 ){
%>
	<script type="text/javascript">
		alert('예약 되었습니다.');
		location.href='./user_reservation.jsp?member_id='+'<%=request.getParameter("member_id")%>';
	</script>
<%
	}else{
%>
	<script type="text/javascript">
		alert('예약 실패!');
		history.back();
	</script>
<% } %>
	
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

</body>
</html>