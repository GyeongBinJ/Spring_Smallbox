<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- EL 에서 표기 방식(날짜 등)을 변경하려면 fmt(format) 라이브러리 필요  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- Favicons -->
  <link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
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
				<h1 class="mt-4">회원 1:1 문의 삭제</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
	<section id="passForm" style="margin-left: 100px;">
	<h2>1:1 문의내역을 삭제하시겠습니까?</h2>
		<form action="QnaDeletePro.my" name="deleteForm" method="post">
			<!-- 입력받지 않은 글번호, 페이지번호 hidden 속성으로 전달 -->
			<input type="hidden" name="qna_idx" value="${param.qna_idx }" >
			<input type="hidden" name="pageNum" value="${param.pageNum }" >
			<hr>
			<button class="pagebtn">삭제</button>&nbsp;&nbsp;
			<input type="button" class="pagebtn" value="돌아가기" onclick="javascript:history.back()">
		</form>
	</section>
	</div>
	</main>
	<br>
</div>
	<!-- 본문 영역 끝 -->
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>




