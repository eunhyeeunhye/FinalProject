<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h1 style="color: #BDBDBD">로그인</h1>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row" style="margin-top: 120px">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<form action="/member/doLogin" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="inputName" class="col-md-3 control-label"></label>
				<div class="col-md-9">
					<input type="text" id="m_id" name="m_id" class="form-control" style="width: 80%" placeholder="아이디"/>
				</div>
			</div>
			<div class="form-group">
				<label for="inputName" class="col-md-3 control-label"></label>
				<div class="col-md-9">
					<input type="password" id="m_pw" name="m_pw" class="form-control" style="width: 80%" placeholder="비밀번호"/>
				</div>
			</div>
			<br/>
			<div class="col-md-3"></div>
			<div class="col-md-9">
				<input id="dologin" type="submit" value="로그인" class="btn btn-lg" style="width: 80%" disabled="disabled"/>
			</div>
		</form>
		<br/><br/><br/>
		<a href="/member/signup" style="margin-right: 8%; margin-left: 30%">회원가입</a>
		<a href="#" style="margin-right: 8%">아이디찾기</a>
		<a href="#">비밀번호찾기</a>
		<br/><br/><br/>
		<c:if test="${login eq 'fail'}">
			<span id="loginfail" class="label label-danger" style="margin-left: 40%">아이디 또는 비밀번호가 틀렸습니다.</span>
		</c:if>
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
		$("#m_id").focus();
		
		$("#login").on("click", function() {
			$(location).attr('href', "/member/login");
		});
		
		$("#signup").on("click", function() {
			$(location).attr('href', "/member/signup");
		});
		
		$("#m_id").keyup(function() {
			if($("#m_id").val().length >= 1 && $("#m_pw").val().length >= 1){
				$("#dologin").removeAttr("disabled");
				$("#dologin").addClass("btn-success");
			}
			else{
				$("#dologin").attr("disabled", true);
				$("#dologin").removeClass("btn-success");
			}
		});
		
		$("#m_pw").keyup(function() {
			if($("#m_id").val().length >= 1 && $("#m_pw").val().length >= 1){
				$("#dologin").removeAttr("disabled");
				$("#dologin").addClass("btn-success");
			}
			else{
				$("#dologin").attr("disabled", true);
				$("#dologin").removeClass("btn-success");
			}
		});
	})
</script>
</html>