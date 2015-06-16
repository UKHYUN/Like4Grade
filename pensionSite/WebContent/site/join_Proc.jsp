<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8") ; %>

<%@page import="pkg.member.MemberTable" %>
<%@page import="pkg.member.MemberBean"%>

<%
	MemberTable member = new MemberTable() ;

	member.setId( request.getParameter("id"));
	member.setName( request.getParameter("name"));
	member.setPassword( request.getParameter("password"));
	member.setHiredate( request.getParameter("hiredate")) ;
	member.setGender( request.getParameter("gender"));
	member.setEmail1( request.getParameter("emial1")) ;
	member.setEmail2( request.getParameter("emial2"));
	
	
	MemberBean dao = new MemberBean();
	
	int cnt = -1 ;
	
	cnt = dao.InsertMember( member ) ;
	
	String msg = "" ;
	String url = "" ;
	
	if(cnt != -1 ){
		msg = "입력 성공" ;
		url = "login_Form.jsp" ;
	}else{
		msg = "입력 실패" ;
		url = "join_Form.jsp" ;
	}	
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert('<%=msg%>'); 
		
		location.href='<%=url%>';
		
	</script>
</body>
</html>
