<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<style>
	#nav{
		background-color: white;
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
<script>
	function fnDelete(){
		var question = confirm("삭제하시겠습니까?");
		if(question == true){
			document.form.submit();
		}
		else{
			return;
		}
	}
	
	function fnList(){
		location.href = "notice";
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
		<nav class="navbar navbar-default" style="border-color: white;">
		  <div id="nav" class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header" style="margin-right: 80px;">
		      <a class="navbar-brand" href="#" style="color: #6DD66D">Green Cycle</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li><a href="#">서비스안내</a></li>
		        <li><a href="#">요금안내</a></li>
		        <li><a href="#">고객센터</a></li>
		        <li><a href="#" style="color: #6DD66D">Station찾기/예약</a></li>
		        <li><a href="#" style="color: #6DD66D">마이페이지</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><button type="button" class="btn btn-default btn-xs" style="margin-top: 15px">로그인</button>&nbsp;</li>
		        <li><button type="button" class="btn btn-default btn-xs" style="margin-top: 15px">회원가입</button></li>
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
<!-- 상단바 끝 -->
  <div class="row" style="margin-bottom: 1%">
	  <div class="col-md-2"></div>
	  <div class="col-md-8">
	  	<h1>고객센터</h1>
	  </div>
	  <div class="col-md-2"></div>
  </div>

  <div class="row">
	  <!-- Nav tabs -->
	  <div class="col-sm-2"></div>
	  <div class="col-sm-2" style="background-color: #eeeeee; padding-top:1%; padding-bottom: 20%">
		  <ul class="nav nav-pills nav-stacked" role="tablist">
		    <li role="presentation" class="active"><a href="/service/notice?page=1" aria-controls="notice" role="tab"><span style="font-size: medium">공지사항</span></a></li>
		    <li role="presentation"><a href="/service/faq" aria-controls="faq" role="tab"><span style="color: #aaaaaa; font-size: medium">FAQ</span></a></li>
		    <li role="presentation"><a href="/service/request?page=1" aria-controls="request" role="tab"><span style="color: #aaaaaa; font-size: medium">1:1문의</span></a></li>
		  </ul>
	  </div>
	  <!-- Tab panes -->
	  <div class="col-sm-6">
	  <form name="form" action="noticeDelete">
	 	  <input type="hidden" name="n_code" value="${notice.n_code}" />
		  <table class="table">
		  	<tr>
		  		<th>제목 : ${notice.title}</th>
		  	</tr>
		  	<tr>
		  		<td><pre>${notice.content}</pre></td>
		  	</tr>
		  	<tr>
		  		<td align="right">
		  			<button type="button" class="btn" onclick="fnDelete()">삭제</button>
		  			<button type="button" class="btn" onclick="fnList()">목록으로</button>
		  		</td>
		  	</tr>
		  </table>
	  </form>
	  </div>
	  <div class="col-md-2"></div>
  </div>
<script src="/resources/js/jquery-2.2.4.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>