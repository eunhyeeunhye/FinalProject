<!-- 
	작성자 : 김정훈
	작성일 : 2016.07.25
	내용 : window.close기능이 너무 빨리 실행되어 만든 중간페이지
	수정내역 : 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fnClose() {
		window.close();
	}
</script>
</head>
<body>
잠시만 기다려주세요...
<script>
	setTimeout("fnClose()",1000);
</script>
</body>
</html>