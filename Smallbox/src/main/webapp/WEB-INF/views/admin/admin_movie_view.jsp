<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
function confirm_delete() {
	let result = confirm("삭제 하시겠습니까?");
	
	if(result) {
		location.href="MovieDeletePro.ad?movie_idx=${movie.movie_idx}";
	}
}
</script>
<!DOCTYPE html>
<head>
<title>SMALLBOX</title>
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main CSS File -->
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
	
	<header>
		<jsp:include page="../inc/top_admin.jsp"></jsp:include>
	</header>
	  <!-- ======= header ======= -->
	  
	<main id="main">
	
	<!-- pageNum 변수 선언 및 기본값 1로 설정 -->
		<c:choose>
			<c:when test="${empty param.pageNum }">
				<c:set var="pageNum" value="1" />
			</c:when>
			<c:otherwise>
				<c:set var="pageNum" value="${param.pageNum }" />
			</c:otherwise>
		</c:choose>
	
	<!-- ======= Breadcrumbs ======= -->
	<div id="layoutSidenav_content">
		    <section class="breadcrumbs_admin">
		      <div class="container">
		        <div class="d-flex justify-content-between align-items-center">
		          <h2>영화 조회</h2>
		          <ol>
		            <li><a href="Admin.ad">관리자 페이지</a></li>
		            <li><a href="AdminMovieList.ad">전체 영화</a></li>
		            <li>영화 조회</li>
		          </ol>
		        </div>
		      </div>
		    </section><!-- End Breadcrumbs -->
			
           <div class="container-fluid px-4">
              <h1 class="mt-4">영화 조회</h1>
	             <div class="card mb-4" style="margin-bottom: 30px;">
	                 <div class="card-body">
	                     - 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.
	                 </div>
	           	 </div>
			 <table style="border: 1;border-radius: 4px;">
				<th style="text-align: center;height: 40">영화 정보</th>
				<th style="text-align: center;height: 40">영화 정보</th>
				<tr><td>영화명</td><td>${movie.movie_title }</td></tr>
				<tr>
					<td>등급</td>
					<td>${movie.movie_grade }</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>${movie.movie_genre }</td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td>${movie.movie_open_date }</td>
				</tr>
				<tr>
					<td>상영시간</td>
					<td>${movie.movie_runtime }분</td>
				</tr>
				<tr>
					<td height="300">줄거리</td>
					<td colspan="3">${movie.movie_intro }</td>
				</tr>
				<tr>
					<td>등장인물</td>
					<td>${movie.movie_actors }</td>
				</tr>
				<tr>
					<td width="150">영화 포스터</td>
					<td>
						<img src="${pageContext.request.contextPath }/resources/upload/${movie.movie_picture}" width="300" height="350">
					</td>
				</tr>
				<tr>
					<td>영화 티저</td>
					<td>
						<iframe width="800" height="400" src="https://www.youtube.com/embed/${movie.movie_teaser }?autoplay=1&mute=1"></iframe>
					</td>
				</tr>
				<tr>
					<td>누적 관람객 수</td>
					<td>${movie.movie_viewer }명</td>
					<td>${pageNum }</td>
				</tr>
				<tr>
					<td colspan="2">
					 <div style="text-align: center;">
						<input type="button" class="pagebtn2" value="목록" onclick="location.href='AdminMovieList.ad?pageNum=${pageNum }'">
						<input type="button" class="pagebtn2" value="수정" onclick="location.href='MovieModifyForm.ad?movie_idx=${movie.movie_idx}&pageNum=${pageNum }'">
						<input type="button" class="pagebtn2"value="삭제" onclick="javascript:confirm_delete()">
					</div>
					</td>
				</tr>
			</table>
		   </div>
		</div>
	</main>
				
	<!-- ======= Footer ======= -->
	<footer>
		<jsp:include page="../inc/bottom.jsp" />
	</footer>
</body>
</html>