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
 <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
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
				<h1 class="mt-4">회원 1:1 문의 목록</h1>
				<div class="card mb-4">
					<div class="card-body">- 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.</div>
				</div>
	<table>
		<thead>
			<tr>
				<th width="100px">문의 번호</th>
				<th width="100px">작성자</th>
				<th width="400px">제목</th>
				<th width="150px">날짜</th>
			</tr>
		</thead>
	<tbody>
	<!-- JSTL 과 EL 활용하여 글목록 표시 작업 반복 -->
	<%-- for(QnaBean qna : qnaList) {} --%>
	<c:forEach var="qna" items="${qnaList }">
		<tr>
			<td>${qna.qna_idx }</td>
			<!-- 제목 하이퍼링크(QnaDetail.me) 연결 -> 파라미터 : 글번호, 페이지번호 -->
			<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
			<c:choose>
				<c:when test="${empty param.pageNum }">
					<c:set var="pageNum" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="pageNum" value="${param.pageNum }" />
				</c:otherwise>
			</c:choose>
			<td>${qna.member_id }</td>
			<td id="subject">
				<%-- ======================== 답글 관련 처리 ======================= --%>
				<%-- qna_re_lev 값이 0보다 크면 답글이므로 들여쓰기 후 이미지 추가 --%>
				<c:if test="${qna.qna_re_lev > 0 }">
					<%-- 반복문을 통해 qna_re_lev 값 만큼 공백 추가 --%>
					<c:forEach var="i" begin="1" end="${qna.qna_re_lev }">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<%-- 답글 제목 앞에 아이콘 추가 --%>
					<i class="fa-brands fa-replyd"></i> [상담완료]
				</c:if>
				<%-- =============================================================== --%>
				<a href="QnaDetail.ad?qna_idx=${qna.qna_idx }&pageNum=${pageNum }">
					${qna.qna_subject }
				</a>
			</td>
			<td>
				<%-- JSTL 의 fmt 라이브러리를 활용하여 날짜 표현 형식 변경 --%>
				<%-- fmt:formatDate - Date 타입 날짜 형식 변경 --%>
				<%-- fmt:parseDate - String 타입 날짜 형식 변경 --%>
				<fmt:formatDate value="${qna.qna_date }" pattern="yy-MM-dd HH:mm"/>
			</td>
		</tr>
	</c:forEach>
	</table>
	<section id="pageList" style="text-align: center; margin-left:50px; margin-top: -250px;"> <!-- 페이징 처리 영역 -->
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 QnaList.me 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" class="pagebtn" value="이전" onclick="location.href='QnaList.ad?&pageNum=${pageNum - 1}'">
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
					<a href="QnaList.ad?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="pagebtn" value="다음" onclick="location.href='QnaList.ad?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="pagebtn" value="다음">
			</c:otherwise>
		</c:choose>
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











