<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Insert title here</title>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>예매</h2>
          <ol>
            <li><a href="#">예매</a></li>
            <li><a href="#">빠른 예매</a></li>
            <li><a href="#">결제</a></li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
<c:set var="theater_title" value="${param.theater_title }"/>
<c:set var="member_id" value="${param.member_id }"/>
<c:set var="res_date" value="${param.res_date }"/>
<c:set var="res_time" value="${param.res_time }"/>
<c:set var="res_seat" value="${param.res_seat }"/>
<c:set var="res_price" value="${param.res_price }"/>
<c:set var="res_num" value="${param.res_num}"/>
<div id="sd-in" style="width:1560px;margin: 0 auto; margin-bottom: 50px; margin-top: 1000px;"></div>
	
<!--  결제 Api  -->
<script type="text/javascript">
	$(document).ready(function requestPay(){
		  var IMP = window.IMP;
		  var msg;
	      IMP.init('imp52627605');
	      
	      IMP.request_pay({
	          pg: 'html5_inicis',
	          pay_method: 'card',
	          merchant_uid: 'merchant_' + new Date().getTime(), // 고유결제번호
	          name: '${theater_title}' + '<br>' + '${res_date}', // 결제창의 상품명
	          amount: '100', // 가격(실제 가격으로 구현할땐, ${res_price }'로 변경)
// 	          movie_title: '${movie_title}', // 예매한 영화명
// 			  movie_date: '${reserved_date}', // 예매한 영화 날짜
// 			  movie_time: '${selected_time}', // 예매한 영화 시간
// 		      seat: '${selectedSeat}', // 예매한 좌석
		      buyer_name: '${member_id}' // 구매자 이름
	      }, function(rsp) {
	          if(rsp.success) {
	              var msg = '결제가 완료되었습니다.';
	              location.href='ReserveComplete.mv?member_id=${member_id}&theater_title=${theater_title}&res_date=${res_date}&res_time=${res_time}&res_seat=${res_seat}&res_price=${res_price}&res_num=${res_num}&movie_picture=${movie_picture}';
	              alert(msg);
	          } else {
	              var msg = '결제에 실패하였습니다.';
	              rsp.error_msg;
	              alert(msg);
	              location.href='ReservePaymentCancel.mv?res_num=${res_num}';
// 	             location.href='ReserveComplete.mv?member_id=${member_id}&theater_title=${theater_title}&res_date=${res_date}&res_time=${res_time}&res_seat=${res_seat}&res_price=${res_price}&res_num=${sessionScope.res_num}&movie_picture=${sessionScope.movie_picture}';
// 	             location.href='ReservePayment.mv';
	          }
	      })  
     }); // requestPay

</script>	
  </main><!-- End #main -->
	<!-- 본문 -->
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>