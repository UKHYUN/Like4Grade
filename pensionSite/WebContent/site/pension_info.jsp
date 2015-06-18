<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="pension_main_top.jsp"%>

<% request.setCharacterEncoding("UTF-8") ; %>

<%@page import="pkg.pension.PensionTable" %>
<%@page import="pkg.pension.PensionBean"%>

<%@page import="pkg.code.ThemaTable"%>
<%@page import="pkg.code.CodeBean"%>

<%@page import="java.util.ArrayList"%>

<%
	PensionBean dao = new PensionBean();
	
	String parameter = request.getParameter("pension_name");
	PensionTable search_lists = dao.getPensionInfoByPensionName(parameter);
	
	CodeBean dao2 = new CodeBean();
	ThemaTable thema_text = dao2.getThemaNameByThemaCode(search_lists.getThema_code());
	
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
</head>
<body>

<div class="col-md-8 col-md-offset-2 entireDiv">
			
		<ul class="nav nav-pills nav-justified menuDiv">
			<li class="active"><a href="pension_main.jsp">Home</a></li>
			<li><a href="pension_area.jsp">지역별</a></li>
			<li><a href="pension_thema.jsp">테마별</a></li>
			<li><a href="pension_tour.jsp">관광지별</a></li>
		</ul>
		
		<div class="col-md-12 pensionInfo_Div">
			<div class="col-md-12 section_pensionInfo">
			
			<div class="col-md-6 pensionInfo_photo">
				<img src="/files/jp/base/1594.jpg" width="438" height="294" alt="">
			</div>
			
			<div class="col-md-6 pensionInfo_info">
				<h2><span class="name">♥&nbsp;<%= search_lists.getPension_name() %></span></h2>
				<hr>
				<div class="more">
					<dl>
						<dt><label>테마정보</label></dt>
						<dd><%= thema_text.getThema_name() %></dd>
						<dt><label>상세주소</label></dt>
							<dd><%= search_lists.getAddress_code() %></dd>
						<dt><label>전화번호</label></dt>
						<dd><%= search_lists.getPhonenumber_code() %></dd>
					</dl>
				</div>
			</div>
		</div>
		
		
	<div class="col-md-12 section_pensionRoom">
			<center>
				<div id="useitem">
						<!--객실현황-->

	<table border="0" cellpadding="0" cellspacing="0">
	</table><table class="tbl_room" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th scope="col">선택</th>
				<th scope="col">객실명</th>
				<th scope="col">예약상태</th>
				<th scope="col">인원</th>
				<th scope="col">요금</th>
			</tr>
		</thead>
			<colgroup>
			<col width="5%">
			<col width="29%">
			<col width="12%">
			<col width="12%">
			<col width="22%">
		</colgroup>
		<tbody>
			<tr>
				<td>
					<input type="radio" style="width: 15px; height: 15px;" name="detail_pack" id="pr_12354930" vrsize="41평형" vinwon="2명 " class="link itemsel" value="10114" onclick="">
				</td>
				<td><label><%= search_lists.getPension_name() %><label>
				 <!-- <a href="javascript:popupWin('/sub/new/box/?mid=photo_room&amp;itemmt_id=10114','photo_room','794','552');">[<span class="red_dark">객실보기</span>]</a> -->
				</td>
				<td><span class="color_blue">예약가능</span></td>
				<td><%=search_lists.getRoom_user()%>명</td>
				<td>
				<!--span class="red_dark bold" style="float:right; margin-right:7px;">20%↓</span-->
				<em style="font-size:13px;" class="bold"> 336,000원</em>&nbsp;<em style="text-decoration:line-through; color:#cf3f3f;">420,000</em>
				</td>
			</tr>
		</tbody>
			<colgroup>
			<col width="5%">
			<col width="29%">
			<col width="12%">
			<col width="12%">
			<col width="22%">
		</colgroup>
		
		</table>
