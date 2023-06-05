<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
String memberId = (String)session.getAttribute("memberId");
%>
<!DOCTYPE html>


<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
   integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
   crossorigin="anonymous"></script>

<title>포케포케 : 결제하기</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">
	
	<!-- Favicons -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="icon" />
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.png"
	rel="apple-touch-icon" />


<!-- 결제 동의 텍스트 -->
<style>
.counsel_copy {
	font-size: 0.7em;
}
</style>
<!-- 결제동의 내역에 점 없애는 효과 -->
<style>
ul li {
	list-style: none;
}
</style>
<!-- <p>태그 단락 줄이는 스타일 -->
<style>
  p {
    margin: 0;
    padding: 0;
  }
</style> 
 <style> 
  .store_name{
  color:black;
  }
</style>


<!-- 주문시 요청사항 텍스트 입력 시 없어지는 이벤트 -->
<script>
let textBox = document.querySelector('input[name="order"]');
if (textBox !== null) {
  textBox.addEventListener('input', function(){
    if (textBox.value.length > 0) {
      textBox.removeAttribute('placeholder');
    } else {
      textBox.setAttribute('placeholder', '주문시 요청 사항을 입력해 주세요.');
    }
  });
}
</script>


<!-- 무통장 입금 폼 -->
<script>
function showBankInfo() {
  $('#bank-info').append(
    '<div class="col-lg-4">' +
    '<div class="checkout__input">' +
    '<input name="bank" placeholder="입금자 이름"></li><li><strong>입금은행</strong>&nbsp;&nbsp;<select name="bankAccount" class="bankAccount"><option value="">선택해주세요</option><option value="1">국민 4444-555-6666 (주)포케포케</option><option value="2">신한 9999-888-7777 (주)포케포케</option><option value="3">우리 1111-222-3333 (주)포케포케</option></select></li></ul>'+
    '</div>' +
    '</div>'
  );
  $('#bank').prop('disabled', true); // 무통장 버튼 비활성화
}
</script>
<!-- 신용카드 폼 -->
<script>
function cartInfo() {
  $('#bank-info').append(
    '<div>' +
    '<div>' +
    '<input type="radio" name="card-type" value="personal-card"><strong>개인카드</strong>&nbsp;&nbsp;'+
    '<input type="radio" name="card-type" value="corporate-card"><strong>법인카드</strong>&nbsp;&nbsp;<select name="bankAccount" class="bankAccount"><option value="">선택해주세요</option><option value="1">국민카드</option><option value="2">신한카드</option><option value="3">우리카드</option></select></li></ul>'+
    '</div>' +
    '</div>'
  );
  $('#bank-info').append('<br>');
  $('#card-type').prop('disabled', true); 
}
</script>

</script>
 <!-- <script>
function showBankInfo() {
var bankInfo = '<ul><li><strong>입금자명</strong><input type="text" name="bank"></li><li><strong>입금은행</strong><select name="bankAccount" class="bankAccount"><option value="">선택하세요</option><option value="1">국민 4444-555-6666 (주)포케포케</option><option value="2">신한 9999-888-7777 (주)포케포케</option><option value="3">우리 1111-222-3333 (주)포케포케</option></select></li></ul>';
document.getElementById('bank').innerHTML = bankInfo;}</script> -->

<!-- 구매결제 버튼 창 누르면 실행 -->								
<script>
function validateForm() {
  var checkBox = document.getElementById("paymentAgree");
  if (!checkBox.checked){
    alert("구매조건 및 결제진행 동의에 체크해주세요.");
    return false;
  }else{
	  if(confirm("주문 후 제조가 시작되면 취소가 불가능 합니다. 주문하시겠습니까?")){
		  /* location.href="http://localhost:8080/payment/orderView1"; */
		  $('#detailForm').attr('action', '/payment/orderView1').submit();
	  }
   }
}
</script>

 <script>
$(function(){
  let price = "${detail.price}";
  let point = price * 0.05;
  let pointString = parseInt(point); // This formats the number with commas
console.log(pointString);
  $('#pointAccumulation').val(pointString);
console.log($('#pointAccumulation').val());
});
</script>

