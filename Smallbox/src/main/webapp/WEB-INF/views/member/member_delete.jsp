<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/swiper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">

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

<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- --> 
<style type="text/css">
button {
	border-radius: 10px;
}
input[type=password] {
   font-family: "굴림";
}
label {
	text-align: right;
}
</style>
<title>회원 탈퇴</title>
</head>
<body>
<!-- TOP -->
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
<!-- TOP -->
	
	 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원탈퇴</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>회원탈퇴</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	
	<!-- 본문 -->
    <div id="sd-in" style="width:1560px;margin: 0 auto;">
    <aside class="side" style="display: inline-block;width:200px;vertical-align: top !important; margin-top: 8em;
    border: 2px #3B0B5F solid;border-radius: 10px;">
   		<ul class="side-list"> 
   			<li class="side-li" style="font-size:20px;margin-top: 20px;">
   				<p><a href="MyPageMain.my">마이페이지</a></p>
   				<p><a href="#">회원정보수정</a></p>
   				<p><a href="#">예매내역</a></p>
   				<p><a href="CouponList.my">쿠폰함</a></p>
   				<p><a href="MovieLikeList.my">찜목록</a></p>
   				<p><a href="ReviewList.my">리뷰내역</a></p>
   				<p><a href="#">문의내역</a></p>
   				<p><a href="#">회원탈퇴</a></p>
   			</li>
   		</ul>
   </aside>
   
   <section class="inner-page" style="display: inline-block;">
   
   <div class="ailgn" style="margin-left: 400px;margin-top: 150px;">
   <form name="checkPass" align="center" action="MemberDeletePro.sm" method="post">
	    <input type="hidden" value="${param.member_id }" name="member_id">
	    <div>
	        <strong>탈퇴하시려면 비밀번호를 한 번 더 입력해 주세요.</strong>
	    </div><br>
		<div>
			<label>비밀번호&nbsp;&nbsp;&nbsp;</label><input id="member_passwd" type="password" name="member_passwd">
	    </div>
	    <button type="submit" class="btn" style="margin-top: 15px;border: 1px solid;" onclick="confirm('정말 탈퇴하시겠습니까?');">확인</button>
     </form>
     </div>
	</section>
  </main><!-- End #main -->
	<!-- 본문 -->
	<!-- 본문 -->
	
	
	 <footer style="margin-top: 160px;">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
</html>