<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- --------------------- 들고다니세요 ------------------------------------ -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/css/style_admin.css" rel="stylesheet">
<!-- --------------------- 들고다니세요 ------------------------------------ -->
<title>관리자 - 상영 영화관 정보수정</title>
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
<!-- --------------------- <관리자 페이지> 들고다니세요 ------------------------------------ -->
    <section class="breadcrumbs_admin">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li><a href="Admin.ad">관리자 페이지</a></li>
            <li><a href="AdminTheaterModifyPro.ad">상영일정 수정</a></li>
            <!-- 페이지 주소, 이름 넣는곳 -->
<!--             <li><a href="#"></a>##</li> -->
          </ol>
        </div>
      </div>
    </section>
<!-- --------------------- <관리자 페이지> 들고다니세요 ------------------------------------ -->

<!-- 본문 영역 시작 -->           
       <div id="layoutSidenav_content">
	    <main>
	         <div class="container-fluid px-4">
	             <h1 class="mt-4">상영일정 수정</h1>
		            <div class="card mb-4">
		                 <div class="card-body">
		                     - 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.
		                 </div>
		           	</div>
		           	<form action="AdminTheaterModifyPro.ad" name="fr" method="post">
					<input type="hidden" name="theater_idx" value="${theater.theater_idx }">
	           <table>
				  <thead>
				    <tr>
				       <th width="300">상영 영화명</th>
				       <th width="250">상영 날짜</th>
				       <th width="250">영화 상영시각</th>
				       <th width="250">잔여 좌석</th>
				       <th width="100">비고</th>
				    </tr>
				  </thead>
				 <tbody>
					<tr>
						<td>
							<div class="movie_list">
					            <select name="theater_title">
										<c:forEach var="movie" items="${movieList }">
											<option value="${movie.movie_title }" <c:if test="${movie.movie_title eq theater.theater_title}">selected</c:if>>
													${movie.movie_title }
											</option>
										</c:forEach>
								</select>
							</div>
						</td>
						<td><input type="date" name="theater_date" value="${theater.theater_date }" required="required"></td>
						<td>
<%-- 							<input type="time" name="theater_time" value="${theater.theater_time }" readonly="readonly"><br><br> --%>
							1회차 [09:00]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="theater_time" value="${theater.theater_time }" <c:if test="${theater.theater_time eq '09:00:00'}">checked</c:if>><br>
							2회차 [12:00]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="theater_time" value="${theater.theater_time }" <c:if test="${theater.theater_time eq '12:00:00'}">checked</c:if>><br>
							3회차 [15:00]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="theater_time" value="${theater.theater_time }" <c:if test="${theater.theater_time eq '15:00:00'}">checked</c:if>><br>
							4회차 [18:00]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="theater_time" value="${theater.theater_time }" <c:if test="${theater.theater_time eq '18:00:00'}">checked</c:if>><br>
							5회차 [21:00]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="theater_time" value="${theater.theater_time }" <c:if test="${theater.theater_time eq '21:00:00'}">checked</c:if>><br>
							6회차 [24:00]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="theater_time" value="${theater.theater_time }" <c:if test="${theater.theater_time eq '24:00:00'}">checked</c:if>>
						</td>
						<td><input type="number" name="theater_seat_cnt" value="${theater.theater_seat_cnt }"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" id="td_right">
							<i class="fas fa-table me-1"></i>
							<input type="submit" class="pagebtn" value="수정완료">
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