<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8") ; %>

<%@page import="pkg.reservation.ReservationTable"%>
<%@page import="pkg.reservation.ReservationBean"%>

<%@page import="java.util.ArrayList"%>

<%
	
	ArrayList<ReservationTable> reservation = null;
	ReservationBean dao = new ReservationBean();
	
	String msg = "" ;
	String url = "" ;
	
	if( session.getAttribute("loginfo") == null ){
		url = "login_Form.jsp";
		msg = "로그인 해주세요.";
	}
	else{
		
		//reservatiotable 저장하는 메서드 호출.
	}
	
	//user_reservation.jsp 에서 부르기.

%>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>