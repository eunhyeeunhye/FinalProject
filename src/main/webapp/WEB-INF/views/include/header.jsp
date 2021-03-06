<!-- 
	작성자 : 이현호
	작성일 : 2016.07.19
	내용 : 헤더(상단바)
	수정내역 :
 -->
<%@ page contentType="text/html; charset=UTF-8" %>
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
		      <a class="navbar-brand" href="/"><img alt="Brand" src="<c:url value="/resources/images/logo2.png"></c:url>" style="width: 130%; height: auto; margin-top: 18px"></img></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div id="nav" class="collapse navbar-collapse">
		      <ul class="nav navbar-nav">
		        <li><a href="/service_guide/AboutUs">서비스안내</a></li>
		        <li><a href="/fare_guide/fareGuide">요금안내</a></li>
		        <li><a href="/service/notice?page=1">고객센터</a></li>
		        <c:choose>
			        <c:when test="${member == null}">
			        	<li><a href="/search" style="color: #6DD66D">Station찾기/예약</a></li>
			        	<li><a href="/member/login" style="color: #6DD66D">마이페이지</a></li>
			        </c:when>
			        <c:when test="${member != null}">
			        	<li><a href="/search?m_code=${member.m_code}" style="color: #6DD66D">Station찾기/예약</a></li>
			        	<li><a href="/member/mypage?m_code=${member.m_code}" style="color: #6DD66D">마이페이지</a></li>
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