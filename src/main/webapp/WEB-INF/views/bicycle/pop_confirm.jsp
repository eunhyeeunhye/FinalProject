<!-- 
	작성자 : 김정훈
	작성일 : 2016.07.19
	내용 : 대여확인 전 확인 팝업페이지
	수정내역 : 
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
			window.opener.location = "/state?m_code=1";
			document.mainform.submit();
		}
	}
	function fnClose() {
		window.close();
	}

</script>

</head>
<body>
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
					<th>자전거 번호
					<th>${bicycleVO.b_code }, 상태 : 
					<c:choose>
						<c:when test="${bicycleVO.b_state=='1'}">
						대여가능
						</c:when>
					</c:choose>
					</th>
					
				<tr>
					<th>대여자 명의
					<th>홍길동</th>
				</tr>
			</table>
			</c:forEach>
		</div>
		<h1>실시간 현황</h1>
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
		<img src="resources/images/bicycle_black.png" width="85px" height="65px" />
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
					<input type="hidden" name="m_code" value="1">
					<input type="hidden" name="m_name" value="홍길동">
					<input type="hidden" name="r_state" value="1">
					</c:forEach>
					<input type="button" value="취소" onclick="fnClose()">
				</form>
			</div>
		</div>
	</div>

	<!-- BootStrap v3.3.2 -->
	<script src="../../../../js/jquery-2.2.3.min.js"></script>
	<script src="../../../../js/bootstrap.min.js"></script>
</body>
</html>