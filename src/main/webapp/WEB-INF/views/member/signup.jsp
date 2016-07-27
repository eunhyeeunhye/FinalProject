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
		        <li><a href="#">고객센터</a></li>
		        <li><a href="#" style="color: #6DD66D">Station찾기/예약</a></li>
		        <li><a href="/member/login" style="color: #6DD66D">마이페이지</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	<li><button id="signup" type="button" class="btn btn-default btn-xs" style="margin-top: 15px">회원가입</button>&nbsp;</li>
		        <li><button id="login" type="button" class="btn btn-default btn-xs" style="margin-top: 15px">로그인</button></li>
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
<div class="row" style="margin-top: 10px">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1 style="color: #BDBDBD">회원가입</h1>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row" style="margin-top: 120px">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form action="/member/doSignup" method="post" class="form-horizontal">
			<div id="m_name_form" class="form-group">
				<label for="m_name" class="col-md-3 control-label">이름</label>
				<div class="col-md-7">
					<input type="text" id="m_name" name="m_name" class="form-control" style="width: 100%" placeholder="이름"/>
				</div>
				<span class="col-md-2"></span>
			</div>
			<div id="m_id_form" class="form-group">
				<label for="m_id" class="col-md-3 control-label">아이디</label>
				<div class="col-md-7">
					<input type="text" id="m_id" name="m_id" class="form-control" style="width: 100%" placeholder="아이디"/>
				</div>
				<span id="idcheck" class="col-md-2"></span>
			</div>
			<div id="m_pw_form" class="form-group">
				<label for="m_pw" class="col-md-3 control-label">비밀번호</label>
				<div class="col-md-7">
					<input type="password" id="m_pw" name="m_pw" class="form-control" style="width: 100%" placeholder="비밀번호"/>
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
			<br/>
			<div class="col-md-3"></div>
			<div class="col-md-9">
				<button id="dosignup" type="submit" class="btn btn-lg" style="width: 80%" disabled="disabled">회원가입</button>
			</div>
		</form>
	</div>
	<div class="col-md-4"></div>
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
</body>
<script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
<script>
	$(document).ready(function() {
		$("#m_name").focus();
		
		$("#login").on("click", function() {
			$(location).attr('href', "/member/login");
		});
		
		$("#signup").on("click", function() {
			$(location).attr('href', "/member/signup");
		});
		
		// 이름 검사
		$("#m_name").keyup(function() {
			if($("#m_name").val().length >= 1){
				$("#m_name_form").addClass("has-success");
			}
			else{
				$("#m_name_form").removeClass("has-success");
			}
			
			// 전체 검사
			if($("#m_name_form").hasClass("has-success") && $("#m_id_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-warning");
					$("#dosignup").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-success");
					$("#dosignup").addClass("btn-warning");
				}
			}
			else{
				$("#dosignup").removeClass("btn-warning");
				$("#dosignup").removeClass("btn-success");
				$("#dosignup").attr("disabled", true);
			}
		})
		
		// 아이디 중복 검사
		$("#m_id").keyup(function() {
			if($("#m_id").val().length >= 6) {
				$.ajax({
					type:"POST",
					url:"/member/idCheck",
					data:{
						m_id:$("#m_id").val()
					},
					success:function(result){
						if(result=='{"result":"yes"}'){
							$("#idcheck").html('<span class="label label-success">사용가능한 아이디</span>');
							$("#m_id_form").removeClass("has-error");
							$("#m_id_form").addClass("has-success");
						}
						else{
							$("#idcheck").html('<span class="label label-danger">이미 사용중인 아이디</span>');
							$("#m_id_form").removeClass("has-success");
							$("#m_id_form").addClass("has-error");
						}
					}
				})
			}
			else if($("#m_id").val().length >= 1){
				$("#idcheck").html('<span class="label label-danger">6글자 이상 입력</span>');
				$("#m_id_form").removeClass("has-success");
				$("#m_id_form").addClass("has-error");
			}
			else{
				$("#idcheck").html('');
				$("#m_id_form").removeClass("has-success");
				$("#m_id_form").removeClass("has-error");
			}
			
			// 전체 검사
			if($("#m_name_form").hasClass("has-success") && $("#m_id_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-warning");
					$("#dosignup").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-success");
					$("#dosignup").addClass("btn-warning");
				}
			}
			else{
				$("#dosignup").removeClass("btn-warning");
				$("#dosignup").removeClass("btn-success");
				$("#dosignup").attr("disabled", true);
			}
		});
		
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
			if($("#m_name_form").hasClass("has-success") && $("#m_id_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-warning");
					$("#dosignup").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-success");
					$("#dosignup").addClass("btn-warning");
				}
			}
			else{
				$("#dosignup").removeClass("btn-warning");
				$("#dosignup").removeClass("btn-success");
				$("#dosignup").attr("disabled", true);
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
			if($("#m_name_form").hasClass("has-success") && $("#m_id_form").hasClass("has-success") && $("#m_pw2_form").hasClass("has-success")){
				if($("#m_pw_form").hasClass("has-success")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-warning");
					$("#dosignup").addClass("btn-success");
				}
				else if($("#m_pw_form").hasClass("has-warning")){
					$("#dosignup").removeAttr("disabled");
					$("#dosignup").removeClass("btn-success");
					$("#dosignup").addClass("btn-warning");
				}
			}
			else{
				$("#dosignup").removeClass("btn-warning");
				$("#dosignup").removeClass("btn-success");
				$("#dosignup").attr("disabled", true);
			}
		})
	})
</script>
</html>