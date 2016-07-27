<!-- 
	작성자 : 김정훈
	작성일 : 2016.07.19
	내용 : 대여상태 확인 페이지
	수정내역 : 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenCycle - 대여 완료</title>

<!-- BootStrap v3.3.2 -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

<style>
/* 사이드메뉴 관련 style 시작 */
#nav {background-color: white; padding-top: 30px;}
a {font-weight: bold;}
/* 사이드메듀 관련 style 끝 */

/* 상단바 관련 style 시작 */
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover{background-color: #eeeeee; color: #5cb85c;}
/* 상단바 관련 style 끝 */
</style>

<script>
	function fnReturn() {
		if(confirm("반납하겠습니까?") == true) {
			document.mainform.submit();
		}
	}
</script>

</head>
<body>
	<!-- 상단바 시작 -->
	<div class="row">
		<div class="col-md-12" style="height: 10px; background-color: #6DD66D"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<nav class="navbar navbar-default" style="border-color: white;">
			<div id="nav" class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header" style="margin-right: 80px;">
					<a class="navbar-brand" href="#" style="color: #6DD66D">Green Cycle</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">서비스안내</a></li>
						<li><a href="#">요금안내</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#" style="color: #6DD66D">Station찾기/예약</a></li>
						<li><a href="#" style="color: #6DD66D">마이페이지</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><button type="button" class="btn btn-default btn-xs" style="margin-top: 15px">로그인</button>&nbsp;</li>
						<li><button type="button" class="btn btn-default btn-xs" style="margin-top: 15px">회원가입</button></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid --> </nav>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-12" style="height: 1px; background-color: #D8D8D8"></div>
	</div>
	<!-- 상단바 종료 -->

	<!-- 메뉴 선택 이름 바 시작 -->
	<div class="row" style="margin-bottom: 1%">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h1>Station 찾기/예약</h1>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- 메뉴 선택 이름 바 종료 -->

	<div class="row">
		<!-- 좌측 여백 시작 -->
		<div class="col-sm-2"></div>
		<!-- 좌측여백 끝 -->

		<!-- 중간영역 시작 -->
		<div class="col-sm-2" style="background-color: #eeeeee; padding-top: 1%; padding-bottom: 20%">
			<ul class="nav nav-pills nav-stacked">
				<li role="presentation"><a href=""><span style="color: #aaaaaa; font-size: medium">대여소 찾기/대여</span></a></li>
				<li role="presentation"><a href=""><span style="color: #aaaaaa; font-size: medium"><img src="resources/images/arrow.png" width="50" height="50"></span></a></li>
				<li role="presentation" class="active"><a href=""><span style="font-size: medium">대여 완료</span></a></li>
			</ul>
		</div>
		<div class="col-sm-6">
		<c:forEach items="${renting }" var="rentVO">
			<table class="table table-striped">
				<tr>
					<th>대여 시간</th>
					<th>${rentVO.r_date}</th>
				</tr>
				<tr>
					<th>대여 장소</th>
					<th>${rentVO.s_location }, 스테이션 번호 : ${rentVO.s_code}번</th>
				</tr>
				<tr>
					<th>상세주소</th>
					<th>${rentVO.s_sub_location }</th>
				</tr>
				<tr>
					<th>자전거 번호</th>
					<th>${rentVO.b_code }, 상태 : 
					<c:choose>
						<c:when test="${rentVO.r_state=='1'}">
						대여가능
						</c:when>
					</c:choose>
					</th>
				<tr>
					<th>대여자 명의</th>
					<th>${rentVO.m_name }</th>
				</tr>
				<tr>
					<th>대여시간</th>
					<th>${rentVO.r_date }</th>
				</tr>
			</table>
			<form method="post" name="mainform" action="/turnin">
				<input type="hidden" name="m_code" value="${rentVO.m_code}">
				<input type="hidden" name="b_code" value="${rentVO.b_code}">
			</form>
			<div align="center">
				<input type="button" value="(임시)반납하기" onclick="fnReturn()">
			</div>
			</c:forEach>
		</div>
		<!-- 중간영역 끝 -->

		<!-- 우측 여백 시작 -->
		<div class="col-md-2"></div>
		<!-- 우측 여백 끝 -->
	</div>

	<!-- 하단바 시작 -->

	<!-- 하단바 끝 -->
	<!-- BootStrap v3.3.2 -->
	<script src="../../../../js/jquery-2.2.3.min.js"></script>
	<script src="../../../../js/bootstrap.min.js"></script>
</body>
</html>