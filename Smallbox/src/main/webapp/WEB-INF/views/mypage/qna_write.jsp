<%@page import="java.util.List"%>
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
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/css/couponlist.css" rel="stylesheet">
  <!--   답글아이콘 -->
  <script src="https://kit.fontawesome.com/5a85844b1b.js" crossorigin="anonymous"></script>
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
          <h2>1:1 문의</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>1:1 문의</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	
	
	<!-- 본문 -->
	<!-- 사이드바 -->
    <div id="sd-in" style="width:1560px;margin: 0 auto;margin-bottom: 50px;">
   		<dropdown style="display: inline-block;width:200px;vertical-align: top !important; margin-top: 8em;">
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
	
	<section class="inner-page" style="display: inline-block;  margin-left:170px; margin-top:50px;">
	
	<h2 style="margin-left:50px">1:1 문의하기<br></h2>
			<hr style="margin-left:40px;">
	<form action="QnaWritePro.my" name="qnaForm" method="post" style="margin-left:50px">
			<li style="color:gray;">문의 등록 후 삭제나 수정이 불가합니다.</li>
			<div class="title">제목
			<em style="color:red ">*</em>
			<br>
			<input type="text" name="qna_subject" style="width:100%;" required="required" />
			</div>
			<br>
			<div class="sub">문의사항
			<em style="color:red ">*</em>
			<br>
			<textarea name="qna_content" maxlength="550" cols="40" rows="15" required="required" placeholder="문의내용에 개인정보(이름,연락처,카드번호 등)가 포함되지 않도록 유의하시기 바랍니다.
회원로그인 후 문의작성시 나의 문의내역을 통해 답변을 확인하실 수 있습니다."></textarea>
			</div>
			<div class="commandCell">
				<input type="hidden" name="member_id" value="${sessionScope.sId }">
				<button type="submit" class="pagebtn" style="float:right">문의접수</button>&nbsp;&nbsp;
			</div>
	</form>
	</section>
</main>
  
	<!-- 본문 -->
	
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>







