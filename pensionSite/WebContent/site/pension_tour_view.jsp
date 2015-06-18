<%@page import="pkg.pension.PensionTable"%>
<%@page import="pkg.pension.PensionBean"%>

<%@page import="java.util.ArrayList"%>

<%@page import="pkg.code.LocalTable"%>
<%@page import="pkg.code.ThemaTable"%>
<%@page import="pkg.code.TourTable"%>
<%@page import="pkg.code.CodeBean"%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% request.setCharacterEncoding("UTF-8") ; %>

<%
 	String tour_code = "null";
 	if(request.getParameter("tour_code") == null){
 		tour_code = "01";
 	}
 	else
 		tour_code = request.getParameter("tour_code") ; // 파라미터 가져옴.
	
 	PensionBean dao = new PensionBean();
 	ArrayList<PensionTable> pension_lists = dao.getPensionListByTourCode(tour_code); //지역코드로 펜션 객체 불러옴.
 	
 	CodeBean dao2 = new CodeBean();
 %>

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
<%
	for(PensionTable list : pension_lists ){ //ArrayList<PensionTable> 자료형 일단 지움
%>
				<form action=pension_info.jsp method="post"> <!-- 펜션이름 디비값 받아와서 info 페이지로 넘기기 -->
				<input type="hidden" name="pension_name" value=<%=list.getPension_name() %> />
				<li> <!-- 펜션이름 디비값 받아와서 info 페이지로 넘기기 -->
					
					<!-- DB에서 사진 불러오는것 구현해야함 -->
					<span><img src="http://image.wooripension.com/pension_images/w0101002/2014124162718.jpg" width="100%" height="250px" alt=""></span>

					<div class="pension_list_info" align="center">
                    
                	    <p><strong class="ps_name"><%=list.getPension_name()%></strong></p>
                	    <p>지역: <%=dao2.getLocalNameByLocalCode(list.getLocal_code()).getLocal_name()%></p>
	                    <p>테마: <%=dao2.getThemaNameByThemaCode(list.getThema_code()).getThema_name()%></p>
						
						<!-- <div style="display:none">
	                        <p>local_code<p> </div> 안보이게 하는 것 -->
						<!--  <p>like_code</p>  시간나면 구현 -->
				</form>
						<input type="submit" value="더보기" class="btn btn-default login_btn">
					</div>
					
				
				</li>
				
				<!--  for 문 여기까지 와야함 --> <% }%> 
						
				</ul>
					
			</div>
</div>

</body>
</html>