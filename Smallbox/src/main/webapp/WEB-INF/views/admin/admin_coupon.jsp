<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="CouponList.ad">${param.member_id } 회원 쿠폰 목록</a></li>
					<!-- 페이지 주소, 이름 넣는곳 -->
				</ol>
			</div>
		</div>
	</section>
	<!-- --------------------<관리자 페이지>에 들고다니세요----------------- -->
	<!-- 본문 영역 시작 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">${param.member_id }회원 쿠폰 목록</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
				<form action="CouponInsertPro.ad" name="fr" method="post">
					<table border="1">
						<thead>
							<tr>
								<th width="150">회원 아이디</th>
								<!-- <th width="150">쿠폰 번호</th> -->
								<th width="150">쿠폰 유형</th>
								<th width="100">할인율</th>
								<th width="150">쿠폰 발행 날짜</th>
								<th width="150">쿠폰 만료 날짜</th>
								<th width="100"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="coupon" items="${couponList }">
								<tr>
									<td>${coupon.member_id }</td>
									<%-- 			<td>${coupon.coupon_idx } </td> --%>
									<td>${coupon.coupon_type }</td>
									<td>${coupon.coupon_rate }</td>
									<td>${coupon.coupon_date }</td>
									<td>${coupon.coupon_end_date }</td>
									<td><input type="button" class="pagebtn" value="수정"
										style="border-radius: 4px; margin-top: 2px; margin-left: 3px;"
										onclick="location.href='CouponModify.ad?member_id=${coupon.member_id }&coupon_idx=${coupon.coupon_idx }'"">
										<input type="button" class="pagebtn" value="삭제"
										style="border-radius: 4px; margin-top: 2px; margin-left: 3px;"
										onclick="location.href='CouponDelete.ad?member_id=${coupon.member_id }&coupon_end_date=${coupon.coupon_end_date }'">
									</td>
								</tr>
							</c:forEach>
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