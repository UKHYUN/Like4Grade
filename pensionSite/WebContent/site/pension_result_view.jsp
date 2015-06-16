<%@page import="pkg.pension.PensionTable"%>
<%@page import="pkg.pension.PensionBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8") ; %>

<%
//	String id = request.getParameter("id") ;
//	PensionBean dao = new PensionBean();	
//	PensionTable pension = dao.getPensionByLocalCode( id ) ;
//%>

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
  
	<script language = 'javascript'>
		function goPage(url) {
			location=url;
		}
	</script>
	 
</head>
<body>

<div class="local_result_view">
	
			<div style="text-align:right; padding-top: 10px;">
					<label style="padding: 5px;"><input type="radio" name="selectSortOrder" value="lowest" checked="">최저가 순</label>
					<label style="padding: 5px;"><input type="radio" name="selectSortOrder" value="like">선호도 순</label>
				<hr style="margin-top: 0px;">
			</div>
			
			<div class="col-md-12 localDiv paddingZero">
				
				<ul class="local_list_Box">
					
			<!-- loop -->
				<li onclick="goPage('./pension_info.jsp?pension_name')"> <!-- .jsp?펜션이름 디비값 받아와서 info 페이지로 넘기기 -->
					<span><img src="http://image.wooripension.com/pension_images/w0101002/2014124162718.jpg" width="100%" height="250px" alt=""></span>

					<div class="pension_list_info" align="center">
                    
                	    <p><strong class="ps_name"> pension_name</strong></p>
	                    <p>pay_code</p>
						<p>thema_code</p>
						<p><%=request.getParameter("local_code")%><p> <!-- 파라미터값 받아오는 것 -->
						
						<div style="display:none">
	                        <p>local_code<p>
                        </div>
						<!--  <p>like_code</p>  시간나면 구현 -->
					</div>
				
				</li>
						
				</ul>
					
			</div>
</div>

</body>
</html>