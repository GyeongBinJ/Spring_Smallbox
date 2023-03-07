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
				<h1 class="mt-4">회원 1:1 문의 답변</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
	<!-- 게시판 답글 작성 -->
	<form action="QnaReplyPro.my" name="qnaForm" method="post" style="margin-left:200px">
		<!-- 입력받지 않은 글번호, 페이지번호 hidden 속성으로 전달 -->
			<input type="hidden" name="qna_idx" value="${param.qna_idx }" >
			<input type="hidden" name="member_id" value="${sessionScope.sId }" >
			<input type="hidden" name="pageNum" value="${param.pageNum }" >
			<!-- 답글 작성에 필요한 정보도 hidden 속성으로 전달 -->
			<input type="hidden" name="qna_re_ref" value="${qna.qna_re_ref }" >
			<input type="hidden" name="qna_re_lev" value="${qna.qna_re_lev }" >
			<input type="hidden" name="qna_re_seq" value="${qna.qna_re_seq }" >
			<div class="form">
			<div class="title" style="font-size: larger;">답변 제목
			<em style="color:red ">*</em>
			<br>
			<input type="text" name="qna_subject" style="width:400px;" value="Re: ${qna.qna_subject }" required="required" />
			</div>
			<br>
			<div class="sub" style="font-size: larger;">답변 내용
			<em style="color:red ">*</em>
			<br>
			<textarea name="qna_content" maxlength="550" style="width:400px;" cols="40" rows="15" required="required" placeholder="관리자 답변 작성란"></textarea>
			</div>
			</div>
			<div class="commandCell">
				<button type="submit" class="pagebtn" style="margin-left:310px;">답변 전송</button>&nbsp;&nbsp;
			</div>
	</form>
	</section>
	</main>
	<br>
</div>
	<!-- 본문 영역 끝 -->
	<footer id="footer">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>