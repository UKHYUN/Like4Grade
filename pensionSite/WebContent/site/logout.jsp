<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8") ; %>

<% 
	request.setCharacterEncoding("UTF-8"); 
	session.invalidate() ;
	response.sendRedirect("./login_Form.jsp") ;
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> </title>
</head>
<body>
</body>
</html>