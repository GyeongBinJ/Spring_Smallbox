<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/top.css">
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
<title>스몰박스 - 조원소개</title>
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
	      <h2>조원소개</h2>
	      <ol>
	        <li><a href="./">Home</a></li>
	        <li>TEAM</li> 
	      </ol>
	    </div>
	
	  </div>
	</section>
	<!-- ======= Breadcrumbs ======= -->
	
	 <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>조원 소개</h2>
        </div>

        <div class="row">
	        <div style="margin-left: 430px;">
	          <div class="col-lg-4 mt-4">
	            <div class="icon-box iconbox-yellow">
	            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/KB.png" >
	              <h4>조경빈</h4>
					<p style="font-size: 20px; font-weight: bold;">조장</p>
	            </div>
	          </div>
         </div>


          <div class="col-lg-4 mt-4">
            <div class="icon-box iconbox-teal">
            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/MJ.png" >
              <h4>김민지</h4>
            </div>
          </div>
          
          <div class="col-lg-4 mt-4">
            <div class="icon-box iconbox-red">
            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/HY.png" >
              <h4>김혜연</h4>
            </div>
          </div>
          
          <div class="col-lg-4 mt-4">
            <div class="icon-box iconbox-teal">
            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/KE.png" >
              <h4>문빛고은</h4>
            </div>
          </div>
          
          <div class="col-lg-4 mt-4">
            <div class="icon-box iconbox-teal">
            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/JE.png" >
              <h4>문지은</h4>
            </div>
          </div>
          
          
          <div class="col-lg-4 mt-4">
            <div class="icon-box iconbox-teal">
            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/DY.png" >
              <h4>서다영</h4>
            </div>
          </div>
         
          <div class="col-lg-4 mt-4">
            <div class="icon-box iconbox-teal">
            <img class="team" src="${pageContext.request.contextPath }/resources/assets/img/team/YJ.png" >
              <h4>최영준</h4>
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