<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/css/style_admin.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->            
<title>영화 상영일정 조회</title>
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
	<header id="header">
    	<jsp:include page="../inc/top_admin.jsp"></jsp:include>
    </header>    
<!-- ----------------------------------------<관리자 페이지>에 들고다니세요--------------------------------------------------------- -->    
    <section class="breadcrumbs_admin">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li><a href="Admin.ad">관리자 페이지</a></li>
            <!-- 페이지 주소, 이름 넣는곳 -->
            <li><a href="AdminTheaterList.ad">상영일정 조회</a></li>
          </ol>
        </div>
      </div>
    </section>
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->         
           
<!-- 본문 영역 시작 -->
    <div id="layoutSidenav_content">
	    <main>
	         <div class="container-fluid px-4">
	             <h1 class="mt-4">상영일정 목록</h1>
		            <div class="card mb-4">
		                 <div class="card-body">
		                     - 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.
		                 </div>
		           	</div>
	           <table>
				  <thead>
				    <tr>
				       <th>번호</th>
				       <th>상영 영화명</th>
				       <th>상영 날짜</th>
				       <th>영화 상영시각</th>
				       <th>잔여 좌석</th>
				       <th>비고</th>
				    </tr>
				  </thead>
				  <tbody>
						<!-- 상영 영화관 목록 -->
						<c:forEach var="theater" items="${theaterList }">
							<tr>
								<td>${theater.theater_idx }</td>
									<!-- pageNum값 null 방지를 위한 코드 -->
									<c:choose>
										<c:when test="${empty param.pageNum }">
											<c:set var="pageNum" value="1"/>
										</c:when>
										<c:otherwise>
											<c:set var="pageNum" value="${param.pageNum }"/>
										</c:otherwise>
									</c:choose>
								<td>
									<a href="AdminTheaterDetail.ad?theater_idx=${theater.theater_idx }">${theater.theater_title }</a>
								</td>
								<td>${theater.theater_date }</td>
								<td>${theater.theater_time }</td>
								<td>${theater.theater_seat_cnt }</td>
								<td></td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="6" id="td_right">
									<form action="AdminTheaterList.ad">
										<input type="text" id="datatablesSimple" name="keyword">
										<input type="submit" id="datatablesSimple" value="검색">
										&nbsp;&nbsp;
									</form>
								</td>
							</tr>
							<tr>
								<td colspan="6" id="td_center">
									<!-- 페이징 처리를 위한 코드 -->
										<c:choose>
											<c:when test="${pageNum > 1}">
												<input type="button" value="이전" onclick="location.href='AdminTheaterList.ad?pageNum=${pageNum - 1}'">
											</c:when>
											<c:otherwise>
												<input type="button" value="이전">
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
													<a href="AdminTheaterList.ad?pageNum=${i }">${i }</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
								
										<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
										<c:choose>
											<c:when test="${pageNum < pageInfo.maxPage}">
												<input type="button" value="다음" onclick="location.href='AdminTheaterList.ad?pageNum=${pageNum + 1}'">
											</c:when>
											<c:otherwise>
												<input type="button" value="다음">
											</c:otherwise>
										</c:choose>
								</td>
							</tr>
		 			</tbody>
				</table>
				</div>
	        </main>
       </div>
                <!-- 본문 영역 끝 -->
               <footer id="footer">
      		<jsp:include page="../inc/bottom.jsp"></jsp:include>
      </footer>
    </body>
</html>