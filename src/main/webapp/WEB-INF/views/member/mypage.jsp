<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
	작성자 : 이현호
	작성일 : 2016.07.19
	내용 : 마이페이지(내 정보)
	수정내역 : 2016.08.01 내 동아리 정보 추가
			2016.08.02 내 마일리지, 정기권 정보 추가
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
		    <li role="presentation" class="active"><a href="/member/mypage" aria-controls="myinfo" role="tab"><span style="font-size: medium">내 정보</span></a></li>
		    <li role="presentation"><a href="/member/uselist?m_code=${member.m_code}" aria-controls="uselist" role="tab"><span style="color: #aaaaaa; font-size: medium">이용내역 / 반납</span></a></li>
		    <li role="presentation"><a href="/member/paylist?m_code=${member.m_code}" aria-controls="paylist" role="tab"><span style="color: #aaaaaa; font-size: medium">결제내역 / 마일리지</span></a></li>
		  </ul>
	  </div>
	  <!-- Tab panes -->
	  <div class="col-md-4">
	  		<h2 style="color: #BDBDBD;">개인정보</h2>
	  		<hr/>
		  <form action="/member/doupdate" method="post" class="form-horizontal">
			<input type="hidden" name="m_code" value="${member.m_code}"/>
			<div id="m_name_form" class="form-group">
				<label for="m_name" class="col-md-3 control-label">이름</label>
				<div class="col-md-7">
					<input type="text" id="m_name" name="m_name" class="form-control" style="width: 100%" placeholder="변경할 이름" value="${member.m_name}"/>
				</div>
				<span class="col-md-2"></span>
			</div>
			<div id="m_id_form" class="form-group">
				<label for="m_id" class="col-md-3 control-label">아이디</label>
				<div class="col-md-7">
					<input type="text" id="m_id" name="m_id" class="form-control" style="width: 100%" placeholder="아이디" disabled="disabled" value="${member.m_id}"/>
				</div>
			</div>
			<div id="m_pw_form" class="form-group">
				<label for="m_pw" class="col-md-3 control-label">비밀번호</label>
				<div class="col-md-7">
					<input type="password" id="m_pw" name="m_pw" class="form-control" style="width: 100%" placeholder="변경할 비밀번호"/>
				</div>
				<span id="pwcheck" class="col-md-2"></span>
			</div>
			<div id="m_pw2_form" class="form-group">
				<label for="m_pw2" class="col-md-3 control-label">비밀번호 확인</label>
				<div class="col-md-7">
					<input type="password" id="m_pw2" name="m_pw2" class="form-control" style="width: 100%" placeholder="비밀번호 확인"/>
				</div>
				<span id="pwcheck2" class="col-md-2"></span>
			</div>
			<div id="m_mileage_form" class="form-group">
				<label for="m_mileage" class="col-md-3 control-label">보유 마일리지</label>
				<div class="col-md-7">
					<input type="text" id="m_mileage" name="m_mileage" class="form-control" style="width: 100%" placeholder="마일리지" disabled="disabled" value="${myMileage}P"/>
				</div>
			</div>
			<div id="m_use_form" class="form-group">
				<label for="m_use" class="col-md-3 control-label">사용중인 이용권</label>
				<div class="col-md-7">
					<c:if test="${payList[0].p_period != null}">
						<input type="text" id="m_use" name="m_use" class="form-control" style="width: 100%" disabled="disabled" value="${payList[0].p_period}일권 / 결제날짜 : ${p_date}"/>
					</c:if>
					<c:if test="${payList[0].p_period == null}">
						<input type="text" id="m_use" name="m_use" class="form-control" style="width: 100%" placeholder="없음" disabled="disabled"/>
					</c:if>
				</div>
			</div>
			<br/>
			<div class="col-md-3"></div>
			<div class="col-md-9">
				<button id="doupdate" type="submit" class="btn" style="width: 80%" disabled="disabled">수정하기</button>
			</div>
		</form>
		<br/><br/>
	  	<hr/>
	  	<div class="panel panel-success">
	  		<div class="panel-heading">
				<h3 class="panel-title">내가 가입한 동호회</h3>
			</div>
			<table class="table">
				<tr>
					<th>동호회 이름</th><th>동호회 개설 목적</th><th>개설일</th>
				</tr>
				<c:if test="${myclub1 != null}">
					<tr>
						<td><a href="#">${myclub1.name}</a></td><td>${myclub1.purpose}</td><td>${myclub1.regdate}</td>
					</tr>
				</c:if>
				<c:forEach items="${myclub2}" var="list">
					<tr>
						<td><a href="#">${list.name}</a></td><td>${list.purpose}</td><td>${list.regdate}</td>
					</tr>
				</c:forEach>
			</table>
	  	</div>
	  </div>
	  <div class="col-md-4"></div>
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
		$("#m_name").focus();
		
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage?m_code=${member.m_code}");
		});
		
		// 이름 검사
		$("#m_name").blur(function() {
			if($("#m_name").val().length >= 1){
				$("#m_name_form").addClass("has-success");
			}
			else{
				$("#m_name_form").removeClass("has-success");
			}
			
			// 전체 검사
			if($("#m_name_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#doupdate").removeAttr("disabled");
					$("#doupdate").removeClass("btn-warning");
					$("#doupdate").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#doupdate").removeAttr("disabled");
					$("#doupdate").removeClass("btn-success");
					$("#doupdate").addClass("btn-warning");
				}
			}
			else{
				$("#doupdate").removeClass("btn-warning");
				$("#doupdate").removeClass("btn-success");
				$("#doupdate").attr("disabled", true);
			}
		})
		
		// 비밀번호 길이 검사
		$("#m_pw").keyup(function() {
			if($("#m_pw").val().length >= 6) {
				if($("#m_pw").val().length >= 10){
					$("#pwcheck").html('<span class="label label-success">보안등급 높음</span>');
					$("#m_pw_form").removeClass("has-error");
					$("#m_pw_form").removeClass("has-warning");
					$("#m_pw_form").addClass("has-success");
				}
				else{
					$("#pwcheck").html('<span class="label label-warning">보안등급 낮음</span>');
					$("#m_pw_form").removeClass("has-error");
					$("#m_pw_form").removeClass("has-success");
					$("#m_pw_form").addClass("has-warning");
				}
			}
			else if($("#m_pw").val().length >= 1){
				$("#pwcheck").html('<span class="label label-danger">6글자 이상 입력</span>');
				$("#m_pw_form").removeClass("has-success");
				$("#m_pw_form").removeClass("has-warning");
				$("#m_pw_form").addClass("has-error");
			}
			else{
				$("#pwcheck").html('');
				$("#m_pw_form").removeClass("has-success");
				$("#m_pw_form").removeClass("has-warning");
				$("#m_pw_form").removeClass("has-error");
			}

			// 비밀번호 확인 일치 검사
			if($("#m_pw2").val().length >= 1) {
				if($("#m_pw").val() == $("#m_pw2").val()){
					$("#pwcheck2").html('<span class="label label-success">비밀번호 일치</span>');
					$("#m_pw2_form").removeClass("has-error");
					$("#m_pw2_form").addClass("has-success");
				}
				else{
					$("#pwcheck2").html('<span class="label label-danger">비밀번호 불일치</span>');
					$("#m_pw2_form").removeClass("has-success");
					$("#m_pw2_form").addClass("has-error");
				}
			}
			
			// 전체 검사
			if($("#m_name_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#doupdate").removeAttr("disabled");
					$("#doupdate").removeClass("btn-warning");
					$("#doupdate").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#doupdate").removeAttr("disabled");
					$("#doupdate").removeClass("btn-success");
					$("#doupdate").addClass("btn-warning");
				}
			}
			else{
				$("#doupdate").removeClass("btn-warning");
				$("#doupdate").removeClass("btn-success");
				$("#doupdate").attr("disabled", true);
			}
		})
		
		// 비밀번호 확인 일치 검사
		$("#m_pw2").keyup(function() {
			if($("#m_pw2").val().length >= 1) {
				if($("#m_pw").val() == $("#m_pw2").val()){
					$("#pwcheck2").html('<span class="label label-success">비밀번호 일치</span>');
					$("#m_pw2_form").removeClass("has-error");
					$("#m_pw2_form").addClass("has-success");
				}
				else{
					$("#pwcheck2").html('<span class="label label-danger">비밀번호 불일치</span>');
					$("#m_pw2_form").removeClass("has-success");
					$("#m_pw2_form").addClass("has-error");
				}
			}
			else{
				$("#pwcheck2").html('');
				$("#m_pw2_form").removeClass("has-success");
				$("#m_pw2_form").removeClass("has-error");
			}
			
			// 전체 검사
			if($("#m_name_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#doupdate").removeAttr("disabled");
					$("#doupdate").removeClass("btn-warning");
					$("#doupdate").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#doupdate").removeAttr("disabled");
					$("#doupdate").removeClass("btn-success");
					$("#doupdate").addClass("btn-warning");
				}
			}
			else{
				$("#doupdate").removeClass("btn-warning");
				$("#doupdate").removeClass("btn-success");
				$("#doupdate").attr("disabled", true);
			}
		})
	})
</script>
</body>
</html>