<!-- 포인트 사용 -->
<script>
function setPointAmount(amount){
document.getElementById('pointAmt').value = amount;
}
</script>
	

<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h2 align="center">결제 페이지</h2>
						<div class="breadcrumb__links"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form id="detailForm" method="post">
				<input type="hidden" id="pointAccumulation" name="point" value="">
					<div class="row">
						<div class="col-lg-12 col-md-6">
							<h6 class="checkout__title">픽업매장</h6>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											매장명<span>*</span>
										</p>
										<input type="text" class="store_name" readonly name="storeName" value="${store.storeName }">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											매장주소<span>*</span>
										</p>
										<input type="text" readonly name="storeAddress"
											value="${store.storeAddress}">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									포장방법<span>*</span>
								</p>
								<input type="text" readonly value="포장">
							</div>
							<div class="checkout__input">
								<p>
									전화번호<span>*</span>
								</p>
								<input type="text" name="phone" value="${pmember.phone}"
									class="checkout__input__add">
							</div>
							<div class="checkout__input">
								<p>주문시 요청사항</p>
								<input type="text" maxlength="50" name="order"
									placeholder="주문시 요청사항을 입력하세요">
							</div>
							<div class="checkout__input__checkbox">
								<label for="zero"> &#x1F374;일회용품(스푼, 포크 등)을 사용하지
									않겠습니다.🌍 <input type="checkbox" id="zero"> <span
									class="checkmark"></span>
								</label>
							</div>
							<!-- 할인방법 -->
							<div class="container">
							<h6 class="checkout__title">할인 방법 선택</h6>
							<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="checkout__input">
								<span>포인트 사용</span>
								<input id="pointAmt" name="point" type="text" value="">
								<span>보유 포인트:</span>
								<span id="point" data-point="${pmember.point}">${pmember.point}</span>
								</div>
								</div>
								<div class="col-lg-4 col-md-6">
								<br>
								<button type="button" onclick="setPointAmount('${pmember.point}')"
										style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">전체사용</button>						
							</div>
							</div>
							</div>
							<br>
							<!-- 결제수단 -->
							<h6 class="checkout__title">결제 수단 선택</h6>
								<div class="row" id="bank-info">
								  <div class="col-lg-6">
								    <div class="checkout__input">
								      <button id="cart" type="button" class="btn btn-success"
								        style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;"
								        onclick="cartInfo()">신용카드</button>
								      &nbsp;&nbsp;&nbsp;
								      <button id="bank" type="button" class="bank-button"
								        style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;"
								        onclick="showBankInfo();">무통장입금</button>
								    </div>
								  </div>
								</div>
<!--  							<div class="row" id="bank">
								<div class="col-lg-6">
									<div class="checkout__input">
										<button type="button" class="btn btn-success"
											style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">신용카드</button>
										&nbsp;&nbsp;&nbsp;
										<button class="bank-button" type="button" 
											style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;"
											onclick="showBankInfo()">무통장입금</button>
									</div>
								</div>
							</div>  -->
							<br>
							<h6 class="checkout__title">현금영수증</h6>
						<div class="cash">
						<div class="form_radio square">
							<label>
								<button type="button" class="btn btn-success" onclick="hideForms()" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">발급안함</button>&nbsp;&nbsp;&nbsp;
							</label> <label>
								<button id="form-container1" type="button"
									class="btn-personal" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;" >개인소득공제</button>&nbsp;&nbsp;&nbsp;
							</label> <label>
								<button id="form-container2" type="button"
									class="btn-business" style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">사업자증빙용</button>&nbsp;&nbsp;&nbsp;
							</label>
						</div>
						<!-- 개인소득 -->
						<span id="form-container"></span>
						<!-- 사업자증빙 -->
						<div id="output-container"></div>
					</div>
				
<!-- 결제 관련 이벤트 -->				
<script>

/* 버튼 최대 2개 클릭 */
let maxNumClicks = 2;
let numClicks = 0;

let cashReceipt = document.querySelector('.cash');
let radioButtons = cashReceipt.querySelectorAll('.btn-success');

