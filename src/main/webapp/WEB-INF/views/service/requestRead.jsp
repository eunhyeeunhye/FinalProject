<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
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
		color:#eeeeee
	}
</style>
<script>
	function fnToList(){
		location.href = 'request?m_code=${member.m_code}';
	}
	
	function fnToListAdmin(){
		location.href = 'adminRequest';
	}
	
	function fnAnswer(){
		location.href = "requestAnswer?r_code=${request.r_code}";
	}
</script>
<script src="/resources/js/jquery-2.2.4.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<body>
<!-- 상단바 시작 -->
<%@include file="../include/header.jsp" %>
<div id="wrap">
<!-- 상단바 끝 -->
  <div class="row" style="margin-top: 10px; margin-bottom: 1%">
	  <div class="col-md-2"></div>
	  <div class="col-md-8">
	  	<h1 style="color: #BDBDBD">고객센터</h1>
	  </div>
	  <div class="col-md-2"></div>
  </div>

  <div class="row">
	  <!-- Nav tabs -->
	  <div class="col-sm-2"></div>
	  <div class="col-sm-2" style="background-color: #eeeeee; padding-top:1%; padding-bottom: 20%">
		  <ul class="nav nav-pills nav-stacked" role="tablist">
		    <li role="presentation"><a href="/service/notice?page=1" aria-controls="notice" role="tab"><span style="color: #aaaaaa; font-size: medium">공지사항</span></a></li>
		    <li role="presentation"><a href="/service/faq" aria-controls="faq" role="tab"><span style="color: #aaaaaa; font-size: medium">FAQ</span></a></li>
		    <c:choose>
		    	<c:when test="${member.m_grade == '운영자'}">
		    		<li role="presentation" class="active"><a href="/service/adminRequest?page=1" aria-controls="request" role="tab"><span style="font-size: medium">1:1문의</span></a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li role="presentation" class="active"><a href="/service/request?page=1&m_code=${member.m_code}" aria-controls="request" role="tab"><span style="font-size: medium">1:1문의</span></a></li>
		    	</c:otherwise>
		    </c:choose>
		  </ul>
	  </div>
	  <!-- Tab panes -->
	  <div class="col-sm-6">
	  <form name="form">
	 	  <input type="hidden" name="r_code" value="${request.r_code}" />
		  <table class="table">
		  	<tr>
		  		<th>제목 : ${request.title}</th>
		  	</tr>
		  	<tr>
		  		<td><pre>${request.content}</pre></td>
		  	</tr>
		  	<tr>
		  		<td align="right">
		  			<c:if test="${member.m_grade == '운영자'}">
		  				<button type="button" class="btn" onclick="fnAnswer()">답변달기</button>&nbsp;
		  				<button type="button" class="btn" onclick="fnToListAdmin()">목록으로</button>
		  			</c:if>
		  			<c:if test="${member.m_grade != '운영자'}">
		  				<button type="button" class="btn" onclick="fnToList()">목록으로</button>
		  			</c:if>
		  		</td>
		  	</tr>
		  </table>
	  </form>
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
<script>
	$(document).ready(function() {
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
			$(location).attr('href', "/member/mypage?m_code=${member.m_code}");
		});
	})
</script>
</html>