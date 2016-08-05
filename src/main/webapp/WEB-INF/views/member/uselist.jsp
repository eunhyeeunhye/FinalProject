<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
	작성자 : 이현호
	작성일 : 2016.07.19
	내용 : 이용내역 페이지
	수정내역 : 2016.07.29 자전거 반납 기능 추가
 -->
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
		<h1 style="color: #BDBDBD">마이페이지</h1>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	  <div class="col-md-2"></div>
	  <div class="col-md-2" style="background-color: #eeeeee; padding-top:1%; padding-bottom: 25%">
		  <ul class="nav nav-pills nav-stacked" role="tablist">
		    <li role="presentation"><a href="/member/mypage?m_code=${member.m_code}" aria-controls="myinfo" role="tab"><span style="color: #aaaaaa; font-size: medium">내 정보</span></a></li>
		    <li role="presentation" class="active"><a href="/member/uselist?m_code=${member.m_code}" aria-controls="uselist" role="tab"><span style="font-size: medium">이용내역 / 반납</span></a></li>
		    <li role="presentation"><a href="/member/paylist?m_code=${member.m_code}" aria-controls="paylist" role="tab"><span style="color: #aaaaaa; font-size: medium">결제내역 / 마일리지</span></a></li>
		  </ul>
	  </div>
	  <!-- Tab panes -->
	  <div class="col-md-6">
		  <table class="table table-striped">
		  	<tr>
		  		<th>번호</th><th>이용날짜</th><th>대여 station</th><th>도로명 주소</th><th>자전거 번호</th><th>반납</th>
		  	</tr>
		  	<c:forEach begin="0" end="14" var="list" items="${useList}" varStatus="status">
		  		<c:if test="${list.r_state == 1}">
			  		<tr>
				  		<td>${status.count}</td><td>${list.r_date}</td><td>${list.s_location}</td><td>${list.s_sub_location}</td><td>${list.b_code}</td><td><button id="turnin" class="btn btn-xs btn-success">반납하기</button></td>
				  	</tr>
			  	</c:if>
			  	<c:if test="${list.r_state == 2}">
			  		<tr>
				  		<td>${status.count}</td><td>${list.r_date}</td><td>${list.s_location}</td><td>${list.s_sub_location}</td><td>${list.b_code}</td><td><button class="btn btn-xs" disabled="disabled">반납완료</button></td>
				  	</tr>
			  	</c:if>
		  	</c:forEach>
		  </table>
	  </div>
	  <div class="col-md-2"></div>
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
		$("#signup").on("click", function() {
			$(location).attr('href', "/member/signup");
		});
		
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage?m_code=${member.m_code}");
		});
		
		$("#turnin").on("click", function() {
			var conf = confirm("반납하시겠습니까?");
			if(conf == true){
				$(location).attr('href', "/turnin?m_code=${member.m_code}&b_code=${useList[0].b_code}");
			}
		});
	})
</script>
</body>
</html>