radioButtons.forEach(function(button) {
  button.addEventListener("click", function() {
    if (button.classList.contains('active')) {
      button.classList.remove('active');
      numClicks--;
    } else if (numClicks < maxNumClicks) {
      button.classList.add('active');
      numClicks++;
    }
    
    if (numClicks === maxNumClicks) {
      radioButtons.forEach(function(button) {
        if (!button.classList.contains('active')) {
          button.disabled = true;
        }
      });
    } else {
      radioButtons.forEach(function(button) {
        button.disabled = false;
      });
    }
  });
});

/* 개인, 사업자 현금 영수증 폼 구현 */
	let personalBtn = document.querySelector('.btn-personal');
	let businessBtn = document.querySelector('.btn-business');
	let formContainer = document.getElementById("form-container");

	personalBtn.addEventListener("click", function() {
		let form = document.createElement("form");
		let input = document.createElement("input");
		let submitBtn = document.createElement("button");

	  input.setAttribute("type", "text");
	  input.setAttribute("name", "text-input");

	  submitBtn.setAttribute("type", "submit");
	  submitBtn.textContent = "입력";

	  form.appendChild(input);
	  form.appendChild(submitBtn);
	  formContainer.appendChild(form);

	  form.addEventListener("submit", function(event) {
	    event.preventDefault();

	    let outputContainer = document.getElementById("output-container");
	    let inputValue = input.value;

	    form.style.display = "none";
	    outputContainer.textContent = inputValue;
	  });
	});

	businessBtn.addEventListener("click", function() {
		let form = document.createElement("form");
		let input = document.createElement("input");
		let submitBtn = document.createElement("button");

	  input.setAttribute("type", "text");
	  input.setAttribute("name", "company-name");

	  submitBtn.setAttribute("type", "submit");
	  submitBtn.textContent = "입력";

	  form.appendChild(input);
	  form.appendChild(submitBtn);
	  formContainer.appendChild(form);

	  form.addEventListener("submit", function(event) {
	    event.preventDefault();

	    let outputContainer = document.getElementById("output-container");
	    let inputValue = input.value;

	    form.style.display = "none";
	    outputContainer.textContent = inputValue;
	  });
	});
/* 발급안함 버튼 누르면 기존 폼 사라지게 하는 부분(발급안함 버튼에 onclick 줌) */
function hideForms(){
	let forms = document.querySelectorAll(".cash form");
	let formContainer = document.querySelector("#form-container");
	let outputContainer = document.getElementById("output-container");

	forms.forEach(function(form){
		formContainer.removeChild(form);
	});
	outputContainer.textContent="";
}

