<!-- 
	작성자 : 김정훈
	작성일 : 2016.07.19
	내용 : 대여확인 전 확인 팝업페이지
	수정내역 : 2016.07.25 window.close기능이 너무 빨리 실행되 중간페이지 추가
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GreenCycle - 확인</title>

<!-- BootStrap v3.3.2 -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />

<script>
	function fnConfirm() {
		if(confirm("확인한 정보로 대여하시겠습니까?") == true) {
			window.opener.location = "/state?m_code=${member.m_code}";
			document.mainform.submit();
		}
	}
	function fnClose() {
		window.close();
	}

</script>

</head>
<body>
	<c:choose>
		<c:when test="${info[0].s_location == null}">
			<div class="row">
				<div class="col-sm-6">
					<table class="table table-striped">
						<tr>
							<th>Green Cycle</th>
						</tr>
						<tr>
							<th>-</th>
						</tr>
						<tr>
							<th>해당 스테이션에 대여 가능한 자전거가 없습니다.</th>
						</tr>
						<tr>
							<th>-</th>
						</tr>
						<tr>
							<th>다른 스테이션을 이용해 주세요.</th>
						</tr>
					</table>
				</div>
				<h1>실시간 현황</h1>
				<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
				<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
				<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
				<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
				<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
				<br/><br/>
				<img src="resources/images/bicycle_green.png" width="45px" height="35px" /> : 대여 가능&nbsp;&nbsp;
				<img src="resources/images/bicycle_black.png" width="45px" height="35px" /> : 대여중
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div align="center">
						<input type="button" value="확인" onclick="fnClose()">
					</div>
				</div>
			</div>
		</c:when>
		<c:when test="${info != null}">
			<div class="row">
				<div class="col-sm-6">
				<c:forEach end="0" items="${info }" var="bicycleVO">
					<table class="table table-striped">
						<tr>
							<th>대여 시간</th>
							<th>${time }</th>
						</tr>
						<tr>
							<th>대여 장소</th>
							<th>${bicycleVO.s_location }, 스테이션 번호 : ${bicycleVO.s_code }번</th>
						</tr>
						<tr>
							<th>상세주소</th>
							<th>${bicycleVO.s_sub_location }</th>
						</tr>
						<tr>
							<th>자전거 번호</th>
							<th>${bicycleVO.b_code }, 상태 : 대여가능</th>	
						<tr>
							<th>대여자 명의
							<th>${member.m_name }</th>
						</tr>
					</table>
				</c:forEach>
				</div>
				<h1>실시간 현황</h1>
				<c:forEach items="${bInfo}" var="list">
					<c:if test="${list.b_state == 1}"><img src="resources/images/bicycle_green.png" width="85px" height="65px" /></c:if>
					<c:if test="${list.b_state == 2}"><img src="resources/images/bicycle_black.png" width="85px" height="65px" /></c:if>
				</c:forEach>
				<br/><br/>
				<img src="resources/images/bicycle_green.png" width="45px" height="35px" /> : 대여 가능&nbsp;&nbsp;
				<img src="resources/images/bicycle_black.png" width="45px" height="35px" /> : 대여중
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div align="center">
						<p style="color: #aaaaaa; font-size: medium">대여정보를 확인하신 후 확인 버튼을 눌러주세요.</p>
						<form method="post" name="mainform" action="/rentbicycle">
							<input type="button" value="확인" onclick="fnConfirm()">
							<c:forEach end="0" items="${info }" var="bicycleVO">
							<input type="hidden" name="r_date" value="${time }">
							<input type="hidden" name="b_code" value="${bicycleVO.b_code }">
							<input type="hidden" name="s_code" value="${bicycleVO.s_code }">
							<input type="hidden" name="s_location" value="${bicycleVO.s_location }">
							<input type="hidden" name="s_sub_location" value="${bicycleVO.s_sub_location }">
							<input type="hidden" name="m_code" value="${member.m_code }">
							<input type="hidden" name="m_name" value="${member.m_name }">
							<input type="hidden" name="r_state" value="1">
							</c:forEach>
							<input type="button" value="취소" onclick="fnClose()">
						</form>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>
</body>
	<!-- BootStrap v3.3.2 -->
	<script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
</html>