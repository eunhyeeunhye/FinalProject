<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>CLUB_WRITE</title>
</head>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"></c:url>" />
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
	<%@include file="../include/header2.jsp" %>


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
						<li><a href="#">동아리 개설 취지</a></li>
					</ul>
					<ul class="nav navbar-right">
						<li><a href="#">동아리 개설하기</a></li>
					</ul>

				</div>
			</div>



		</div>

		<div class="col-md-2"></div>
	</div>
	<!-- 상단바 -->



	<div class="col-md-12" style="height: 2px; background-color: #D5D5D5"></div>


	<div class="form-group">
		<div class="col-md-4"></div>
		<div class="col-md-5">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">변경하기</h3>
				</div>

				
				<form role="form" method = "post" >
					<input type = "hidden" name = "bno" value ="${boardVO.bno }">
				
				
					<div class="box-body">
						<div class="form-group">
							<label for="title">제목</label> 
							<input type="text" name='title' class="form-control" value = "${boardVO.title }" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" name="content" rows="16"
								>${boardVO.content }</textarea>
						</div>
						<div class="form-group">
							<label for="writer">작성자</label>
							<textarea class="form-control" name="writer"
								 readonly="readonly">${boardVO.m_code}</textarea>
						</div>
					</div>


					
				</form>

				<div class="box-footer">
						<button id="writing" type="submit" class="btn btn-primary">작성</button>
						<button type="submit" class="btn btn-default">취소</button>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
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

	$(document).ready(function(){
		
		/*$("#writing").on("click", function(){
			$(location).attr('href',"/club/write");
		})
		8*/
		
		var formObj = $("form[role='form']");
		$(".btn-primary").on("click", function(){
			formObj.attr("action", "/club/modify");
			formObj.attr("method", "POST");
			formObj.submit();
			
		});
		
		
		$(".btn-default").on("click", function(){
			formObj.attr("action", "/myclub/go");
			formObj.attr("method","GET");
			formObj.submit();
		});
		
		/*
		var formObj = $("form[role='form']");
		
		$(".btn-primary").on("click", function(){
			formObj.submit();
		});
		$(".btn-default").on("click", function(){
			self.location = "/club/info";
		});
		*/
		
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage");
		});
	});

</script>
</html>