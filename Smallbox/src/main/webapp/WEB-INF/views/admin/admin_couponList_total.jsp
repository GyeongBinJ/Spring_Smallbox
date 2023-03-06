<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- ain CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style_admin.css" rel="stylesheet">
</head>
<body>
	<!-- 관리자 아니면 접근 불가 -->
	<c:if test="${empty sessionScope.sId or sessionScope.sId ne 'admin'}">
		<script type="text/javascript">
			alert("접근 불가합니다.");
			history.back();
		</script>
	</c:if>
	<!-- 관리자 아니면 접근 불가 -->

	<!-- TOP -->
	<header>
		<jsp:include page="../inc/top_admin.jsp"></jsp:include>
	</header>
	<!-- TOP -->
	<!-- --------------------<관리자 페이지>에 들고다니세요----------------- -->
	<section class="breadcrumbs_admin">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center">
				<h2>관리자 페이지</h2>
				<ol>
					<li><a href="Admin.ad">관리자 페이지</a></li>
					<li><a href="MemberList.ad">회원 관리</a></li>
					<!-- 페이지 주소, 이름 넣는곳 -->
					<li><a href="CouponListTotal.ad"></a>쿠폰 목록</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- --------------------<관리자 페이지>에 들고다니세요----------------- -->
	<!-- 본문 영역 시작 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">쿠폰 목록</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
				<form action="CouponListTotal.ad">
					<table border="1" name="fr">
						<thead>
							<tr>
								<th width="150">회원 아이디</th>
								<!-- 			<th width="150">쿠폰 번호</th> -->
								<th width="150">쿠폰 유형</th>
								<th width="100">할인율</th>
								<th width="150">쿠폰 발행 날짜</th>
								<th width="150">쿠폰 만료 날짜</th>
								<th width="100"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="coupon" items="${couponList }">
									<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
									<c:choose>
										<c:when test="${empty param.pageNum }">
											<c:set var="pageNum" value="1" />
										</c:when>
										<c:otherwise>
											<c:set var="pageNum" value="${param.pageNum }" />
										</c:otherwise>
									</c:choose>
								<tr>
									<td><a href="CouponList.ad?member_id=${coupon.member_id }">${coupon.member_id }</a></td>
									<%-- 			<td>${coupon.coupon_idx } </td> --%>
									<td>${coupon.coupon_type }</td>
									<td>${coupon.coupon_rate }</td>
									<td>${coupon.coupon_date }</td>
									<td>${coupon.coupon_end_date }</td>
									<td><input type="button" style="border-radius: 4px; margin-top: 5px;" class="pagebtn" value="수정"
										onclick="location.href='CouponModify.ad?member_id=${coupon.member_id }&coupon_idx=${coupon.coupon_idx }'">
										<input type="button" style="border-radius: 4px; margin-top: 5px;"class="pagebtn" value="삭제"
										onclick="location.href='CouponDelete.ad?member_id=${coupon.member_id }&coupon_end_date=${coupon.coupon_end_date }'">
									</td>
								</tr>
							</c:forEach>

			<tr>
			<td colspan="6" id="td_center">
			
				<!-- 페이징 처리 영역 -->
				<!-- 
					현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
					=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
					   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
				-->
				<c:choose>
					<c:when test="${pageNum > 1}">
						<input type="button" class="pagebtn" value="이전" style="border-radius: 4px; margin-top: 5px;"
							onclick="location.href='CouponListTotal.ad?pageNum=${pageNum - 1}'">
					</c:when>
					<c:otherwise>
						<input type="button" class="pagebtn" value="이전" style="border-radius: 4px; margin-top: 5px;">
					</c:otherwise>
				</c:choose>

				<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }">
					<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
					<c:choose>
						<c:when test="${pageNum eq i}">
							${i }
						</c:when>
						<c:otherwise>
							<a href="CouponListTotal.ad?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
				<c:choose>
					<c:when test="${pageNum < pageInfo.maxPage}">
						<input type="button" class="pagebtn" value="다음" style="border-radius: 4px; margin-top: 5px;"
							onclick="location.href='CouponListTotal.ad?pageNum=${pageNum + 1}'">
					</c:when>
					<c:otherwise>
						<input type="button" class="pagebtn" value="다음" style="border-radius: 4px; margin-top: 5px;">
					</c:otherwise>
				</c:choose>
				<input type="text" class="pagebtn" name="keyword" style="border-radius: 4px; margin-top: 5px;"> 
				<input type="submit" class="pagebtn" value="검색" style="border-radius: 4px; margin-top: 5px;">
			
				</td>
			</tr>
						</tbody>
					</table>
				</form>
			</div>
		</main>
	</div>
	<!-- 본문 영역 끝 -->
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>