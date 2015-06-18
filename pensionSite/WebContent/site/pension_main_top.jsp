<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<!--  롤링배너 스크립트-->
<script>

/*롤링배너 객체*/

var rollingBanner = function(oContainer) {
this.oContainer     = oContainer; // 롤링배너 컨테이너
this.oImg             = document.createElement("img"); // 롤링배너용 이미지노드 생성
this.aImg             = new Array(); // 롤링배너용 이미지 배열
this.iCurrentIndex = 0; // 현재 이미지 인덱스

// 롤링배너 이미지를 컨테이너에 넣음
if (this.oContainer) this.oContainer.appendChild(this.oImg);

// 배너이미지 추가
this.addImg = function(sSrc) {
this.aImg.push(sSrc);
};

// 다음 이미지 세팅

this.setNextImg = function() {
if (this.iCurrentIndex>=this.aImg.length) this.iCurrentIndex = 0;
this.oImg.src = this.aImg[this.iCurrentIndex++];
};

// 롤링 시작
this.start = function(iInterval) {
this.setNextImg();


var t = this;
setInterval(function() { t.setNextImg(); }, iInterval);
};
};

window.onload = function() {

var oRollingBanner = new rollingBanner(document.getElementById("ban"));

oRollingBanner.addImg("heart.png");
oRollingBanner.addImg("C:/dev/workspace/pensionSite/WebContent/images/test1.jpg");
oRollingBanner.addImg("C:/dev/workspace/pensionSite/WebContent/images/test2.jpg");
oRollingBanner.start(3000);
}
 
</script>

<%
// 상단바 로그인 버튼 text 변경 
// 로그인 해서 세션이 저장되면 로그인 text가 "회원이름" 로그아웃 으로 변경되게 구현.
// 세션이 null 이면 로그인 txt 세션이 존재하면 회원이름 로그아웃 으로 text 변경되는것

	String memberId = (String)session.getAttribute("loginfo");
	boolean login = (memberId == null ? false : true);
%>

<body>

<div class="col-md-12 topbar_Sty">
	<div class="col-md-8 col-md-offset-2">
		<nav class="navbar"> <!--navbar-default 상단바 기본틀 일단 지웠음-->
			<div class="container-fluid">
				<div class="navbar-header">
				<a class="navbar-brand" href="pension_main.jsp">Like 4grade</a>
				</div>
				
				<div>
				<ul class="topbar_Menu_Sty navbar-nav navbar-right"> <!--nav honer 영역지정 뺌-->
				<% if(login == true){ %>
					<li><%=memberId%>님 ♥<a href="logout.jsp"><span class="topbar_Menu_box glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
				<% }
					else { %>
					<li><a href="login_Form.jsp"><span class="topbar_Menu_box glyphicon glyphicon-log-in"></span> 로그인</a></li>
				<% } %>
			
					<li><a href="join_Form.jsp"><span class="topbar_Menu_box glyphicon glyphicon-user"></span> 회원가입</a></li>
					<li><a href="user_reservation.jsp"><span class="topbar_Menu_box glyphicon glyphicon-th-list"></span> 예약확인/취소</a></li>
				</ul>
				</div>
			</div>
		</nav>
	</div>
</div>

<div class="col-md-8 col-md-offset-2 addEntireDiv">

<!-- 광고 -->
	<div class="col-md-12" style="margin-top : 10px">
	
		<!-- 롤링배너 컨테이너 -->
		<div id="ban" style="width: 100%; height: 300px;">
		</div>
	
	</div>

</div>
	
<div class="col-md-12 searchEntireDiv">

<!-- 검색바  -->
	<div class="col-md-8 col-md-offset-2 searchDiv">
		<form id="form_search" action="search_list.jsp" method="get"> <!-- action 쪽 꼭 다시 짚고가기 -->
		<input type="hidden" />
		
		<center>
        <div class="search_bar">
                <label>지역검색</label>
                <select name="local_code" id="local_code" class="dropdown search_select_sty" >
                <option value='01'  selected='selected' >경기도</option>
                <option value='02' >강원도</option>
                <option value='03' >인천시</option>
                <option value='04' >충청도</option>
                <option value='05' >경상도</option>
                <option value='06' >전라도</option>
                <option value='07' >제주도</option>
                <option value='08' >서울시</option>
            
                </select>
				
				<label>입실날짜</label>  <!-- day_code랑 연결....해야돼.... -->
					<input type="date" name="stay_date" id="stay_date" class="search_select_sty" style="width : 150px;">
				<label>숙박일수</label>
					<select name="stay_days" id="stay_days" class="dropdown search_select_sty" >
                        <option value="1">1박2일</option>
                        <option value="2">2박3일</option>
                        <option value="3">3박4일</option>
                        <option value="4">4박5일</option>
                    </select>
				<!--
                <dd class="like_input">
                    <input type="text" value="2015-06-13" readonly="readonly" id="rersrm_date" name="rersrm_date" />
                    <input type="image" src="/woori_tobe/images/common/ico_calendar.gif" alt="날짜선택" id="rersrm_date_img" onclick="return false" />
					-->
         
                <label>가격선택</label>
                    <select name="pay_code" id="pay_code" class="dropdown search_select_sty">
                        <option value="0">가격전체</option>
                        <option value="10">~ 10만원</option>
                        <option value="15">~ 15만원</option>
                        <option value="20">~ 20만원</option>
                        <option value="30">~ 30만원</option>
                        <option value="99">30만원이상</option>
                    </select>
				
				<label>인원선택</label>
                    <select name="room_user" id="room_user" class="dropdown search_select_sty" >
                        <option value="2">2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="10">10명</option>
                        <option value="15">15명</option>
                        <option value="30">30명</option>
                    </select>
				<button type="submit" class="btn btn-default search_btn_sty">검색</button>
		</div>
		</center>
		</form>
	</div>
</div>
	
</body>
</html>