<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>SMALLBOX</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
 <link href="assets/css/style.css" rel="stylesheet">
 <link href="assets/css/couponlist.css" rel="stylesheet">
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
            <li><a href="#">예매완료</a></li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
	
<!-- 본문 -->
<c:set var="theater_title" value="${param.theater_title }"/>
<c:set var="member_id" value="${param.member_id }"/>
<c:set var="res_date" value="${param.res_date }"/>
<c:set var="res_time" value="${param.res_time }"/>
<c:set var="res_seat" value="${param.res_seat }"/>
<c:set var="res_price" value="${param.res_price }"/>
<c:set var="res_num" value="${param.res_num }"/>
<!-- <div id="sd-in" style="width:380px; margin-bottom: 50px;"> -->
   <section class="inner-page" style="display: inline-block; margin-left: 250px;">
   <h1 style="margin-left: 220px; margin-top: 30px;">${member_id } 님, 예매가 완료되었습니다!</h1>
   
   <table style="margin-top: 30px; margin-bottom: 100px;">
    <thead>
    <tr>
        <th width="150" >예매내역</th>
        <th width="400" style="text-align: center;"></th>

    </tr>
    </thead>
    <tbody>
    
    <!-- CouponListProAction으로 부터 전달받은 request 객체의 couponList를 꺼내서 출력 -->
	
	    <tr>
	        <td rowspan="5"><img src="<%=request.getContextPath() %>/upload/${movie_picture}" width="430" height="509"></td>
	        <td style="text-align: center;">예매번호 : ${res_num }</td>
	    </tr>
	    <tr>
	        <td style="text-align: center;">예매영화 : ${theater_title }</td>
	    </tr>
	    <tr>
	        <td style="text-align: center;">예매일시 : ${res_date }    |    ${res_time }</td>
	    </tr>
	    <tr>
	        <td style="text-align: center;">예매좌석 : ${res_seat }</td>
	    </tr>
	    <tr>
	        <td style="text-align: center;">결제금액 : ${res_price }</td>
	    </tr>
    
		
	</table>

	
	</section>
<!-- 	</div> -->
  </main><!-- End #main -->

	
	
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>