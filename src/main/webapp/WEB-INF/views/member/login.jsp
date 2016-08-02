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
<%@include file="../include/header.jsp" %>
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
<%@include file="../include/footer.jsp" %>
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