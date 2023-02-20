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
          <h2>쿠폰함</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>쿠폰함</li>
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
   
   <section class="inner-page3">
	   <table style="text-align: center;margin-top: 80px;">
	    	<thead>
	    		<tr>
			        <th width="150">쿠폰 유형</th>
			        <th width="100">할인율</th>
			        <th width="250">쿠폰 지급일</th>
			        <th width="250">쿠폰 만료일</th>
	    		</tr>
	   		</thead>
	   		<tbody>
	   		    <!-- CouponListProAction으로 부터 전달받은 request 객체의 couponList를 꺼내서 출력 -->
			    <c:choose>
			    	<c:when test="${empty couponList }">
			    		<tr><td colspan="4">쿠폰이 존재하지 않습니다.</td></tr>
			    	</c:when>
			   		<c:otherwise>
						<c:forEach var="coupon" items="${couponList }">
				   			 <tr>
						        <td>${coupon.coupon_type }</td>
						        <td>${coupon.coupon_rate }</td>
						        <td>${coupon.coupon_date }</td>
						        <td>${coupon.coupon_end_date }</td>
				   			 </tr>
			    		</c:forEach>
			    	</c:otherwise>
				</c:choose>	
			 </tbody>
		</table>
	</section>

	<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
	<c:choose>
		<c:when test="${empty param.pageNum }">
			<c:set var="pageNum" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="pageNum" value="${param.pageNum }" />
		</c:otherwise>
	</c:choose>
	
	<div id="mypageList"> <!-- 페이징 처리 영역 -->
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" class="pagebtn" value="이전" onclick="location.href='CouponList.my?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="pagebtn" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="CouponList.my?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="pagebtn" value="다음" onclick="location.href='CouponList.my?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="pagebtn" value="다음">
			</c:otherwise>
		</c:choose>
	</div>
  </main><!-- End #main -->
	
	<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>