</script>

							<p>&nbsp;</p>
						<h6 class="checkout__title">주문내역</h6>
							<div class="checkout__input__checkbox">
								<tr>
									<td>
										<div class="name" data-target="mainItem">
											<br> <strong>${detail.productName }</strong><br>
											<strong style="font-size: 13px; font-weight: bold;">${detail.base}&nbsp;${detail.atopping }&nbsp;${detail.btopping}&nbsp;${detail.ctopping}&nbsp;${detail.dtopping}&nbsp;${detail.asource}&nbsp;${detail.bsource}&nbsp;${detail.aextratopping}&nbsp;${detail.bextratopping}&nbsp;${detail.extramain}&nbsp;${detail.setbeverage}&nbsp;${detail.setside}
											</strong>
										</div>
									</td>
									<td>
										<div style="text-align: right; font-size: 14px; font-weight: bold;">
											<span>${detail.total }개</span>&nbsp;&nbsp;
											<span>${detail.price }원</span>
										</div>
									</td>
								</tr>
							</div>
							<br>
							<br>
							
							<!-- 결제창 -->
							<h6 class="checkout__title">총 결제 금액</h6>
							<div class="cart__total" style=" color: #E53637; font-size: 16px;">
								<p>상품 수량</p>
								<div style="text-align: right; font-size: 16px; font-weight: bold;">${detail.total}개</div>
								<p>총 주문 금액</p>
								<div style="text-align: right; font-size: 16px; font-weight: bold;">${detail.price}원</div>
								<p>포인트 사용</p>
								<div id="newPaymentAmount" style="text-align: right; font-size: 16px; font-weight: bold;">${pmember.point }Point</div>
								<p>잔여 결제 금액</p>
								<div id="finalPrice" style="text-align: right; font-size: 16px; font-weight: bold;" ></div>
								
								<!-- 결제 내역에서 잔여 결제 금액(총 주문 금액 - 포인트 사용 = 잔여 결제 금액) -->
								<script>
								$(document).ready(function(){
									let price = "${detail.price}";
								let point = "${member.point}";
								let finalPrice = price - point;
								//console.log(finalPrice);
								$('#finalPrice').text(finalPrice + '원'); //jquery 사용
								//이 코드를 사용했을 때 콘솔에는 값이 제대로 찍히지만 화면에는 finalPrice 의 값을 제대로 받지 못함 이유는 finalPrice의 변수의 값이 문자열 형태로 넣어지게 되는데 해당 변수의 값이 숫자로 변환이 되면서 에러가 나는거 같음
								//document.getElementById('finalPrice').innerHTML = `${finalPrice}원`; 
								});
								</script>
								</div>
						
							
							<%-- <c:forEach var="carts" items="${cart}">
							<div>
								<p>총 주문 금액</p>
								<div style="text-align: right; font-size: 14px; font-weight: bold;">
								<c:if test="${not empty carts.cartPrice }">${carts.cartPrice }원</c:if></div>
								<p>포인트 사용</p>
								<div style="text-align: right; font-size: 14px; font-weight: bold;">사용 포인트</div>
								<p>잔여 결제 금액</p>
								<div style="text-align: right; font-size: 14px; font-weight: bold;">
								<c:if test="${not empty carts.cartPrice}">${carts.cartPrice}원</c:if></div>
							</div>
							
							</c:forEach> --%>
							<br>
							<div class="checkout__input">
								<div class="checkout__input__checkbox">
									<label for="paymentAgree"><input id="paymentAgree"
										type="checkbox" value="Y" /> <span class="checkmark"></span>
										<strong>구매조건및 결제진행 동의</strong>
									</label>
								</div>
								<ul>
									<li class="counsel_copy">주문할 메뉴와 가격, 매장정보를 명확히 확인하였으며
										결제진행에 동의합니다.</li>
									<li class="counsel_copy">제조시간은 매장상황에 따라 상이할 수 있습니다.</li>
									<li class="counsel_copy">주문자 정보가 서비스 제공을 위해 주문 매장에 제공됩니다.</li>
									<li class="counsel_copy on">주문 후 제조가 시작되면 주문을 취소할 수 없습니다.</li>
								</ul>
								<br>
								<div style="text-align: center;" class="btn_area">
									<button onclick="validateForm()" type="button"
											style="background-color: #469543; color: #fff; border-radius: 30px; padding: 10px 20px; border: none; margin: 0 auto;">결제하기</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->
	
<!-- 	 <script>
      // This line sets the text of the "point" span
      $("#point").text(member.point + "point");
    </script>
	
	<script>
	document.getElementById("point").innerHTML = member.point + "Point";
	</script> -->
<!-- 	<script>
	const pointElement = document.getElementById('point');
	const finalPriceElement = document.getElementById('finalPrice');
	const useAllButton = document.querySelector('button[type="button"]');
	useAllButton.addEventListener('click', () => {
	  const pointData = pointElement.dataset.point;
	  const points = parseInt(pointData);
	  
	  const finalPriceData = finalPriceElement.innerText;
	  
	  const finalPrice = parseInt(finalPriceData.replace(/[^\d]/g, ''));
	  
	  const newPaymentAmount = finalPrice - points;
	  
	  finalPriceElement.innerText = `${newPaymentAmount}원`;
	});

	</script> -->
	
<!-- <script>
const useAllBtn = document.querySelector('button[onclick="setPointAmount(\'${member.point}\')"]');
useAllBtn.addEventListener('click', function() {
const pointsToUse = parseInt(document.querySelector('#point').getAttribute('data-point'));
const newPaymentAmount = detail.price - pointsToUse;
document.querySelector('#finalPrice').textContent = `${newPaymentAmount}won`;
});
</script> -->



	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nicescroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>

</head>
