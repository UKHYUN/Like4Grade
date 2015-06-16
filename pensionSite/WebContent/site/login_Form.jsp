<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>

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

	<h4 align="center">♥ 로그인 ♥</h4>
	<table border="1" cellspacing="10" cellpadding="15" width="50%" align="center">
		<tr>
			<td colspan="8" align="center">
				<!-- goto page는 로그인 이후에 이동할 페이지를 의미한다. -->
				<form method="post" action="login_Porc.jsp">
					<input type="hidden" name="gotopage" value="<%=request.getParameter("gotopage")%>">
					
					ID &nbsp;&nbsp;&nbsp; <input type="text" name="id" value=""><br><br>
					P/W &nbsp;&nbsp;<input type="password" name="password" value=""><br><br>
					
					<input type="submit" value="로그인" class="btn btn-default login_btn">
					&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소" class="btn btn-default login_btn">
				</form>
				
				<br>
				<a href="join_Form.jsp"> <label class="login_join_text">회원가입</label> </a>
			</td>
		</tr>
	</table>
</div>
	
<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>