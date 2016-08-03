<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>요금안내</title>
</head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="<c:url value="../resources/js/jquery-2.2.3.min.js"></c:url>"></script>
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
		background-color:#5cb85c;
		color:#eeeeee;
	}
</style>
<body>
<%@include file="../include/header.jsp" %>
<div id="wrap">
<div class="row" style="margin-top: 10px; margin-bottom: 1%">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1 style="color: #BDBDBD">이용안내</h1>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-2" style="background-color: #eeeeee; padding-top: 1%; padding-bottom: 25%">
			<ul class="nav nav-pills nav-stacked" role="tablist">
				<li role="presentation" class="active"><a href="/fare_guide/fareGuide" aria-controls="notice" role="tab">
					<span style="font-size: medium">요금안내</span></a></li>
				<c:choose>
					<c:when test="${member == null}">
				<li role="presentation"><a href="/member/login" aria-controls="notice" role="tab">
					<span style="color: #aaaaaa; font-size: medium">이용권구매</span></a></li>
					</c:when>
					<c:when test="${member != null}">
				<li role="presentation"><a href="/fare_guide/payment" aria-controls="notice" role="tab">
					<span style="color: #aaaaaa; font-size: medium">이용권구매</span></a></li>
					</c:when>
				</c:choose>
			</ul>
	</div>
	
	<div class="col-sm-4">
	<h3>요금 안내</h3><br/>
	<lavel>&nbsp; ■ 정기권 종류는 아래와 같습니다.</lavel><br/><br/>
	<table class="table table-hover table-bordered text-center">
				<tr class="success">
					<td><b>정기권종류</b></td><td><b>정기권금액</b></td><td><b>비고</b></td>
				</tr>
				<tr>
					<td>7일권</td><td>3000원</td>
				</tr>
				<tr>
					<td>30일권</td><td>5000원</td>
				</tr>
				<tr>
					<td>180일권</td><td>15000원</td>
				</tr>
				<tr>
					<td>365일권</td><td>30000원</td>
				</tr>
	</table>
	<lavel>&nbsp; ■ 결제안내</lavel><br/><br/>
	&nbsp;- 회원가입 후 결제가 가능합니다.<br/>
	&nbsp;- 정기권 결제 후 자전거 대여가 가능합니다.<br/><br/>
	<lavel>&nbsp; ■ 마일리지 적립 안내</lavel><br/><br/>
	&nbsp;- 회원님의 누적 결제금액에 따라 등급이 조정됩니다.<br/>
	&nbsp;- 적립 된 마일리지는 다음 결제시 1P 단위로 사용가능합니다.<br/>
	&nbsp;- 마일리지는 회원 등급에 따라 다르게 적립됩니다.(아래내용참고)<br/><br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;준회원 : 총 결제금액의 8%<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정회원 : 총 결제금액의 10%<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;우수회원 : 총 결제금액의 15%<br/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;특별회원 : 총 결제금액의 20%<br/>
	</div>
	<div class="col-sm-4">
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
		$("#payment").on("click", function() {
			$(location).attr('href', "/fare_guide/payment");
		});
		
		$("#login").on("click", function() {
			$(location).attr('href', "/member/login");
		});
		
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#signup").on("click", function() {
			$(location).attr('href', "/member/signup");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage");
		});
	})
</script>
</html>