<%@ page contentType="text/html; charset=UTF-8"%>
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
</style>
<script src="/resources/js/jquery-2.2.4.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<body>
<!-- 상단바 시작 -->
<%@include file="../include/header.jsp" %>
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
		    <li role="presentation"><a href="/service/notice?page=1" aria-controls="notice" role="tab"><span style="color: #aaaaaa; font-size: medium">공지사항</span></a></li>
		    <li role="presentation" class="active"><a href="/service/faq" aria-controls="faq" role="tab"><span style="font-size: medium">FAQ</span></a></li>
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
		  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			  <div class="panel panel-default">
			    <div class="panel-heading" role="tab" id="headingOne">
			      <h4 class="panel-title">
			        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          Collapsible Group Item #1
			        </a>
			      </h4>
			    </div>
			    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			      <div class="panel-body">
			        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading" role="tab" id="headingTwo">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			          Collapsible Group Item #2
			        </a>
			      </h4>
			    </div>
			    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
			      <div class="panel-body">
			        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
			      </div>
			    </div>
			  </div>
			  <div class="panel panel-default">
			    <div class="panel-heading" role="tab" id="headingThree">
			      <h4 class="panel-title">
			        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			          Collapsible Group Item #3
			        </a>
			      </h4>
			    </div>
			    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
			      <div class="panel-body">
			        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
			      </div>
			    </div>
			  </div>
			</div>
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