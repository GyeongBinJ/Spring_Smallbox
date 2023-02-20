<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<head>
<title>SMALLBOX</title>
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/css/mypagemain.css" rel="stylesheet">
</head>
<body>
	<!-- 비회원 접근 불가 -->
	<c:if test="${empty sessionScope.sId }">
		<script type="text/javascript">
		 	alert("접근 불가합니다.");
		 	history.back();
		</script>
	</c:if>
	<!-- 비회원 접근 불가 -->

	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>MyPage</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>MyPage</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
	
	<!-- 본문 -->
	<!-- 사이드바 -->
    <div id="sd-in">
   		<dropdown>
  		<input id="toggle1" type="checkbox" checked>
  		<label class="animate">MENU<i class="fa fa-bars float-right"></i></label>
	  		<ul class="animate">
			    <li class="animate"><a href="MyPageMain.my">마이페이지</a></li>
			    <li class="animate"><a href="MemberModifyForm.sm">회원정보수정</a></li>
			    <li class="animate"><a href="Reserved.my">예매내역</a></li>
			    <li class="animate"><a href="CouponList.my">쿠폰함</a></li>
			    <li class="animate"><a href="MovieLikeList.my">찜목록</a></li>
			    <li class="animate"><a href="ReviewList.my">리뷰내역</a></li>
			    <li class="animate"><a href="QnaList.my">문의내역</a></li>
			    <li class="animate"><a href="MemberDeleteForm.sm">회원탈퇴</a></li>
	  		</ul>
  		</dropdown>
  	<!-- 사이드바 -->

	    <section class="inner-page3" style="display: inline-block;">
		  	 <div id="vcard">
		  		<div id="card-content">
		    		<div id="profile">
		      			<span class="avatar">
		       				<span class="typicons-user icon"></span>
		        			<span class="info">
		        			${mypage.member_id }님의 마이페이지
		         			<br />
		        			${mypage.member_email }
		        			</span>
		     		    </span>
		   			</div>
			   		<div id="options" >
			     		<ul>
					        <li><a style="color: white;" href="MovieLikeList.my"><span class="typicons-heart icon"></span>찜<br>${mypage.ml_count }개</a></li>
					        <li><a style="color: white;" href="CouponList.my"><span class="typicons-star icon"></span>쿠폰<br>${mypage.cp_count }개</a></li>
					        <li><a style="color: white;" href="ReviewList.my"><span class="typicons-edit icon"></span>리뷰<br>${mypage.cm_count }개</a></li>
					        <li><a style="color: white;" href="MemberModifyForm.sm"><span class="typicons-cog icon"></span>회원정보수정</a></li>
			     	    </ul>
			   		</div>
		 	 	</div>
			</div>
		</section>
	</div>
	<!-- 본문 -->
  </main>
  
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>