<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<head>
 <title>SMALLBOX</title>
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style_admin.css" rel="stylesheet">

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	<!-- 포스터 첨부 필수! -->
	function file_chk() {
		var file_chk = document.getElementById("file");
		if(!file_chk.value) {
			alert("사진을 업로드해주세요");
			return validate(event);
		}
	}
	
	function validate(event) {
	   event.preventDefault();
	}
	
	<!-- 장르선택 체크박스 체크 -->
	 $(document).ready(function() {
		var genre = "${movie.movie_genre}"
		var genreSplit = genre.split(",");
		for(var i in genreSplit ) {
// 			console.log(genreSplit[i])
		  $("input[type='checkbox'][value="+genreSplit[i]+"]").prop("checked", true);
		}
	 });
		 
	 <!-- 첨부파일 삭제 -->
	 function deletePoster(movie_picture) {
		if(confirm("첨부된 파일을 삭제 하시겠습니까?")) { // 확인 누르면 true, 취소 누르면 false
			$.ajax({
				type: "POST",
				url: "PosterDelete",
				data: {
					"movie_idx" : ${movie.movie_idx},
					"movie_pictue" : movie_picture
				},
				success: function(data) {
					if(data == "true") {
						// 삭제 성공 시 파일명 표시 위치의 기존 항목을 제거하고
						// 파일 업로드를 위한 "파일 선택" 버튼 항목 표시
						$("#fileArea").html('<input type="file" name="file" id="file">');
					} else if(data == "false") {
						alert("일시적인 오류로 파일 삭제에 실패했습니다!");
					}
				}
			});
		} else {
	        return false;
	    }
	}
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
	
	<header>
		<jsp:include page="../inc/top_admin.jsp"></jsp:include>
	</header>
	<!-- ======= header ======= -->
	  
	<main id="main">
	<!-- ======= Breadcrumbs ======= -->
	<div id="layoutSidenav_content">
	    <section class="breadcrumbs_admin">
	      <div class="container">
	
	        <div class="d-flex justify-content-between align-items-center">
	          <h2>영화 수정 </h2>
	          <ol>
	            <li><a href="Admin.ad">관리자 페이지</a></li>
	            <li><a href="AdminMovieList.ad">전체 영화</a></li>
	            <li>영화 수정</li>
	          </ol>
	        </div>
	      </div>
	    </section><!-- End Breadcrumbs -->
	    
        <div class="container-fluid px-4">
           <h1 class="mt-4">영화 수정</h1>
             <div class="card mb-4" style="margin-bottom: 30px;">
                 <div class="card-body">
                     - 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.
                 </div>
           	</div>
			<form action="MovieModifyPro.ad" name="fr" method="post" enctype="multipart/form-data" onsubmit="file_chk()">
			<input type="hidden" name="movie_idx" value="${movie.movie_idx }" >
			<input type="hidden" name="pageNum" value="${param.pageNum }" >
		
			<table style="border: 1;border-radius: 4px;">
				<th style="text-align: center;height: 40">영화 정보</th>
				<th style="text-align: center;height: 40">영화 정보</th>
				<tr><td>영화명</td>
					<td><label><input type="text" name="movie_title" value="${movie.movie_title }" required="required"></label>
					</td></tr>
				<tr>
					<td>등급</td>
					<td>
						<label><input type="radio" name="movie_grade" value="전체관람가" <c:if test="${movie.movie_grade eq '전체관람가' }">checked</c:if>>전체관람가</label>
						<label><input type="radio" name="movie_grade" value="12세이상관람가" <c:if test="${movie.movie_grade eq '12세이상관람가' }">checked</c:if>>12세이상관람가</label>
						<label><input type="radio" name="movie_grade" value="15세이상관람가" <c:if test="${movie.movie_grade eq '15세이상관람가' }">checked</c:if>>15세이상관람가</label>
						<label><input type="radio" name="movie_grade" value="청소년관람불가" <c:if test="${movie.movie_grade eq '청소년관람불가' }">checked</c:if>>청소년관람불가</label>
					</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>
						<label><input type="checkbox" name="movie_genre" value="코미디">코미디</label>
						<label><input type="checkbox" name="movie_genre" value="로맨스">로맨스</label>
						<label><input type="checkbox" name="movie_genre" value="액션">액션</label>
						<label><input type="checkbox" name="movie_genre" value="드라마">드라마</label>
						<label><input type="checkbox" name="movie_genre" value="애니메이션">애니메이션</label>
						<label><input type="checkbox" name="movie_genre" value="공포">공포</label>
						<label><input type="checkbox" name="movie_genre" value="SF">SF</label>
					</td>
				</tr>
				<tr>
					<td>개봉일</td>
					<td>
						<label><input type="date" name="movie_open_date" value="${movie.movie_open_date }" required="required"></label> 
					</td>
				</tr>
				<tr>
					<td>상영시간</td>
					<td>
						<label><input type="number" name="movie_runtime" value="${movie.movie_runtime }" required="required"></label>
					</td>
				</tr>
				<tr>
					<td>줄거리</td>
					<td><textarea name="movie_intro" cols="50" rows="10" required="required">${movie.movie_intro }</textarea></td>
				</tr>
				<tr>
					<td>등장인물</td>
					<td><textarea name="movie_actors" cols="50" rows="3" required="required">${movie.movie_actors }</textarea></td>
				</tr>
				<tr>
					<td>영화 포스터</td>
					<td>
						<div id="fileArea">
						<c:choose>
							<c:when test="${not empty movie.movie_picture }">
								<c:set var="nameLength" value="${fn:length(movie.movie_picture)}" />
								<c:set var="indexOf_" value="${fn:indexOf(movie.movie_picture, '_') }" />
								<c:set var="fileName" value="${fn:substring(movie.movie_picture, indexOf_ + 1, nameLength) }" />
								<img src="${pageContext.request.contextPath }/resources/upload/${movie.movie_picture}" width="50" height="50">
								<span id="posterName">${fileName}</span>
								<input type="button" value="삭제" onclick="deletePoster('${movie.movie_picture }')">
								<input type="hidden" name="movie_picture" value="${movie.movie_picture }">
							</c:when>
							<c:otherwise>
								<input type="file" name="file" id="file">
							</c:otherwise>									
						</c:choose>
						</div>
					</td>
				</tr>
				<tr>
					<td>영화 티저</td>
					<td>
						<label>
							<span>https://www.youtube.com/embed/</span>
							<input type="text" name="movie_teaser" value="${movie.movie_teaser }" required="required" style="width:150px"/>
						</label>
					</td>
				</tr>
				<tr>
					<td>누적 관람객 수</td>
					<td><label><input type="number" name="movie_viewer" value="${movie.movie_viewer }" required="required"></label></td>
				</tr>
				<tr>
					<td colspan="2">
					<div style="text-align: center;">
						<input type="submit" class="pagebtn2" value="등록">
					</div>
					</td>
				</tr>
			</table>
		</form>
	  </div>
    </div>
 </main>
	        
	<!-- ======= Footer ======= -->
	<footer>
		<jsp:include page="../inc/bottom.jsp" />
	</footer>
</body>
</html>