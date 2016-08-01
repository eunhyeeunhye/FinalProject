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
		background-color:#5cb85c;
		color:#eeeeee
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
  <!-- Nav tabs -->
  <div class="row">
	  <div class="col-sm-2"></div>
	  <div class="col-sm-2" style="background-color: #eeeeee; padding-top:1%; padding-bottom: 20%">
		  <ul class="nav nav-pills nav-stacked" role="tablist">
		    <li role="presentation" class="active"><a href="/service/notice?page=1" aria-controls="notice" role="tab"><span style="font-size: medium">공지사항</span></a></li>
		    <li role="presentation"><a href="/service/faq" aria-controls="faq" role="tab"><span style="color: #aaaaaa; font-size: medium">FAQ</span></a></li>
		    <c:choose>
		    	<c:when test="${member.m_grade == '운영자'}">
		    		<li role="presentation"><a href="/service/adminRequest?page=1" aria-controls="request" role="tab"><span style="color: #aaaaaa; font-size: medium">1:1문의</span></a></li>
		    	</c:when>
		    	<c:otherwise>
		    		<li role="presentation"><a href="/service/request?page=1&m_code=${member.m_code}" aria-controls="request" role="tab"><span style="color: #aaaaaa; font-size: medium">1:1문의</span></a></li>
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