<!-- 
	작성자 : 김정훈
	작성일 : 2016.07.16
	내용 : 스테이션의 위치를 알려주는 지도 페이지
	수정내역 : 
 -->
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenCycle - 대여소 찾기/대여</title>

<!-- BootStrap v3.3.2 -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

<style>
/* 지도 관련 style 시작*/
.wrap {position: absolute;	left: 0; bottom: 40px; width: 288px; height: 132px;	margin-left: -144px; text-align: left; overflow: hidden; font-size: 12px; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif; line-height: 1.5;}
.wrap * {padding: 0; margin: 0;}
.wrap .info {width: 286px; height: 120px; border-radius: 5px; border-bottom: 2px solid #ccc; border-right: 1px solid #ccc; overflow: hidden; background: #fff;}
.wrap .info:nth-child(1) {border: 0; box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px; height: 30px; background: #eee; border-bottom: 1px solid #ddd; font-size: 18px; font-weight: bold;}
.info .close {position: absolute; top: 10px; right: 10px; color: #888; width: 17px; height: 17px; background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative; overflow: hidden;}
.info .desc {position: relative; margin: 13px 0 0 90px; height: 75px;}
.desc .ellipsis {overflow: hidden; text-overflow: ellipsis; white-space: nowrap;}
.info .img {position: absolute; top: 6px; left: 5px; width: 73px; height: 71px; border: 1px solid #ddd; color: #888; overflow: hidden;}
.info:after {content: ''; position: absolute; margin-left: -12px; left: 50%; bottom: 0; width: 22px; height: 12px; background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
/* 지도 관련 style 끝*/

/* 사이드메뉴 관련 style 시작 */
#navbar{background-color: white;}
#nav{padding-top: 30px;}
a {font-weight: bold;}
/* 사이드메듀 관련 style 끝 */

/* 상단바 관련 style 시작 */
.nav-pills>li.active>a,.nav-pills>li.active>a:focus,.nav-pills>li.active>a:hover{background-color:#eeeeee; color:#5cb85c;}
/* 상단바 관련 style 끝 */

html,body{height:100%}
body{margin:0}
#wrap{min-height:100%}
#footer{margin-top:-1em;height:1em}
</style>

<script>
	function fnConfirm(s_no) {
		var s_no = s_no;
		var url = "/confirm?s_code=" + s_no;
		var option = "width=900, height=300, left=450, top=300, resizable=no, scrollbars=no, status=no, location=no, toolbar=no, menubar=no;"

		window.open(url, "", option);
	}
</script>

</head>
<body>
	<!-- 상단바 시작 -->
	<div class="row">
		<div class="col-md-12" style="height: 10px; background-color: #6DD66D"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<nav class="navbar navbar-default" style="border-color: white;">
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
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid --> </nav>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-md-12" style="height: 1px; background-color: #D8D8D8"></div>
	</div>
	<!-- 상단바 종료 -->

	<!-- 메뉴 선택 이름 바 시작 -->
	<div id="wrap">
	<div class="row" style="margin-bottom: 1%">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h1>Station 찾기/예약</h1>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- 메뉴 선택 이름 바 종료 -->

	<div class="row">
		<!-- 좌측 여백 시작 -->
		<div class="col-sm-2"></div>
		<!-- 좌측여백 끝 -->

		<!-- 중간영역 시작 -->
		<div class="col-sm-2" style="background-color: #eeeeee; padding-top: 1%; padding-bottom: 20%">
			<ul class="nav nav-pills nav-stacked">
				<li role="presentation" class="active"><a href="#"><span style="font-size: medium">대여소 찾기/대여</span></a></li>
				<li role="presentation"><a href="#"><span style="color: #aaaaaa; font-size: medium"><img src="resources/images/arrow.png" width="50" height="50"></span></a></li>
				<li role="presentation"><a href="#"><span style="color: #aaaaaa; font-size: medium">대여 완료</span></a></li>
			</ul>
		</div>
		<div class="col-sm-6">
			<!-- 다음 지도 시작 -->
			<div id="map" style="width: 900px; height: 540px;"></div>
			<!-- 다음 지도 스크립트 시작 -->
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1bed2e07f95aebb362e7e57f8e57deba"></script>
			<script>
				var container = document.getElementById("map");
				var options = {
					center : new daum.maps.LatLng(37.567961, 126.983064),
					level : 3
				};

				var map = new daum.maps.Map(container, options); // make map
				var m_code = "<c:out value="${member.m_code}"/>"
				if(m_code == 0){
					/* 마커 위치 */
					var positions = [
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            대일빌딩'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 남대문로 120</div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.567961, 126.983064)
							},
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            우리은행'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 남대문로 118</div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.567723, 126.98306)
							},
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            대우조선해양'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 다동</div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.568407, 126.98229)
							},
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            을지로입구역 3번출구'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 남대문로1가</div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.5665246, 126.98291)
							} ];
				}
				else{
					/* 마커 위치 */
					var positions = [
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            대일빌딩'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 남대문로 120</div>'
										+ '                <div><a href="javascript:fnConfirm(1)">예약하기</a></div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.567961, 126.983064)
							},
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            우리은행'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 남대문로 118</div>'
										+ '                <div><a href="javascript:fnConfirm(2)">예약하기</a></div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.567723, 126.98306)
							},
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            대우조선해양'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 다동</div>'
										+ '                <div><a href="javascript:fnConfirm(3)">예약하기</a></div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.568407, 126.98229)
							},
							{
								content : '<div class="wrap">'
										+ '    <div class="info">'
										+ '        <div class="title">'
										+ '            을지로입구역 3번출구'
										+ '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
										+ '        </div>'
										+ '        <div class="body">'
										+ '            <div class="img">'
										+ '                <img src="resources/images/station.jpg" width="73" height="70">'
										+ '           </div>'
										+ '            <div class="desc">'
										+ '                <div class="ellipsis">서울특별시 중구 남대문로1가</div>'
										+ '                <div><a href="javascript:fnConfirm(4)">예약하기</a></div>'
										+ '            </div>' + '        </div>'
										+ '    </div>' + '</div>',
								latlng : new daum.maps.LatLng(37.5665246, 126.98291)
							} ];
				}
				/* 마커, 오버레이 만들기
				for (var i = 0; i < positions.length; i++) {
					(function(i) {	// 클로저
					var marker = new daum.maps.Marker({map : map, position : positions[i].latlng, clickable : true});
					var overlay = new daum.maps.CustomOverlay({content : positions[i].content, map : map, position : marker.getPosition()});
					overlay.setMap(null);
					daum.maps.event.addListener(marker, 'click', function() {overlay.setMap(map);});
					})(i);	// 클로저
				}
				 */
				 
				 var customOverlay = new daum.maps.CustomOverlay({});
					
					for (var i = 0; i < positions.length; i++) {
						addMarker(positions[i].latlng, i);
					}
					
					function addMarker(position, count) {
						var marker = new daum.maps.Marker({map: map, position: position, clickable : true});
						daum.maps.event.addListener(marker, 'click', function() {
							customOverlay.setContent(positions[count].content);
							customOverlay.setPosition(marker.getPosition());
							customOverlay.setMap(map);
						});
					}
				
				function closeOverlay() {customOverlay.setMap(null);};
				
			</script>
			<!-- 다음 지도 스크립트 끝 -->
			<!-- 다음 지도 끝 -->

			<p style="color: #aaaaaa; font-size: medium">위의 지도에서 원하는 장소를 선택하세요.</p>
		</div>
		<!-- 중간영역 끝 -->

		<!-- 우측 여백 시작 -->
		<div class="col-md-2"></div>
		<!-- 우측 여백 끝 -->
	</div>
	</div>
	<!-- 하단바 시작 -->
	<div id="footer" class="row">
		<div class="col-md-12" style="height:150px; background-color: #424242; margin-top: 10px">
			<footer style="margin-left: 42%; margin-top: 2%">
			  <p><a href="http://rkskekabc.cafe24.com/prjSemi/main.jsp">Armadillo</a></p>
			  <p>&copy; Copyright 2016 All rights reserved by BABJO.</p>
			</footer>
		</div>
	</div>
	<!-- 하단바 끝 -->
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
	
	<!-- BootStrap v3.3.2 -->
	<script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
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
	})
</script>
</html>