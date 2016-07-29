<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
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
	
	.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{
		background-color:#eeeeee;
		color:#5cb85c;
	}
</style>
<body>
<div class="row">
	<div class="col-md-12" style="height:10px; background-color: #6DD66D"></div>
</div>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav class="navbar navbar-default" style="border-color: white;">
		  <div id="navbar" class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header col-md-2" style="margin-right: 40px;">
		      <a class="navbar-brand" href="/"><img alt="Brand" src="<c:url value="/resources/images/logo.png"></c:url>" style="width: 100%; height: auto; margin-top: 20px"></img></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div id="nav" class="collapse navbar-collapse">
		      <ul class="nav navbar-nav">
		        <li><a href="#">서비스안내</a></li>
		        <li><a href="#">요금안내</a></li>
		        <li><a href="/service/notice?page=1">고객센터</a></li>
		        <li><a href="/search" style="color: #6DD66D">Station찾기/예약</a></li>
		        <li><a href="/member/mypage" style="color: #6DD66D">마이페이지</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><button id="mypage" type="button" class="btn btn-success btn-xs" style="margin-top: 15px">${member.m_name}님, 안녕하세요!</button>&nbsp;</li>
		        <li><button id="logout" type="button" class="btn btn-default btn-xs" style="margin-top: 15px" data-toggle="modal" data-target="#logoutmodal">로그아웃</button></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-md-12" style="height:1px; background-color: #D8D8D8"></div>
</div>
<div id="wrap">
<div class="row" style="margin-top: 10px; margin-bottom: 1%">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1 style="color: #BDBDBD">마이페이지</h1>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	  <div class="col-md-2"></div>
	  <div class="col-md-2" style="background-color: #eeeeee; padding-top:1%; padding-bottom: 30%">
		  <ul class="nav nav-pills nav-stacked" role="tablist">
		    <li role="presentation"><a href="/member/mypage" aria-controls="myinfo" role="tab"><span style="color: #aaaaaa; font-size: medium">내 정보</span></a></li>
		    <li role="presentation" class="active"><a href="/member/uselist?m_code=${member.m_code}" aria-controls="uselist" role="tab"><span style="font-size: medium">이용내역</span></a></li>
		    <li role="presentation"><a href="/member/paylist?m_code=${member.m_code}" aria-controls="paylist" role="tab"><span style="color: #aaaaaa; font-size: medium">결제내역</span></a></li>
		  </ul>
	  </div>
	  <!-- Tab panes -->
	  <div class="col-md-6">
		  <table class="table table-striped">
		  	<tr>
		  		<th>번호</th><th>이용날짜</th><th>대여 station</th><th>도로명 주소</th><th>자전거 번호</th>
		  	</tr>
		  	<c:forEach begin="0" end="20" var="list" items="${useList}" varStatus="status">
		  		<tr>
			  		<td>${status.count}</td><td>${list.r_date}</td><td>${list.s_location}</td><td>${list.s_sub_location}</td><td>${list.b_code}</td>
			  	</tr>
		  	</c:forEach>
		  </table>
	  </div>
	  <div class="col-md-2"></div>
  </div>
</div>
<div id="footer" class="row">
	<div class="col-md-12" style="height:150px; background-color: #424242; margin-top: 10px">
		<footer style="margin-left: 42%; margin-top: 2%">
		  <p><a href="http://rkskekabc.cafe24.com/prjSemi/main.jsp">Armadillo</a></p>
		  <p>&copy; Copyright 2016 All rights reserved by BABJO.</p>
		</footer>
	</div>
</div>
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
		$("#signup").on("click", function() {
			$(location).attr('href', "/member/signup");
		});
		
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage");
		});
	})
</script>
</body>
</html>