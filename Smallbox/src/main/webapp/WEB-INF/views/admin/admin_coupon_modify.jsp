<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정</title>
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
					<li><a href="CouponListTotal.ad">쿠폰 목록</a></li>
					<!-- 페이지 주소, 이름 넣는곳 -->
					<li><a href="CouponModify.ad"></a>쿠폰 수정</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- --------------------<관리자 페이지>에 들고다니세요----------------- -->
	<!-- 본문 영역 시작 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">쿠폰 수정</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
				<form action="CouponModifyPro.ad" name="fr" method="post">
					<input type="hidden" name="member_id" value="${param.member_id }">
					<input type="hidden" name="coupon_idx" value="${param.coupon_idx }">
					<table border="1">
						<thead>
							<tr>
								<th>쿠폰 유형</th>
								<th>할인율</th>
								<th>쿠폰 만료 날짜</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" name="coupon_type" required="required"></td>
								<td><input type="number" name="coupon_rate" required="required"></td>
								<td><input type="date" name="coupon_end_date"></td>
								<td><input class="pagebtn" style="border-radius: 4px; margin-top: 2px; margin-left:3px;" 
									type="submit" value="수정" ></td>
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

</body>
</html>