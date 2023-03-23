<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
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

<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- --> 
<style type="text/css">
.btn-log {
    width: 350px;
    height: 50px;
    background: #3B0B5F;
    color: #fff;
}
</style>
<title>회원가입 완료</title>
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
	      <h2>회원가입완료</h2>
	      <ol>
	        <li><a href="./">Home</a></li>
	        <li><a href="MemberLoginForm.sm">Login</a></li>
	        <li>Join correct</li> 
	      </ol>
	    </div>
	  </div>
	</section>
<!-- End Breadcrumbs -->
	<form action="">
	    <div align="center">
			<div class="welcome" style="padding-top: 50px;">
		    	<img src="${pageContext.request.contextPath }/resources/assets/img/welcomeLogo.png" style="width: 1000px;">
		    </div>
			<div class="btn_area" style="padding-top: 50px; padding-bottom: 20px;">
				<h2>회원가입이 완료되었습니다.</h2>
				<input type="button" value="홈으로" class="btn-log" style="border-radius: 10px;" onclick="location.href='./'">
				<input type="button" value="로그인" class="btn-log" style="border-radius: 10px;" onclick="location.href='MemberLoginForm.sm'">
			</div>
		</div>
	</form>
<!-- ---------------footer------------- -->
<footer id="footer" style="margin-top: 120px;">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>
