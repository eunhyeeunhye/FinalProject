<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<!-- 
	작성자 : 강인영
	작성일 : 2016.07.19
	내용 : 결제 완료 페이지
	수정내역 : 2016.08.04 HOME 버튼 추가
 -->
<html>
<head>
	<title>이용권 구매</title>
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
		<div class="col-sm-2"
			style="background-color: #eeeeee; padding-top: 1%; padding-bottom: 20%">
			<ul class="nav nav-pills nav-stacked" role="tablist">
				<li role="presentation"><a href="/fare_guide/fareGuide" aria-controls="notice" role="tab">
					<span style="color: #aaaaaa; font-size: medium">요금안내</span></a></li>
				<li role="presentation" class="active"><a href="/fare_guide/payment?m_code=${member.m_code}" aria-controls="notice" role="tab">
					<span style="font-size: medium">이용권구매</span></a></li>
			</ul>
		</div>
		<div class="col-sm-4 text-center">
		<br/>
			<h3 style="color: #aaaaaa; font-size:xlarge">결제가 완료되었습니다!</h3><br/>
			<input type="hidden" name="m_code" value="${member.m_code}" />
			<table class="table table-hover">
				<tr>
					<td><b>"${member.m_name}"회원님께서 결제한 정보입니다.</b></td><td></td>
				</tr>
				<tr>
					<td>이용기간</td><td>${payInfo.p_period}일</td>
				</tr>
				<tr>
					<td>결제수단</td><td>${payInfo.p_means}</td>
				</tr>
				<tr>
					<td>사용 한 마일리지</td><td>${payInfo.usemileage} P</td>
				</tr>
				<tr>
					<td>적립 된 마일리지</td><td>${payInfo.savemileage} P</td>
				</tr>
				<tr>
					<td><b>최종결제금액</b></td><td><b>${payInfo.p_money} 원</b></td>
				</tr>
			</table>
			<div class="text-right">
			  	<button type="button" class="btn btn-success btn-s" id="paylist" style="margin-top: 15px">
			  	<span style="font-size: medium">결제내역조회</span></button>
			  	<button type="button" class="btn btn-success btn-s" id="goinghome" style="margin-top: 15px">
			  	<span style="font-size: medium">Home</span></button>
			</div>
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
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage");
		});
		
		$("#paylist").on("click", function() {
			$(location).attr('href', "/member/paylist?m_code=${member.m_code}");
		});

		$("#goinghome").on("click", function() {
			$(location).attr('href', "/");
		});
	})
</script>
</html>