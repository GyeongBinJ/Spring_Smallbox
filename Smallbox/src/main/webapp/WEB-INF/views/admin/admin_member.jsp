<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/swiper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath}/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/css/style_admin.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	
</script>
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
					<li><a href="MemberList.ad">회원관리</a></li>
					<!-- 페이지 주소, 이름 넣는곳 -->
					<li><a href="MemberList.ad"></a>회원목록</li>
				</ol>
			</div>
		</div>
	</section>
	<!-- --------------------<관리자 페이지>에 들고다니세요----------------- -->
	<!-- 본문 영역 시작 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
			<section id="listForm">
				<h1 class="mt-4">회원 목록</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
				<form action="MemberList.ad" name="fr" >
					<input type="hidden" name="member_id" value="${param.member_id }">
					<table id="table">
						<thead>
							<tr>
								<th width="100">회원 번호</th>
								<th width="150">아이디</th>
								<th width="150">이름</th>
								<th width="200">E-Mail</th>
								<th width="200">연락처</th>
								<th width="150">가입날짜</th>
								<th width="150">생년월일</th>
								<th width="150">쿠폰</th>
							</tr>
						</thead>
						<tbody>
<!-- 							List<MemberBean> 객체 (memberList) 만큼 반복하면서 데이터 출력 -->
							<c:forEach var="member" items="${memberList }">
								<c:choose>
									<c:when test="${empty param.pageNum }">
										<c:set var="pageNum" value="1" />
									</c:when>
									<c:otherwise>
										<c:set var="pageNum" value="${param.pageNum }" />
									</c:otherwise>
								</c:choose>
								<tr>
									<td>${member.member_idx }</td>
									<td>${member.member_id }</td>
									<td>${member.member_name }</td>
									<td>${member.member_email }</td>
									<td>${member.member_phone }</td>
									<td>${member.member_join_date }</td>
									<td>${member.member_birth_date }</td>
									<td colspan="1">
<!-- 										멤버 아이디와 일치하는 회원에게 쿠폰 지급 및 목록 수행  -->
										<input type="button" class="pagebtn" value="쿠폰 지급" style="border-radius: 4px; margin-top: 5px;"
										onclick="location.href='CouponInsert.ad?member_id=${member.member_id }'">
										<input type="button" class="pagebtn" value="쿠폰 목록" style="border-radius: 4px; margin-top: 5px;"
										onclick="location.href='CouponList.ad?member_id=${member.member_id }'">
									</td>
								</tr>
							</c:forEach>
<!-- 							<tr> -->
<!-- 								<td colspan="8" id="td_right"> -->

<!-- 								</td> -->
<!-- 							</tr>	 -->
<!-- 						</tbody> -->
<!-- 						<tfoot> -->
									<!--
								현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
								=> 클릭 시 MemberList.ad 서블릿 주소 요청하면서 
								   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
								--> 
								<tr><td colspan="8" id="td_center">
								<c:choose>
										<c:when test="${pageNum > 1}">
											<input type="button" class="pagebtn" value="이전" style="border-radius: 4px; margin-top: 5px;"
												onclick="location.href='MemberList.ad?pageNum=${pageNum - 1}'">
										</c:when>
										<c:otherwise>
											<input type="button" class="pagebtn" value="이전" style="border-radius: 4px; margin-top: 5px;">
										</c:otherwise>
									</c:choose> <!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 --> <c:forEach
										var="i" begin="${pageInfo.startPage }"
										end="${pageInfo.endPage }">
										<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
										<c:choose>
											<c:when test="${pageNum eq i}">
											${i }
						</c:when>
											<c:otherwise>
												<a href="MemberList.ad?pageNum=${i }">${i }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach> <!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 --> <c:choose>
										<c:when test="${pageNum < pageInfo.maxPage}">
											<input type="button" class="pagebtn" value="다음"
												style="border-radius: 4px; margin-top: 5px;"
												onclick="location.href='MemberList.ad?pageNum=${pageNum + 1}'">
										</c:when>
										<c:otherwise>
											<input type="button" class="pagebtn" value="다음"
												style="border-radius: 4px; margin-top: 5px;">
										</c:otherwise>
									</c:choose>

							<input type="text" class="pagebtn" name="keyword" style="border-radius: 4px; margin-top: 5px;"> 
							<input type="submit" class="pagebtn" value="검색" style="border-radius: 4px; margin-top: 5px;">
								</td>
							</tr>

<!-- 						</tfoot> -->
						</tbody>
					</table>
				
				</form> 
				</section>
			</div>
		</main>
	</div>
	<!-- 본문 영역 끝 -->
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>