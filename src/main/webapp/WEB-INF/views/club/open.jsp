<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<html>
<head>
<title>open_club</title>
</head>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"></c:url>" />
<!-- <link rel="stylesheet" href="/resources/css/bootstrap.min.css" /> -->
<script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>

<style>
html,body{height:100%}
	body{margin:0}
	#wrap{min-height:100%}
	#footer{margin-top:-1em;height:1em}
	
	#navbar{
		background-color: white;
	}
	
	#nav{
		padding-top: 30px;
	}
	
	a{
		font-weight: bold;
	}
</style>
<body>
	<%@include file="../include/header.jsp" %>


	<div id="wrap">
	<div class="upper">
		<div class="col-md-12" style="height: 2px; background-color: #D5D5D5"></div>

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">


				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#" style="color: #6DD66D">동아리 홈</a></li>
						<li><a href="#">인기동아리</a></li>
						<li><a href="#">주제별 동아리</a></li>
						<li><a href="#">동아리란?</a></li>
					</ul>
					<ul class="nav navbar-right">
						<li><a href='/make/club'>동아리 개설하기</a></li>
					</ul>

				</div>
			</div>



		</div>

		<div class="col-md-2"></div>
	</div>
	<!-- 상단바 -->


	<div class="row">
		<div class="tab" style="height: 1px; background-color: #D5D5D5"></div>
	</div>



	<div class="notice">

		<div class="col-md-12" style="height: 1px; background-color: #D8D8D8"></div>
		<div class="col-md-3"></div>
		<div class="col-md-8">
			
		</div>
		<div class="col-md-3"></div>
		<br />

		<div class="col-md-12"></div>
		<nav class="tab" style="border-color: white;"></nav>
		<div id="nav" class="container-fluid">
			<div class="middle" style="margin-right: 150px">
				<div class="col-md-3"></div>

				<div class="col-md-6">
					<div class="notice2">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#today">오늘의동아리</a>
							</li>
							<li role="presectatoin"><a href="#theme">테마별 동아리</a></li>
							<li role="presectatoin"><a href="#local">지역별 동아리</a></li>
						</ul>
						<br />
						<div class="tab-content">
							<div role="tab1" class="tab-pane active" id="today">
								<img src="<c:url value = "/resources/images/club.jpg"></c:url>"
									alt="todays" style="width: 250px; height: 200px;"> 저희는
								이런활동을 해요 저희는 이런활동을 해요저희는 이런활동을 해요저희는 이런활동을 해요 어쩌구 어쩌구
							</div>
							<div role="tab2" class="tab-pane" id="theme"></div>
							<div role="tab3" class="tab-pane" id="local"></div>
							<br />
						</div>
					</div>


				</div>
				<div class="col-md-3"></div>
			</div>
		</div>

		<div class="col-md-12"></div>

		<nav class="tab" style="border-color: white;"></nav>

		<div class="middle2" style="margin-right: 150px">
			<div class="col-md-12"></div>
			<div class="col-md-3"></div>
			<div class="col-md-6" style="height: 1px; background-color: #D8D8D8"></div>
			<div class="col-md-3"></div>

			<div class="col-md-3"></div>
			<div class="col-md-3">
				<div class="notice3">
					<h2>동아리 정보</h2>

					
					<table class="table table-group">
						<tr>
							<th>동아리 이름</th>
							<th>동아리 개설 목적</th>
							<th>개설자</th>
						</tr>

						<c:forEach items="${group }" var="group">
							<tr>
								<td><a href="/myclub/go?g_code=${group.g_code }&b_code=0">${group.name }</a></td>
								<td>${group.purpose }</td>
								<td>${group.m_code }</td>
							</tr>
						</c:forEach>

					</table>

				</div>
			</div>
			<div class="col-md-3">
				<div class="mynotice">
					<h2>동아리 새글</h2>

					<table class="table table-board">

						<tr>
							<th>제목</th>
							<th>글쓴이</th>
						</tr>
						<c:forEach items="${list }" var="board">

							<tr>
								<td><a href="/club/read?bno=${board.bno }">${board.title }</a></td>
								<td>${board.m_code }</td>
							</tr>

						</c:forEach>
					</table>

				</div>
			</div>

			<div class="col-md-3"></div>





		</div>
	</div>
	</div>
<%@include file="../include/footer.jsp" %>
<!-- 로그아웃 모달창 -->
<div id="logoutmodal" class="modal bs-example-modal-sm" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">로그아웃 확인</h4>
      </div>
      <div class="modal-body">
        <p>${member.m_name}님, 로그아웃 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button id="logoutconfirm" type="button" class="btn btn-primary">확인</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
<script>
	$(document).ready(function() {
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage?m_code=${member.m_code}");
		});
	})
</script>
</html>