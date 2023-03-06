<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
	<section class="inner-page" style="display: inline-block; margin-left:130px;">
	<section id="basicInfoArea">
<!-- 	<h2 style="margin-left:80px">문의 상세보기<hr></h2> -->
		<table style="text-align: center; margin-top: 70px; margin-left: 100px;">
			<tr>
				<td colspan="3" style="text-align:left"><h2>${qna.qna_subject }</h2></td>
			</tr>
			<tr>
				<td width="70" style="color:gray;text-align:left;">  등록일</td>
				<td colspan="3" style="color:gray"><fmt:formatDate value="${qna.qna_date }" pattern="yy-MM-dd HH:mm:SS" /></td>
			</tr>
		</table>
		<table style="text-align: center; margin-top: 0px; margin-left: 100px;">
			<tr>
				<td width="800px">${qna.qna_content }</td>
			</tr>
		</table>
	<section id="commandList" style="float:right; margin-right:50px;">
		<input type="button" class="pagebtn" value="목록" onclick="location.href='QnaList.my?pageNum=${param.pageNum}'">
	</section>
	</section>
	</section>
	</main>
</body>
</html>
















