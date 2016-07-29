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
			<button type="button" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/info3.png"></c:url>" width="80%" height="12%"></img><br/><br/>이용방법</button>
			<button type="button" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/payment.png"></c:url>" width="80%" height="12%"></img><br/><br/>이용권구매</button>
			<button type="button" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/group3.png"></c:url>" width="80%" height="12%"></img><br/><br/>동호회</button>
			<button type="button" class="btn btn-default" style="width: 25%; font-weight: bold;"><img src="<c:url value="/resources/images/payment3.png"></c:url>" width="80%" height="12%"></img><br/><br/>쿠폰북</button>
		</div>
	</div>
	<div class="col-md-4">
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li id="navtab1" role="presentation" class="active"><a id="tab1" href="#home" aria-controls="home" role="tab" data-toggle="tab">공지사항</a></li>
	    <li id="navtab2" role="presentation"><a id="tab2" href="#profile" aria-controls="profile" role="tab" data-toggle="tab" style="color: #6DD66D">동호회</a></li>
	    <li id="navtab3" role="presentation"><a id="tab3" href="#messages" aria-controls="messages" role="tab" data-toggle="tab" style="color: #6DD66D">FAQ</a></li>
	  </ul>
		<br/>
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="home">
	    	<table class="table table-hover" style="font-size: small">
	    		<tr>
	    			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	 			</tr>
	 			<c:forEach begin="0" end="3" items="${noticeList}" var="list">
		 			<tr>
		 				<td>${list.n_code}</td><td><a href="service/noticeRead?n_code=${list.n_code}">${list.title}</a></td><td>${list.writer}</td><td>${list.regdate}</td>
		 			</tr>
	 			</c:forEach>
	    	</table>
	    </div>
	    <div role="tabpanel" class="tab-pane" id="profile">
	    	<ul>
	    		<li>첫번째 동호회 글</li>
	    		<li>두번째 동호회 글</li>
	    		<li>...</li>
	    	</ul>
	    </div>
	    <div role="tabpanel" class="tab-pane" id="messages">
	    	<ul>
	    		<li>첫번째 FAQ</li>
	    		<li>두번째 FAQ</li>
	    		<li>...</li>
	    	</ul>
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
			$(location).attr('href', "/member/mypage");
		});
		
		var m_code = "<c:out value="${member.m_code}"/>"
		
		if(m_code == 0){
			$("#station").on("click", function() {
				$(location).attr('href', "/search");
			});
		}
		else{
			$("#station").on("click", function() {
				$(location).attr('href', "/search?m_code=${member.m_code}");
			});
		}
		
		$("#navtab1").on("click", function() {
			$("#tab1").css("color", "#555");
			$("#tab2").css("color", "#6DD66D");
			$("#tab3").css("color", "#6DD66D");
		})
		
		$("#navtab2").on("click", function() {
			$("#tab1").css("color", "#6DD66D");
			$("#tab2").css("color", "#555");
			$("#tab3").css("color", "#6DD66D");
		})
		
		$("#navtab3").on("click", function() {
			$("#tab1").css("color", "#6DD66D");
			$("#tab2").css("color", "#6DD66D");
			$("#tab3").css("color", "#555");
		})
	})
</script>
</html>
