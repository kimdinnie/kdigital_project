<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>포케포케 : 푸시 설정</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="/resources/css/join.css" type="text/css">

<!-- Favicons -->
<link href="/resources/img/favicon.png" rel="icon" />
<link href="/resources/img/favicon.png" rel="apple-touch-icon" />

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<!-- Checkout Section Begin -->
	<div class="product__details__tab" style="padding-top: 0;">
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link"
				href="/member/mypage/edit">회원 정보 수정</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="/member/mypage/push_setting">알림 설정</a></li>
			<li class="nav-item"><a class="nav-link"
				href="/member/mypage/edit_password">비밀번호 변경</a></li>
		</ul>
	</div>
	<section class="checkout spad" style="height: 564px;">
		<div class="container">
			<div class="checkout__form">
				<div class="row gx-4 gx-lg-5 justify-content-center">
					<div class="col-md-10 col-lg-8 col-xl-7">
						<div style="margin-bottom: 50px;">
							<h4><b>이벤트 및 혜택 알림</b></h4>
							<p>주문, 배달 및 특가 쿠폰 등 이벤트 정보를 빠르게 받을 수 있습니다.</p>
						</div>
						<div class="centerplz">
							<div class="checkout__input__checkbox">
	                        	<label style="display: inline-block; padding-left: 20px; padding-right: 50px;">
	                            	PUSH 수신 동의 
	                            	<input type="checkbox" class="consentPush_input" name="consentPush"
	                                	value='1' id="consentPush">
	                                <input type="hidden" class="consentPush_input" name="consentPush"
	                                	value='0' id="consentPush_hidden">
	                                <span class="checkmark"></span>
	                           	</label>
	                           	<label style="display: inline-block; padding-left: 20px; padding-right: 50px;">
	                            	이메일 수신 동의
	                                <input type="checkbox" class="consentEmail_input" name="consentEmail"
	                            		value='1' id="consentEmail">
	                                <input type="hidden" class="consentEmail_input" name="consentEmail"
	                              		value='0' id="consentEmail_hidden">
	                                <span class="checkmark"></span>
	                            </label>
	                          	<label style="display: inline-block; padding-left: 20px; padding-right: 50px;">
	                            	문자 / 알림톡 수신 동의
	                                <input type="checkbox" class="consentSMS_input" name="consentSMS"
	                             		value='1' id="consentSMS">
	                                <input type="hidden" class="consentSMS_input" name="consentSMS"
	                                	value='0' id="consentSMS_hidden">
	                                <span class="checkmark"></span>
	                            </label>
	                    	</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
<jsp:include page="/WEB-INF/views/footer.jsp" />

	<script>
	/* 입력된 마케팅 수신 동의 값 */
	var consentPush = parseInt("${member.consentPush}");
	var consentEmail = parseInt("${member.consentEmail}");
	var consentSMS = parseInt("${member.consentSMS}");
	
	/* 마케팅 동의 */
	if ($("#consentPush").is(":checked")) {
	    $("#consentPush_hidden").prop("disabled", true);
	}
	if ($("#consentEmail").is(":checked")) {
	    $("#consentEmail_hidden").prop("disabled", true);
	}
	if ($("#consentSMS").is(":checked")) {
	    $("#consentSMS_hidden").prop("disabled", true);
	}
	
	$(document).ready(function() {
		/* 값 받아와서 체크박스 체크 */
		if(consentPush === 0) {
			$("#consentPush_hidden").prop("checked", true);
		}else if(consentPush === 1) {
			$("#consentPush").prop("checked", true);
		}
		
		if(consentEmail === 0) {
			$("#consentEmail_hidden").prop("checked", true);
		}else if(consentEmail === 1) {
			$("#consentEmail").prop("checked", true);
		}
		
		if(consentSMS === 0) {
			$("#consentSMS_hidden").prop("checked", true);
		}else if(consentSMS === 1) {
			$("#consentSMS").prop("checked", true);
		}
	}); // 레디 끝
	
	/* div 안의 모든 체크박스 이벤트 발생 시 */
	$('.checkout__input__checkbox input[type="checkbox"]').on('change', function() {
		consentPushSet();
	});
	
	/* 푸시 설정 변경 */
	function consentPushSet() {
		var push = $("input[name='consentPush']:checked").val(); // 체크박스 값
		var email = $("input[name='consentEmail']:checked").val(); // 체크박스 값
		var sms = $("input[name='consentSMS']:checked").val(); // 체크박스 값
		var data = {
				memberId : "${memberId}",
				consentPush : push,
				consentEmail : email,
				consentSMS : sms
		}; // '컨트롤에 넘길 데이터 이름' : '데이터(name=consentPush에 입력되는 값)'
		
		$.ajax({
			type : 'post',
			url : '/member/consentPushSet',
			data : data,
			success : function(result) {
				if(result == 'fail') { // 업뎃 실패
					alert('저장을 실패했습니다. 페이지를 새로고침 해주세요.');
				}else { // 업뎃 성공
					alert('저장 했습니다.');
				}
			} /* success 종료 */
		});	/* ajax 종료 */
	}; // consentPushSet 끝
	</script>
</body>
</html>
