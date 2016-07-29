<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		background-color:#eeeeee;
		color:#5cb85c;
	}
	
	.col-sm-6{
		text-align: center;
	}
</style>
<script src="/resources/js/jquery-2.2.4.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script>
	function fnNotice(){
		location.href='noticeWrite';
	}
</script>
<body>
<!-- 상단바 시작 -->
<div class="row">
	<div class="col-md-12" style="height:10px; background-color: #6DD66D"></div>
</div>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<nav class="navbar navbar-default" style="border-color: white">
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
		        <li><a href="/service/notice?page=1">고객센터</a></li>
		        <li><a href="/search" style="color: #6DD66D">Station찾기/예약</a></li>
		        <c:choose>
			        <c:when test="${member == null}">
			        	<li><a href="/member/login" style="color: #6DD66D">마이페이지</a></li>
			        </c:when>
			        <c:when test="${member != null}">
			        	<li><a href="/member/mypage" style="color: #6DD66D">마이페이지</a></li>
			        </c:when>
		        </c:choose>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		      	<c:choose>
		      		<c:when test="${member == null}">
		      			<li><button id="signup" type="button" class="btn btn-default btn-xs" style="margin-top: 15px">회원가입</button>&nbsp;</li>
		      			<li><button id="login" type="button" class="btn btn-default btn-xs" style="margin-top: 15px">로그인</button></li>
		      		</c:when>
		      		<c:when test="${member != null}">
		      			<li><button id="mypage" type="button" class="btn btn-success btn-xs" style="margin-top: 15px">${member.m_name}님, 안녕하세요!</button>&nbsp;</li>
		        		<li><button id="logout" type="button" class="btn btn-default btn-xs" style="margin-top: 15px" data-toggle="modal" data-target="#logoutmodal">로그아웃</button></li>
		      		</c:when>
		      	</c:choose>
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
<!-- 상단바 끝 -->
  <div class="row" style="margin-bottom: 1%">
	  <div class="col-md-2"></div>
	  <div class="col-md-8">
	  	<h1>고객센터</h1>
	  </div>
	  <div class="col-md-2"></div>
  </div>
  <!-- Nav tabs -->
  <div class="row">
	  <div class="col-sm-2"></div>
	  <div class="col-sm-2" style="background-color: #eeeeee; padding-top:1%; padding-bottom: 20%">
		  <ul class="nav nav-pills nav-stacked" role="tablist">
		    <li role="presentation" class="active"><a href="/service/notice?page=1" aria-controls="notice" role="tab"><span style="font-size: medium">공지사항</span></a></li>
		    <li role="presentation"><a href="/service/faq" aria-controls="faq" role="tab"><span style="color: #aaaaaa; font-size: medium">FAQ</span></a></li>
		    <c:choose>
		    	<c:when test="${member.m_grade == '운영자'}">
		    		<li role="presentation" class="active"><a href="/service/adminRequest?page=1" aria-controls="request" role="tab"><span style="color: #aaaaaa; font-size: medium">1:1문의</span></a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li role="presentation" class="active"><a href="/service/request?page=1&m_code=${member.m_code}" aria-controls="request" role="tab"><span style="color: #aaaaaa; font-size: medium">1:1문의</span></a></li>
		    	</c:otherwise>
		    </c:choose>
		  </ul>
	  </div>
	  <!-- Tab panes -->
	  <div class="col-sm-6">
		  <table class="table table-striped">
		  	<tr style="font-weight: bold">
		  		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td>
		  	</tr>
		  	<c:if test="${pageVO.numPerPage*pageVO.page-1 >= fn:length(noticeList)}">
		  		<c:set var="finalData" value="${fn:length(noticeList)}"/>
		  	</c:if>
		  	<c:if test="${pageVO.numPerPage*pageVO.page-1 < fn:length(noticeList)}">
		  		<c:set var="finalData" value="${pageVO.numPerPage*pageVO.page}"/>
		  	</c:if>
		  	<c:forEach var="i" begin="${pageVO.startPerPage}" end="${finalData}">
		  		<tr>
		  			<td>${noticeList[i-1].n_code}</td>
		  			<td><a href="noticeRead?n_code=${noticeList[i-1].n_code}">${noticeList[i-1].title}</a></td>
		  			<td>${noticeList[i-1].writer}</td>
		  			<td>${noticeList[i-1].regdate}</td>
		  		</tr>
		  	</c:forEach>
		  	<c:if test="${member.m_grade == '운영자'}">
			  	<tr>
			  		<td align="center" colspan="4" style="background-color: #ffffff"><button type="button" class="btn btn-success" onclick="fnNotice()">글작성</button></td>
			  	</tr>
		  	</c:if>
		  </table>
		  
			<nav aria-label="Page navigation" >
			  <ul class="pagination">
			    <c:if test="${pageVO.nowBlock eq 1}">
				    <li class="disabled">
				        <span aria-hidden="true">&laquo;</span>
				    </li>
			    </c:if>
			    <c:if test="${pageVO.nowBlock != 1}">
				    <li>
				      <a href="notice?page=${pageVO.startPagePerBlock-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    <c:if test="${pageVO.pagePerBlock*pageVO.nowBlock >= pageVO.totalPage}">
			    	<c:set var="finalPage" value="${pageVO.totalPage}" />
			    </c:if>
			    <c:if test="${pageVO.pagePerBlock*pageVO.nowBlock < pageVO.totalPage}">
			    	<c:set var="finalPage" value="${pageVO.pagePerBlock*pageVO.nowBlock}" />
			    </c:if>
			    <c:forEach var="i" begin="${pageVO.startPagePerBlock}" end="${finalPage}">
			    	<c:if test="${pageVO.page eq i}">
			    		<li class="active"><a href="notice?page=${i}">${i}</a></li>
			    	</c:if>
			    	<c:if test="${pageVO.page != i}">
			    		<li><a href="notice?page=${i}">${i}</a></li>
			    	</c:if>
			    </c:forEach>
			    <c:if test="${pageVO.nowBlock eq pageVO.totalBlock}">
				    <li class="disabled">
				        <span aria-hidden="true">&raquo;</span>
				    </li>
			    </c:if>
			    <c:if test="${pageVO.nowBlock != pageVO.totalBlock}">
				    <li>
				      <a href="notice?page=${finalPage+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
	  </div>
	  <div class="col-md-2"></div>
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
			$(location).attr('href', "/member/mypage");
		});
		
		$("#station").on("click", function() {
			$(location).attr('href', "/search");
		});
		
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