<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>
<html>
<head>

  <title>회원 가입 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="style.css">
  
  <link rel="stylesheet" href="pension_sty.css" type="text/css" media="screen" />
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 
	
</head>

	<script type="text/javascript">
		function check(){
			var id = document.myform.id.value ;
			
			if( id == 'admin' ){
				alert('사용 불가능한 문자입니다.');
				//document.myform.id.focus();
				document.myform.id.select();
				return false ;
			}
			
			if( id.length < 3 || id.length > 9 ){
				alert('아이디는 3글자 이상 8글자 이하입니다.');
				//document.myform.id.focus();
				document.myform.id.select();
				return false ;
			}
			
			/* 4 <= 비번 <= 10 */
			var password = document.myform.password.value ;
			
			if( password.length < 3 || password.length > 9 ){
				alert('비밀 번호는 4글자 이상 10글자 이하입니다.');
				document.myform.password.focus();
				//document.myform.password.select();
				return false ;
			}
			
			if(document.myform.password.value != document.myform.password2.value) //비밀 번호 체크
			  {
			   alert("확인 비밀번호가 다릅니다.");
			   document.myform.password.value="";
			   document.myform.password2.value="";
			   document.myform.password.focus();
			   return false;
			  }

			
			regex = /^\d{4}\/\d{2}\/\d{2}$/;
			var hiredate = document.myform.hiredate.value ;
			if( hiredate.search(regex) == -1 ){
				alert('yyyy/mm/dd 형식으로 입력해 주세요') ;
				document.myform.hiredate.focus();
				return false ;
			}
		}
		
		function idCheck(){
			var id = document.myform.id.value ;
			var url='idCheck.jsp?id=' + id ;
			
			window.open(url, 'Like 4grade', 'height=120,width=285') ; 
			
			// window.open("[열릴 페이지 주소]", "[창 이름]", "[창 속성]");
		}
		
	</script>
	
</head>
<body>

<div class="col-md-8 col-md-offset-2 joinDiv">

	<table border="5" cellspacing="10" cellpadding="15" width="80%" align="center">	
	<h4 align="center"> ♥ 회원 가입 ♥</h4>

	<form action="join_Proc.jsp" method="post" name="myform">
	
	<table class="tbl_join" align="center" width="50%">
		
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" value="">
				<input type="button" value="중복 체크" onclick="idCheck();">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value="">
			</td>
		</tr>
		<tr>
			<th>비밀 번호</th>
			<td>
				<input type="password" name="password" value="">
			</td>
		</tr>
		
		<tr>
			<th>비밀 번호 확인</th>
			<td>
				<input type="password" name="password2" value="">
			</td>
		</tr>

		<tr>
			<th>생년 월일</th>
			<td>
				<input type="text" name="hiredate" value="">
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<input type="radio" name="gender" value="남" checked="checked">남자 &nbsp;&nbsp;
				<input type="radio" name="gender" value="여">여자
			</td>
		</tr>

		<tr>
		
			<th>e-mail</th>
			<td>
				<input type="text" name="email1" value=""> @
				<select name="email2">
					<option value="-">---- 선택하세요 ----
					<option value="hanmail.net">hanmail.net
					<option value="naver.com">naver.com
					<option value="google.com">google.com
				</select>
			</td>
			
		</tr>
	
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원 가입" class="btn btn-default join_btn" onclick="return check()">
				<input type="reset" value="취소" class="btn btn-default join_btn">
			</td>
		</tr>

	</table>	
	</form>
</table>

</div>

<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>