</div>
			
			</div>
			</center>
		
		
			<div class="col-md-6 section_pensionDate">
		<center>
		<label>♥ 입실날짜 - 2015년 6월 ♥</label>
		<table class="tbl_usecal" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th class="cell_red">일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th class="cell_blue">토</th>
								</tr>
							</thead>
							<tbody>

								<tr>
								<td class="cell_" val="31"></td>
								<td class="cell_gary" val="01">1</td>
								<td class="cell_gary" val="02">2</td>
								<td class="cell_gary" val="03">3</td>
								<td class="cell_gary" val="04">4</td>
								<td class="cell_gary" val="05">5</td>
								<td class="cell_gary" val="06">6</td>
								</tr>
								
								<tr><td class="cell_gary" val="07">7</td>
								<td class="cell_gary" val="08">8</td>
								<td class="cell_gary" val="09">9</td>
								<td class="cell_gary" val="10">10</td>
								<td class="cell_gary" val="11">11</td>
								<td class="cell_gary" val="12">12</td>
								<td class="cell_gary" val="13">13</td>
								</tr>
								
								<tr>
								<td class="cell_gary" val="14">14</td>
								<td class="cell_hotpink dayclk" val="15" style="cursor: pointer;">15</td>
								<td class="cell_orange dayclk" val="16" style="cursor: pointer;">16</td>
								<td class="cell_orange dayclk" val="17" style="cursor: pointer;">17</td>
								<td class="cell_orange dayclk" val="18" style="cursor: pointer;">18</td>
								<td class="cell_orange dayclk" val="19" style="cursor: pointer;">19</td>
								<td class="cell_orange dayclk" val="20" style="cursor: pointer;">20</td>
								</tr>
								
								<tr>
								<td class="cell_orange dayclk" val="21" style="cursor: pointer;">21</td>
								<td class="cell_orange dayclk" val="22" style="cursor: pointer;">22</td>
								<td class="cell_orange dayclk" val="23" style="cursor: pointer;">23</td>
								<td class="cell_orange dayclk" val="24" style="cursor: pointer;">24</td>
								<td class="cell_orange dayclk" val="25" style="cursor: pointer;">25</td>
								<td class="cell_orange dayclk" val="26" style="cursor: pointer;">26</td>
								<td class="cell_orange dayclk" val="27" style="cursor: pointer;">27</td>
								</tr>
								
								<tr>
								<td class="cell_orange dayclk" val="28" style="cursor: pointer;">28</td>
								<td class="cell_orange dayclk" val="29" style="cursor: pointer;">29</td>
								<td class="cell_orange dayclk" val="30" style="cursor: pointer;">30</td>
								<td class="cell_" val="01"></td>
								<td class="cell_" val="02"></td>
								<td class="cell_" val="03"></td>
								<td class="cell_" val="04"></td>
								</tr>
		
							</tbody>
						</table>
					</center>
				</div>
						
				<div class="col-md-6 section_pensionDate">
		<center>
		<label>♥ 퇴실날짜 - 2015년 6월 ♥</label>
		<table class="tbl_usecal" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th class="cell_red">일</th>
									<th>월</th>
									<th>화</th>
									<th>수</th>
									<th>목</th>
									<th>금</th>
									<th class="cell_blue">토</th>
								</tr>
							</thead>
							<tbody>

								<tr>
								<td class="cell_" val="31"></td>
								<td class="cell_gary" val="01">1</td>
								<td class="cell_gary" val="02">2</td>
								<td class="cell_gary" val="03">3</td>
								<td class="cell_gary" val="04">4</td>
								<td class="cell_gary" val="05">5</td>
								<td class="cell_gary" val="06">6</td>
								</tr>
								
								<tr><td class="cell_gary" val="07">7</td>
								<td class="cell_gary" val="08">8</td>
								<td class="cell_gary" val="09">9</td>
								<td class="cell_gary" val="10">10</td>
								<td class="cell_gary" val="11">11</td>
								<td class="cell_gary" val="12">12</td>
								<td class="cell_gary" val="13">13</td>
								</tr>
								
								<tr>
								<td class="cell_gary" val="14">14</td>
								<td class="cell_hotpink dayclk" val="15" style="cursor: pointer;">15</td>
								<td class="cell_orange dayclk" val="16" style="cursor: pointer;">16</td>
								<td class="cell_orange dayclk" val="17" style="cursor: pointer;">17</td>
								<td class="cell_orange dayclk" val="18" style="cursor: pointer;">18</td>
								<td class="cell_orange dayclk" val="19" style="cursor: pointer;">19</td>
								<td class="cell_orange dayclk" val="20" style="cursor: pointer;">20</td>
								</tr>
								
								<tr>
								<td class="cell_orange dayclk" val="21" style="cursor: pointer;">21</td>
								<td class="cell_orange dayclk" val="22" style="cursor: pointer;">22</td>
								<td class="cell_orange dayclk" val="23" style="cursor: pointer;">23</td>
								<td class="cell_orange dayclk" val="24" style="cursor: pointer;">24</td>
								<td class="cell_orange dayclk" val="25" style="cursor: pointer;">25</td>
								<td class="cell_orange dayclk" val="26" style="cursor: pointer;">26</td>
								<td class="cell_orange dayclk" val="27" style="cursor: pointer;">27</td>
								</tr>
								
								<tr>
								<td class="cell_orange dayclk" val="28" style="cursor: pointer;">28</td>
								<td class="cell_orange dayclk" val="29" style="cursor: pointer;">29</td>
								<td class="cell_orange dayclk" val="30" style="cursor: pointer;">30</td>
								<td class="cell_" val="01"></td>
								<td class="cell_" val="02"></td>
								<td class="cell_" val="03"></td>
								<td class="cell_" val="04"></td>
								</tr>
		
							</tbody>
						</table>
						
					</center>
			</div>
			<center>
			<form method="get" action="user_reservation.jsp"> <!-- 주소 수정 다시 / 로그인상태 아니면 로그인창으로 가게 코딩-->
					<input type="hidden" method="get" name="pension_name" value="<%=search_lists.getPension_name() %>" >
					<input type="hidden" method="get" name="member_id" value="<%= session.getAttribute("loginfo") %>" >
					<input type="submit" value="예약하기" class="btn btn-default reservation_btn" style="width: 300px;">
			</form>
			</center>
		</div>

</div>

<%@ include file="pension_main_bottom.jsp"%>

</body>
</html>
