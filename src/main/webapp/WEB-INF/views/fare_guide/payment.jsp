<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<title>이용권 구매</title>
</head>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

<script>

	function Check(){
		var m_grade = '${member.m_grade}';
		var m_mileage = '${member.m_mileage}';
		var usemileage = $("#usemileage").val();
		var money = $(":input:radio[name=amount]:checked").val()
		var sum = money-usemileage;
		
		if(usemileage > m_mileage){    
			alert("보유한 마일리지보다 사용 할 마일리지 포인트가 클 수 없습니다. \n" + 
				"내 마일리지 : " + m_mileage
			);
			
		    $('#usemileage').focus;
		}
		else{
			if(sum < 0){
				alert("결제금액보다 사용 할 마일리지 포인트가 클 수 없습니다.");
			}
			else{
				$(document).ready(function() {
			        $('#money').val(sum);
			    });
				$(document).ready(function() {
			        $("input[name=money]:hidden").val(sum);
			    });
				
				if(m_grade == '준회원'){
					$("input[name=mileage]:hidden").val(sum * 0.08);
				}
				else if(m_grade == '정회원'){
					$("input[name=mileage]:hidden").val(sum * 0.1);
				}
				else if(m_grade == '우수회원'){
					$("input[name=mileage]:hidden").val(sum * 0.15);
				}
				else if(m_grade == '특별회원'){
					$("input[name=mileage]:hidden").val(sum * 0.2);
				}
				else {
					alert("관리자입니다.");
				}
			}
		}
	}
	
	function paymentInfo(){
		var money = $("#money").val();
		var p_means = $(":input:radio[name=p_means]:checked").val();
 		var mileage = $("input[name=mileage]:hidden").val();
		var usemileage = $("#usemileage").val();
		
		alert(		
				"결제수단 : " +  p_means + "\n" + 
				"사용 한 마일리지 : " + usemileage + "P" + "\n" +
				"적립 된 마일리지 : " + mileage + "원" + "\n" +
				"최종 결제금액 : " + money + "원" + "\n" +
				" \n\n" + 
				"확인을 누르면 결제됩니다."
			);
		
	}

</script>

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
		color:#eeeeee;
	}
</style>

<body>

<%@include file="../include/header2.jsp" %>
<div id="wrap">
<div class="row" style="margin-top: 10px; margin-bottom: 1%">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<h1 style="color: #BDBDBD">이용안내</h1>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-sm-2"></div>
	<div class="col-sm-2" style="background-color: #eeeeee; padding-top: 1%; padding-bottom: 25%">
			<ul class="nav nav-pills nav-stacked" role="tablist">
				<li role="presentation"><a href="/fare_guide/fareGuide" aria-controls="notice" role="tab">
					<span style="color: #aaaaaa; font-size: medium">요금안내</span></a></li>
				<c:choose>
					<c:when test="${member == null}">
				<li role="presentation" class="active"><a href="/member/login" aria-controls="notice" role="tab">
					<span style="font-size: medium">이용권구매</span></a></li>
					</c:when>
					<c:when test="${member != null}">
				<li role="presentation" class="active"><a href="/fare_guide/payment" aria-controls="notice" role="tab">
					<span style="font-size: medium">이용권구매</span></a></li>
					</c:when>
				</c:choose>
			</ul>
	</div>
	
	<form role="paymentform" method="post">
	<div class="col-sm-5">
	<h3>이용권 구매</h3><br/>
		<input type="hidden" name="m_code" value="${member.m_code}" />
		<input type="hidden" name="mileage" value="" />
		<input type="hidden" name="money" value="" />
		<table class="table table-hover">
				<tr>
					<td>서비스 요금</td>
					<td>
						<div class="radio">
						<div class="radio">
						  <label>
						    <input type="radio" name="amount" id="amount" value="3000" checked onclick="Check()">
						    7일권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3000원
						  </label>
						 </div>
						 <div class="radio">
						  <label>
						    <input type="radio" name="amount" id="amount" value="5000" onclick="Check()">
						    30일권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5000원
						  </label>
						 </div>
						 <div class="radio">
						  <label>
						    <input type="radio" name="amount" id="amount" value="15000" onclick="Check()">
						    180일권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15000원
						  </label>
						 </div>
						 <div>
						  <label>
						    <input type="radio" name="amount" id="amount" value="30000" onclick="Check()">
						    365일권&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;30000원
						  </label>
						 </div>
						</div>
					</td>
					<td></td>		
				</tr>
				<tr>
					<td>결제수단</td><td>	
					<div class="radio">
						  <label>
						    <input type="radio" name="p_means" id="p_means" value="휴대폰" checked>
						   	휴대폰
						  </label>
						</div>
						<div class="radio">
						  <label>
						    <input type="radio" name="p_means" id="p_means" value="신용카드">
						    신용카드
						  </label>
						</div>
					</td><td></td>
				</tr>
				<tr>
					<td>마일리지</td>
					<td>
						<input type="text" name="usemileage" id="usemileage" class="form-control" style="width: 100%" >
						<button type="button" class="btn btn-default btn-xs" onclick="Check()">적용</button>
					</td>
					<td><h6>내 마일리지 : <input type="text" name="getMileage" id="getMileage" class="form-control" value="${member.m_mileage}"/></h6></td>
				</tr>
				<tr>
					<td>최종 결제금액 :</td>
					<td><b><input type="text" name="money" id="money" class="form-control" readonly></b>원</td>
					<td></td>
				</tr>

			</table>
	</div>

	<div class="col-sm-3">
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		  <button type="submit" class="btn btn-default btn-s" style="margin-top: 15px" onclick="paymentInfo()">확인</button>
	</div>
</form>
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
	$(document).ready(function() {
		$("#logoutconfirm").on("click", function() {
			$(location).attr('href', "/member/logout");
		});
		
		$("#mypage").on("click", function() {
			$(location).attr('href', "/member/mypage");
		});
	})
</script>
</html>