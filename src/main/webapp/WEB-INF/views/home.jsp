<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<html>
<head>
	<title>GreenCycle - Home</title>
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
	
	#carousel.active{
		background-color: #6DD66D;
		border-color: #6DD66D;
	}
	
	#carousel{
		border-color: #6DD66D;
	}
</style>
<body>
<%@include file="include/header.jsp" %>
<div id="wrap">
<div class="row" style="margin-top: 10px">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
			    <li id="carousel" data-target="#myCarousel" data-slide-to="0" class="active"></li>
			    <li id="carousel" data-target="#myCarousel" data-slide-to="1"></li>
			    <li id="carousel" data-target="#myCarousel" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="<c:url value="/resources/images/main1.jpg"></c:url>" alt="main" style="width: 100%; height: 50%;">
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/images/main2.jpg"></c:url>" alt="main" style="width: 100%; height: 50%;">
		    </div>
		    <div class="item">
		      <img src="<c:url value="/resources/images/main3.jpg"></c:url>" alt="main" style="width: 100%; height: 50%;">
		    </div>
		  </div>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<br/>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-4">
		<div class="btn-group" role="group">
			<button type="button" id="station" class="btn btn-success" style="width: 100%; padding: 15px; margin-bottom: 10px; font-size: 25px; font-weight: bold;"><i class="glyphicon glyphicon-map-marker" style="margin-right: 1%"></i>Station 검색 바로가기</button>
			<button type="button" id="service_guide" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/info3.png"></c:url>" width="80%" height="12%"></img><br/><br/>이용방법</button>
			<button type="button" id="fare_guide" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/payment.png"></c:url>" width="80%" height="12%"></img><br/><br/>이용권구매</button>
			<button type="button" id="club" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/group3.png"></c:url>" width="80%" height="12%"></img><br/><br/>동호회</button>
			<button type="button" id="mileage" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/payment3.png"></c:url>" width="80%" height="12%"></img><br/><br/>마일리지</button>
		</div>
	</div>
	<div class="col-md-4">
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li id="navtab1" role="presentation" class="active"><a id="tab1" href="#home" aria-controls="home" role="tab" data-toggle="tab" style="background-color: #5cb85c; color: #eeeeee; border-color: #D8D8D8; border-bottom-color: white">공지사항</a></li>
	    <li id="navtab2" role="presentation"><a id="tab2" href="#profile" aria-controls="profile" role="tab" data-toggle="tab" style="color: #5cb85c; border-color: #D8D8D8; border-bottom-color: white">동호회</a></li>
	    <li id="navtab3" role="presentation"><a id="tab3" href="#messages" aria-controls="messages" role="tab" data-toggle="tab" style="color: #5cb85c; border-color: #D8D8D8; border-bottom-color: white">FAQ</a></li>
	  </ul>
		<br/>
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="home">
	    	<table class="table table-hover" style="font-size: small">
	    		<tr>
	    			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	 			</tr>
	 			<c:forEach begin="0" end="3" items="${noticeList}" var="list" varStatus="status">
		 			<tr>
		 				<td>${status.count}</td><td><a href="service/noticeRead?n_code=${list.n_code}">${list.title}</a></td><td>${list.writer}</td><td>${list.regdate}</td>
		 			</tr>
	 			</c:forEach>
	    	</table>
	    </div>
	    <div role="tabpanel" class="tab-pane" id="profile">
	    	<table class="table table-hover" style="font-size: small">
	    		<tr>
	    			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	 			</tr>
	 			<c:forEach begin="0" end="3" items="${clubList}" var="list" varStatus="status">
		 			<tr>
		 				<td>${status.count}</td><td><a href="club/read?bno=${list.bno}">${list.title}</a></td><td>${writer[status.index]}</td><td>${list.regdate}</td>
		 			</tr>
	 			</c:forEach>
	    	</table>
	    </div>
	    <div role="tabpanel" class="tab-pane" id="messages">
	    	<table class="table table-hover" style="font-size: small">
	    		<tr>
	    			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	 			</tr>
	 			<tr>
	 				<td>1</td><td><a href="service/faq">[스테이션] 스테이션은 무엇이며 어디에 있나요?</a></td><td>운영자</td><td>2016-08-01</td>
	 			</tr>
	 			<tr>
	 				<td>2</td><td><a href="service/faq">[결제] Green Cycle 자전거 이용 비용은?</a></td><td>운영자</td><td>2016-08-01</td>
	 			</tr>
	 			<tr>
	 				<td>3</td><td><a href="service/faq">[홈페이지] 홈페이지 회원가입은 왜 하나요?</a></td><td>운영자</td><td>2016-08-01</td>
	 			</tr>
	 			<tr>
	 				<td>4</td><td><a href="service/faq">[마일리지] 마일리지는 어떻게 적용되나요?</a></td><td>운영자</td><td>2016-08-03</td>
	 			</tr>
	    	</table>
	    </div>
	  </div>
	</div>
	<div class="col-md-2"></div>
</div>
</div>
<%@include file="include/footer.jsp" %>
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
		
		$("#service_guide").on("click", function() {
			$(location).attr('href', "/service_guide/HowToUse");
		});
		
		$("#club").on("click", function() {
			$(location).attr('href', "/open/club");
		});
		
		var m_code = "<c:out value="${member.m_code}"/>"
		
		$("#fare_guide").on("click", function() {
			if(m_code == 0){
				$(location).attr('href', "/member/login");
			}
			else{
				$(location).attr('href', "/fare_guide/payment");
			}
		});
		
		$("#mileage").on("click", function() {
			if(m_code == 0){
				$(location).attr('href', "/member/login");
			}
			else{
				$(location).attr('href', "/member/paylist?m_code=" + m_code);
			}
		});
		
		$("#station").on("click", function() {
			if(m_code == 0){
				$(location).attr('href', "/search");
			}
			else{
				$(location).attr('href', "/search?m_code=${member.m_code}");
			}
		});
		
		$("#navtab1").on("click", function() {
			$("#tab1").css("color", "#eeeeee").css("background-color", "#5cb85c");
			$("#tab2").css("color", "#5cb85c").css("background-color", "white");
			$("#tab3").css("color", "#5cb85c").css("background-color", "white");
		})
		
		$("#navtab2").on("click", function() {
			$("#tab1").css("color", "#5cb85c").css("background-color", "white");
			$("#tab2").css("color", "#eeeeee").css("background-color", "#5cb85c");
			$("#tab3").css("color", "#5cb85c").css("background-color", "white");
		})
		
		$("#navtab3").on("click", function() {
			$("#tab1").css("color", "#5cb85c").css("background-color", "white");
			$("#tab2").css("color", "#5cb85c").css("background-color", "white");
			$("#tab3").css("color", "#eeeeee").css("background-color", "#5cb85c");
		})
	})
</script>
</html>
