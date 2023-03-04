<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지글 관리</title>
<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/assets/css/style_admin.css" rel="stylesheet">
</head>
<body>
	

	<header id="header">
    	<jsp:include page="../inc/top_admin.jsp"></jsp:include>
    </header>
<!-- ----------------------------------------<관리자 페이지>에 들고다니세요--------------------------------------------------------- -->    
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지</h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li><a href="Notice_list.ad">공지</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- --> 
	<!-- 본문 영역 시작 -->
    <div id="layoutSidenav_content">
	    <main>
	         <div class="container-fluid px-4">
	             <h1 class="mt-4">공지사항 목록</h1>
		            <div class="card mb-4">
		                 <div class="card-body">
		                 </div>
		           	</div>
			           	<c:choose>
						<c:when test="${empty param.pageNum }">
							<c:set var="pageNum" value="1" />
						</c:when>
						<c:otherwise>
							<c:set var="pageNum" value="${param.pageNum }" />
						</c:otherwise>
					</c:choose>
	           <table>
				  <thead>
				    <tr>
						<th width="100">글번호</th> 
						<th width="150">제목</th>
						<th width="50">조회수</th>
						<th width="200">작성일자</th>
					</tr>
				  </thead>
				  <tbody>
						<!-- 		글 상세 목록 표시 -->
						<c:forEach var="notice" items="${noticeList }">
							<tr>
								<td>${notice.notice_idx }</td>
									<c:choose>
										<c:when test="${empty param.pageNum }">
											<c:set var="pageNum" value="1" />
										</c:when>
										<c:otherwise>
											<c:set var="pageNum" value="${param.pageNum }" />
										</c:otherwise>
									</c:choose>
								<td id="subject">
									<a href="NoticeDetail.ad?notice_idx=${notice.notice_idx }&pageNum=${pageNum }">
										${notice.notice_subject }
									</a>
								</td>
								<td>${notice.notice_readCount }</td>
								<td>
									<%-- JSTL 의 fmt 라이브러리를 활용하여 날짜 표현 형식 변경 --%>
									<%-- fmt:formatDate - Date 타입 날짜 형식 변경 --%>
									<%-- fmt:parseDate - String 타입 날짜 형식 변경 --%>
									<fmt:formatDate value="${notice.notice_date }" pattern="yy-MM-dd HH:mm"/>
								</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="4">
								</td>
							</tr>
		 		</tbody>
			</table>
				<section id="buttonArea">
					<form action="Notice_list.ad">
						<input type="text" class="pagebtn" name="keyword">
						<input type="submit" class="pagebtn" value="검색">
						&nbsp;&nbsp;
						<input type="button" class="pagebtn" value="글쓰기" onclick="location.href='Admin_notice_write.ad'" />
					</form>
				</section>
				<section id="pageList">
					<!-- 
					현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
					=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
					   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
					-->
					<c:choose>
						<c:when test="${pageNum > 1}">
							<input type="button" class="pagebtn" value="이전" onclick="location.href='Notice_list.ad?pageNum=${pageNum - 1}'">
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
								<a href="NoticeList.ad?pageNum=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
			
					<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
					<c:choose>
						<c:when test="${pageNum < pageInfo.maxPage}">
							<input type="button" class="pagebtn" value="다음" onclick="location.href='Notice_list.ad?pageNum=${pageNum + 1}'">
						</c:when>
						<c:otherwise>
							<input type="button" class="pagebtn" value="다음">
						</c:otherwise>
					</c:choose>
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