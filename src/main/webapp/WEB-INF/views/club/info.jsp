<!-- 
 1. 작성자 : 최은혜
 2. 작성일 : 2016.07.24
 3. 내용 : 동아리 정보 페이지로서 사용자가 선택한 동아리에 가입했는지 여부 확인해서 글 작성 가능/불가능 나눔
 4. 수정내역 : 	2016.07.28

 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>CLUB_INFO</title>
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
	<%@include file="../include/header.jsp" %>


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
						<li><a href="/club/introduce">동아리란?</a></li>
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
	<div class="middle">



		<div class="col-md-12">
			<div class="title">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<h2>${g_name}</h2>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="tab">
				<div class="col-md-3"></div>
				<div class="col-md-6"
					style="heigt: 1.5px; background-color: #D5D5D5"></div>
				<div class="col-md-3"></div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="menu">
				<div class="col-md-3"></div>
				<div class="col-md-1">
					<br/>
					<ul>
						<c:forEach items="${group }" var="gboard">
							<li>
								<h4><a href="/myclub/go?g_code=${gboard.g_code}&b_code=${gboard.b_code}">${gboard.b_name}</a></h4>
							</li>
						</c:forEach>
					</ul>
					



				</div>


				<div class="col-md-5">
					<h3>게시판</h3>
					<form role = "form" method = "post">
						<input type = "hidden" name ="g_code" value = {boardVO.g_code}>
					</form>

					<table class="table table-striped">
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
						</tr>
						<c:forEach items="${list2 }" var="board" varStatus="status">
							<tr>
								<td>${board.bno }</td>
								<td><a href='/club/read?bno=${board.bno }'>${board.title }</a></td>
								<td>${writer[status.index]}</td>
								<td>${board.regdate}</td>
							</tr>
						</c:forEach>
						<!-- <tr>
							<td>안녕하세욤</td>
							<td>으네</td>
							<td>2016-07-19</td>
						</tr>
						<tr>
							<td>이렇게 하면되나요?</td>
							<td>user2</td>
							<td>2016-07-12</td>
						</tr>
						<tr>
							<td>게시판 입니까?</td>
							<td>user3</td>
							<td>2016-07-13</td>
						</tr>
						<tr>
							<td>이번주엔 이곳으로 하이킹을 다녀왔어요</td>
							<td>user4</td>
							<td>2016-07-21</td>
						</tr>
						 -->
					</table>
					<div class="form-group">
						<div class="col-sm-offset-2">
							<div class="col-sm-2">
								<button id="write" type="button" class="btn btn-primary">글쓰기</button>

							</div>
							<div class="col-sm-2">
								<button id="join" type="button" class="btn btn-default">가입하기</button>

							</div>
							<!-- 
							<div class="col-sm-2">
								<button id = "read" type="button" class="btn btn-primary">읽기</button>
								
							</div>
							 -->
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>


			</div>
		</div>
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
		var m_code = "<c:out value="${member.m_code}"/>"
		
		$("#write").on("click", function(){
			<!--$(location).attr('href', "/club/write?g_code=${g_code}");-->
			if(m_code != 0){
				$.ajax({
					type:"POST",
					url:"/member/check",
					data:{
						g_code:"${g_code}",
						m_code:"${member.m_code}",
					},
					success:function(result){
						if(result=='{"result":"yes"}'){
							$(location).attr('href', "/club/write?g_code=${g_code}");
						}
						else{
							alert("동아리에 가입을 하셔야 해용");
						}
					}
					
				})
			}
			else{
				alert("로그인을 하셔야 해용");
			}
			
		});
		/*
		$("#read").on("click", function(){
			$(location).attr('href', "/club/read");
		});
		*/
		$("#join").on("click", function(){
			if(m_code != 0){
				$(location).attr('href', "/club/join?g_code=${g_code}");
			}
			else{
				alert("로그인을 하셔야 해용");
			}
		})
		
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage?m_code=${member.m_code}");
		});
	})
</script>
</html>