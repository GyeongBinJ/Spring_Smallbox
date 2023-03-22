<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link href="${pageContext.request.contextPath }/resources/assets/css/couponlist.css" rel="stylesheet">


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
    </section>
    <!-- End Breadcrumbs -->
	
    <!-- 사이드바 -->
    <div id="sd-in" style="width:1560px;margin: 0 auto;margin-bottom: 50px;">
	<dropdown style="display: inline-block; width:200px; vertical-align:top !important; margin-top: 8em;">
 		<input id="toggle1" type="checkbox" checked>
 		<label class="animate">MENU<i class="fa fa-bars float-right"></i></label>
  		<ul class="animate">
		    <li class="animate"><a href="MyPageMain.my">마이페이지</a></li>
		    <li class="animate"><a href="MemberModifyForm.sm?member_id=${sessionScope.sId }">회원정보수정</a></li>
		    <li class="animate"><a href="Reserved.my">예매내역</a></li>
		    <li class="animate"><a href="CouponList.my">쿠폰함</a></li>
		    <li class="animate"><a href="MovieLikeList.my">찜목록</a></li>
		    <li class="animate"><a href="ReviewList.my">리뷰내역</a></li>
		    <li class="animate"><a href="QnaList.my">문의내역</a></li>
		    <li class="animate"><a href="MemberDelete.sm?member_id=${sessionScope.sId }">회원탈퇴</a></li>
  		</ul>
  	</dropdown>
  	<!-- 사이드바 -->
   
   <section class="inner-page" style="display: inline-block; margin-left: 200px; padding-top: 150px;">
   
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