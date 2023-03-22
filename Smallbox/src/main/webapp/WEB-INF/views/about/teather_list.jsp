<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/swiper.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- ----------------------------------------들고다니세요----------------------------------------- --> 
<style type="text/css">
.teather {
	width: 300px;
	height:300px;
	margin: auto;
 }
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- TOP -->
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- TOP -->
	<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs">
	  <div class="container">
	
	    <div class="d-flex justify-content-between align-items-center">
	      <h2>스몰박스 극장</h2>
	      <ol>
	        <li><a href="./">Home</a></li>
	        <li>Teather</li> 
	      </ol>
	    </div>
	
	  </div>
	</section>
	<!-- ======= Breadcrumbs ======= -->
	
	 <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>극장 소개</h2>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box iconbox-yellow">
               <img class="teather" src="${pageContext.request.contextPath }/resources//assets/img/teather/teather_busan.jpg" >
              <h4>상상마당 부산본점</h4>
				<p>051-803-0909</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box iconbox-red">
            <img class="teather" src="${pageContext.request.contextPath }/resources//assets/img/teather/teather_seoul.jpg" >
              <h4>상상마당 홍대서울점</h4>
				<p>02-803-0909</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box iconbox-teal">
            <img class="teather" src="${pageContext.request.contextPath }/resources/assets/img/teather/teather_jeju.jpg" >
              <h4><a href="teatherList.ad">아트몰링 제주점</a></h4>
              <p>064-803-0909</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

	<!-- ---------------footer------------- -->
	<footer id="header">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	<!-- ---------------footer------------- -->
</body>
</html>