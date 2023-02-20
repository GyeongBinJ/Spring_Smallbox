<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function confirm_delete(movie_idx) {
	let result = confirm("삭제 하시겠습니까?");
	
	if(result) {
		location.href="MovieDeletePro.ad?movie_idx="+movie_idx;
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
<!-- ain CSS File -->
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
	
	<!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs_admin">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>전체 영화 </h2>
          <ol>
            <li><a href="Admin.ad">관리자 페이지</a></li>
            <li>전체 영화</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
	
	 <!-- ======= 찐 본문영역 ======= -->
	<section class="inner-page" style="display: inline;">
	
	  	<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
		<c:choose>
			<c:when test="${empty param.pageNum }">
				<c:set var="pageNum" value="1" />
			</c:when>
			<c:otherwise>
				<c:set var="pageNum" value="${param.pageNum }" />
			</c:otherwise>
		</c:choose>
      <div class="container">
        <p>
       	  <section class="py-5">
		 <form action="AdminMovieList.ad">
       	  	<div style="margin-bottom: 10px;">
				<input type="text" name="keyword" class="input_box">
				<input type="submit" value="Search" class="btn">
			</div>
		</form>
        	<div class="wrap">
       		<div class="row row-cols-1 row-cols-md-4 g-4">
        	<!-- MovieLikeListProAction으로 부터 전달받은 request 객체의 likeList(영화 정보)를 꺼내서 출력 -->
			<c:forEach var="movie" items="${starmovieList }">
        		<div class="col">
            	<div class="card" style="object-fit:cover">
               		 <a href="AdminMovieDetailPro.ad?movie_idx=${movie.movie_idx}&pageNum=${pageNum }"><img src="${pageContext.request.contextPath }/resources/upload/${movie.movie_picture}"  width="300" height="350"
                     class="card-img-top" alt="..." ></a> <!-- 포스터 클릭하면 상세페이지로 이동 -->
	                <div class="card-body">
		                <h5 class="card-title" style="text-align: center;font-size: 19px;">${movie.movie_title }</h5>
		                <h5 class="card-date" style="text-align: center;font-size: 16px;">개봉일 ${movie.movie_open_date }</h5>
		               	<P class="card-star" style="text-align: center;">평점 ${movie.comment_star }</P><!-- 평균낸 별점과 자바스크립트 들어가면 될듯 -->
	                <div class="text-center"> 
	                	<a class="btn btn-outline-dark mt-auto" href="MovieModifyForm.ad?movie_idx=${movie.movie_idx}&pageNum=${pageNum }">수정</a>
	                	<a class="btn btn-outline-dark mt-auto" href="javascript:confirm_delete(${movie.movie_idx})">삭제</a></div>
	                </div>
           		</div>
       	        </div>
       		</c:forEach>
   			</div>
    		</div>
    	</section>
       </p>
    </div>
   </section>
   <section id="pageList" style="text-align: center;"> <!-- 페이징 처리 영역 -->
		
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" class="pagebtn" value="이전" onclick="location.href='AdminMovieList.ad?pageNum=${pageNum - 1}'">
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
					<a href="AdminMovieList.ad?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="pagebtn" value="다음" onclick="location.href='AdminMovieList.ad?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="pagebtn" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
  </main>
		
	<!-- ======= Footer ======= -->
	<footer>
		<jsp:include page="../inc/bottom.jsp" />
	</footer>
</html>