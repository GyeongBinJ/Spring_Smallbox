<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/style.css">
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">

<link href="./assets/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
let openWin;
function newWindow(sId) {
	openWin = window.open(
    "ReserveCheckCoupon.mv?sId="+sId,
    "cp",
    "width=500, height=260, top=50, left=50"
  );
}
//제이쿼리 시작부분
$(document).ready(function() {
	$("#paymentForm").submit(function() {
	
	  if($("#totalPrice").text() == 0 || $("#totalPrice").text() == "") {
	      alert("쿠폰을 조회해주세요");
	     return false;
	  } // if end
	     
	}); // 결제버튼 end

});
</script>
<style type="text/css">
input[type=checkbox] {
	display: none;
}
input[type=checkbox] + label{
	display: inline-block;
	border: 1px solid;
	text-align: center;
	line-height: 30px;
	margin-bottom: 5px;
	width: 130px;
	height: 30px;
	border-radius: 4px;
}
input[type=checkbox]:checked + label{
	background-color: #3B0B5F;
	color: #fff;
}
/* 꾸미기 */
#PaymentWrap {
	margin-left: 80px;
	margin-bottom: 30px;
	margin-top: 30px;
}
h1 {
	font-size: 40px;
}

.pagebtn:hover {
	text-align: center; 
	margin-top: 30px; 
	margin-bottom: 10px;
	color: #fff;
	padding: 4px 10px;
	border-radius: 4px;
	border: 2px solid #3B0B5F;
	transition: 0.3s;
	font-size: 15px;
	background-color: #3B0B5F;
}
	#couponIdxnone {
		display: none;
	}
</style>

</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
<!-- --------------------- 들고다니세요 ------------------------------------ -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>예매</h2>
          <ol>
            <!-- 페이지 주소, 이름 넣는곳 -->
            <li><a href="Reserve.mv">빠른 예매</a></li>
            <li><a href="javascript:window.history.back();">좌석선택</a></li>
            <li>결제하기</li>
          </ol>
        </div>
      </div>
    </section>
<!-- --------------------- 들고다니세요 ------------------------------------ -->	

<!-- 받아온 정보 변수에 저장 -->
<c:set var="theater_idx" value="${param.theater_idx }" />
<c:set var="selectedSeat" value="${param.selectedSeat }" />
<c:set var="sId" value="${param.sId }" />
<c:set var="movie_title" value="${param.movie_title }" />
<c:set var="reserved_date" value="${param.reserved_date }" />
<c:set var="selected_time" value="${param.selected_time }" />
<c:set var="select_number_adult" value="${param.select_number_adult }" />
<c:set var="select_number_teen" value="${param.select_number_teen }" />
<c:set var="select_number_elderly" value="${param.select_number_elderly }" />

<!-- 받아온 정보 변수에 저장 끝 -->
<div id="PaymentWrap">

<h1>결제하기</h1>
<hr>
<!-- 예매한 영화 정보 표시 영역 -->
${movie_title }<br>
<!-- 극장 번호 : ${theater_idx }<br> --!>
<!-- id : ${sId }<br> --!>
<hr>
부산 | SmallBox 1관 <!-- 상영관 고정 -->
${reserved_date } | ${selected_time }<br>
<hr>
좌석 | ${selectedSeat }
<!-- 받아온 인원 수 표시 영역 -->
<!-- 성인, 청소년, 우대 요금으로 나눠서 계산, 요금 기억이 안나서 내맘대로 함 , 선택 한 인원이 있을 때 표시-->
<c:if test="${select_number_adult gt 0}">
		성인 : ${select_number_adult } 명
</c:if>
<c:if test="${select_number_teen gt 0}">
		청소년 : ${select_number_teen } 명
</c:if>
<c:if test="${select_number_elderly gt 0}">
		우대 : ${select_number_elderly } 명
</c:if>
<hr>
<!-- 할인 전 최종 금액 -->
<c:set var="priceBeforeDc" value="${(select_number_adult * 15000) + (select_number_teen * 13000) + (select_number_elderly * 8000)}" />
금액  |  ${priceBeforeDc }
<input type="hidden" id="priceBeforeDc" value="${priceBeforeDc }">
<hr>
<!-- 예매한 영화 정보 표시 영역 끝-->

<!-- 쿠폰 조회하기 버튼 영역 -->
쿠폰 할인 적용<br>

 	<input type="button" value="조회하기" onclick="newWindow('${sId}');" class="pagebtn" style="border-radius: 4px;"><br>
<!-- 쿠폰 조회하기 버튼 영역 끝 -->

<hr>

<!-- 결제창으로 넘길 영역 -->
<!-- 할인금액 변수 -->
<form action="ReservePaymentPro.mv" method="post" name="payment" id="paymentForm">

<!-- 최종 결제 금액 변수 -->
<c:set var="price" value="${priceBeforeDc - discountPrice }" />

최종 결제 금액  | <span id="totalPrice"></span><br>
<span id="couponIdxnone">쿠폰 번호 : <span id="couponIdx"></span></span>
<hr>


결제 수단 선택 &nbsp;&nbsp;
<input type="checkbox" checked="checked" value="credit" id="byCredit">
<label for="byCredit">신용/체크카드</label>
<input type="checkbox" disabled="disabled" value="phone" id="byPhone">
<label for="byPhone">휴대폰결제</label>
<input type="checkbox" disabled="disabled" value="fast" id="byFast">
<label for="byFast">간편결제</label>
<input type="checkbox" disabled="disabled" value="cash" id="byCash">
<label for="byCash">내통장결제</label>

<!-- hidden으로 넘길 때 reserve 테이블에 있는 변수랑 같이 맞춤 -->
<input type="hidden" name="theater_idx" value="${theater_idx }">
<input type="hidden" name="theater_title" value="${movie_title }">
<input type="hidden" name="member_id" value="${sId }">
<input type="hidden" name="res_date" value="${reserved_date }">
<input type="hidden" name="res_time" value="${selected_time }">
<input type="hidden" name="res_seat" value="${selectedSeat }">
<input type="hidden" name="res_price" value="">
<input type="hidden" name="coupon_idx" value="${0 }">
<hr>
<!-- 0110추가한부분  -->

<!-- 0110추가한부분  -->
<input type="submit" value="결제" class="pagebtn" style="border-radius: 4px;">
</form>
<!-- 결제창으로 넘길 영역 끝 -->
</div> <!-- ~~~~payment Wrap end~~~~ -->
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>

</body>

</html>