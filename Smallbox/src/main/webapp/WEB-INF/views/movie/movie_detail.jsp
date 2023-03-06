<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
 
 <!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	var locked = 0;
	var i;
	var image;
	var el;
	
	function mouseover(star) {
		if (locked==1)
			return;
		
		for (i = 1; i <= star; i++){
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "image/star1.jpg";
		} // ~~~ for end~~~
		
	} // ~~~~function mouseover end~~~~
	
	function mouseout(star) {
		if (locked==1)
			return;
		
		for(i = 1; i <=star;i++){
			image = 'image'+i;
			el = document.getElementById(image);
			el.src = "image/star0.png";
		}// ~~~ for end~~~
	} // ~~~~function mouseout end~~~~

	function lock(star) {
		mouseover(star);
		locked=1;
	}  // ~~~~function lock end~~~~
	
	function onClk(star) {
		lock(star);
		alert("별점 : " + star);
		document.commentForm.star.value=star;
	} // ~~~~function onClk end~~~~
	
	function confirmDelete(comment_idx, movie_idx) {
		let result = confirm("댓글을 삭제 하시겠습니까?");
		
		if(result) {
			location.href="DelComment.mv?comment_idx=" + comment_idx + "&movie_idx=" + movie_idx;
		}
	}
	$(document).ready(function() {
		   
	      $("form").submit(function() {
	      
	        if($("input[name=star]").val() == 0 || $("input[name=star]").val() == "" || $("input[name=comment_content]").val() == "") {
	            alert("별점과 내용을 입력해주세요!");
	           return false;
	        } // if end
	           
	      }); // 결제버튼 end

	   });   
	
</script>
<style type="text/css">
	@font-face {
    font-family: 'ONE-Mobile-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	*{
	font-family: 'ONE-Mobile-Regular';
	}

	#movieWrapper {
		height: 400px;
		background-color: #000; 
	}

	.movieWrapper_title{
		color: #fff;
		font-size: 30px;
		display: inline-block;
		margin-left: 20px;
		margin-top: 20px;
	}

	.card-img-top {
		width: 300px;
		height: 350px;
		display: inline-block;
		float: right;
		margin-top: 20px;
		margin-right: 20px;
	}

	.movieWrapper_viewer {
		color: gray;	
		display: block;
		margin-left: 20px;
		margin-top: 50px;
	}

	hr {
	color: gray;
	}
	.movieWrapper_actors {
		color: gray;
		display: block;
		margin-left: 20px;
		margin-top: 20px;
	}
	.movieWrapper_genre, .movieWrapper_open {
		color: gray;
		display: block;
		margin-left: 20px;
		margin-top: 5px;
	}
	.movieWrapper_button {
		margin-left: 20px;
		margin-top: 80px;
		text-align: center; 
		margin-bottom: 10px;
		width: 60px;
		height: 40px;
		
		color: #fff;
		padding: 4px 10px;
		border-radius: 4px;
		border: 2px solid #3B0B5F;
		transition: 0.3s;
		font-size: 15px;
		background-color: #3B0B5F;
	
	}
	
	.movieWrapper_button:hover {
		margin-left: 20px;
		margin-top: 80px;
		text-align: center; 
		margin-bottom: 10px;
		width: 60px;
		height: 40px;
		color: #fff;
		padding: 4px 10px;
		border-radius: 4px;
		border: 2px solid #fff;
		transition: 0.3s;
		font-size: 15px;
		background-color: #000;
	
	}
	/* 0110 commit 후 새로 작업한 부분 */
	#moveTab {
		margin-top: 30px;
		margin-left: 20px;
		
		
	}
	#moveTab1 {
		padding: 10px;
		border: 1px solid #e6e6e6;
		text-decoration: none;
		color: #000;
		
	}
	#moveTab2 {
		padding: 10px;
		border: 1px solid #e6e6e6;
		margin: -5px;
		text-decoration: none;
		color: #000;
	}
	#moveTab3 {
		padding: 10px;
		border: 1px solid #e6e6e6;
		margin: 1px;
		text-decoration: none;
		color: #000;
	}

	#moveTab1:hover {
		border: 1px solid #3B0B5F;
	}
	#moveTab2:hover {
		border: 1px solid #3B0B5F;
	}
	#moveTab3:hover {
		border: 1px solid #3B0B5F;
	}
	
	#content {
		margin-top: 30px;
		margin-left: 20px;
	
	}
	
		#content_top, #reviewWrite, #teaser_top, #avg{
			font-size: 20px;
			margin-bottom: 10px;
		}
		
		#content_intro, #teaser_teaser {
			margin-top: 20px;
			display: block;
			
		}
	
		#content, #review {
		margin-top: 30px;
		margin-left: 20px;
	
	}
	
	#rating > img {
		width: 20px;
		height: 20px;
		
	}
	
	#avgStar {
		margin-top: 30px;
		margin-left: 20px;
	}
	
	#commentList {
		border-spacing: 0 10px;
		border-collapse: separate;
	}
	.writeAndDelBTN {
		text-align: center; 
		color: #3B0B5F;
		border: 2px solid #3B0B5F;
		transition: 0.3s;
		background-color: white;
	}
	.writeAndDelBTN:hover {
		text-align: center; 
		color: #fff;
		border: 2px solid #3B0B5F;
		transition: 0.3s;
		background-color: #3B0B5F;
	}
	
	#teaser {
		margin-top: 30px;
		margin-left: 20px;
	
	}
	
	footer {
	margin-top: 100px;
	}
	/* 0110 commit 후 새로 작업한 부분 끝 */
</style>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
<!-- --------------------- 들고다니세요 ------------------------------------ -->
<!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>영화 상세 정보</h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li><a href="MovieList.mv">전체 영화</a></li>
            <li>영화 상세 정보</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
<!-- --------------------- 들고다니세요 ------------------------------------ -->	
	<div id="movieWrapper"> <!-- 영화 정보 영역 까만부분 -->
		<span class="movieWrapper_title"> <!-- 영화 제목 영역 -->
			${movie.movie_title }
		</span> 
<%-- 		<img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}" class="card-img-top" alt="..." > --%>
		<img src="${pageContext.request.contextPath }/resources/upload/${movie.movie_picture}" class="card-img-top" alt="...">
	
		<span class="movieWrapper_viewer">누적 관객 수 | ${movie.movie_viewer }</span>
		<hr>
		<span class="movieWrapper_actors">${movie.movie_actors }</span>
		<span class="movieWrapper_genre">장르 | ${movie.movie_genre } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 등급 | ${movie.movie_grade } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 상영시간 | ${movie.movie_runtime } 분</span>
		<span class="movieWrapper_open">개봉 | ${movie.movie_open_date }</span>
		
		<button type="button" class="movieWrapper_button" onclick="location.href='Reserve.mv';">예매</button>
	</div> <!-- 영화 정보 영역 까만부분 끝-->
	
	<div id="moveTab"><!-- 줄거리와 관람평 이동 탭 -->
		<a id="moveTab1" href="#content">줄거리</a>
		<a id="moveTab2" href="#teaser">예고편</a>
		<a id="moveTab3" href="#review">관람평</a>
	</div>
	<hr>
	<div id="content"> <!-- 줄거리 -->
		<span id="content_top">줄거리</span><br>
		<span id="content_intro">${movie.movie_intro }</span>
	</div> <!-- 줄거리 끝 -->
		
	<hr>
	<!-- 0111추가 부분 -->
	<div id="teaser"> <!-- 예고편 -->
		<span id="teaser_top">예고편</span><br>
		<span id="teaser_teaser">
<%-- 			<iframe width="800" height="400" src="${movie.movie_teaser }?autoplay=1&mute=1"></iframe>	 --%>
			<iframe width="800" height="400" src="https://www.youtube.com/embed/${movie.movie_teaser }?autoplay=1&mute=1"></iframe>
		</span>
	</div>	<!-- 예고편 끝 -->
	<hr>
	<!-- 0111추가 부분 -->
		
	<div id="review"> <!-- 리뷰 영역 -->
		<span id="reviewWrite">영화 리뷰 쓰기</span><br>
		<span id="content_intro"></span>
	
	<!-- commit 후 새로 작업한 부분 끝-->
		<c:set var="sId" value="${sessionScope.sId }" />

<%-- 		session아이디에 저장한 session id : <c:out value="${sId}" /> --%>
		<!-- 댓글 영역 session Id 가 있을 경우 표시됨 -->
		<c:if test="${not empty sId}">
		
		<form action="CommentWritePro.mv" method="post" name ="commentForm">
		<table border="1">
			<tr>
				<td width="150" height="30">
					<div id="rating" align="center">
							<img id="image1" onmouseover=mouseover(1) onclick=onClk(1) onmouseout=mouseout(1) src="image/star0.png" width="20" height="20">
							<img id="image2" onmouseover=mouseover(2) onclick=onClk(2) onmouseout=mouseout(2) src="image/star0.png" width="20" height="20">
							<img id="image3" onmouseover=mouseover(3) onclick=onClk(3) onmouseout=mouseout(3) src="image/star0.png" width="20" height="20">
							<img id="image4" onmouseover=mouseover(4) onclick=onClk(4) onmouseout=mouseout(4) src="image/star0.png" width="20" height="20">
							<img id="image5" onmouseover=mouseover(5) onclick=onClk(5) onmouseout=mouseout(5) src="image/star0.png" width="20" height="20">
						<!-- 	함수명 onclick 으로 하니까 인식을 못하네요; -->
					</div>
					<input type="hidden" name="star" >
				</td>
				<td width="700">댓글 : <input type="text" name="comment_content" style="width:600px;"></td>
				
				<td width="40">
					<input type="hidden" name="movie_title" value="${movie.movie_title }">	
					<input type="hidden" name="movie_idx" value="${movie.movie_idx }">	
					<input type="hidden" name="member_id" value="${sId }">	
					<input type="submit" name="submit" class="writeAndDelBTN" value="등록" style="border-radius: 4px;">
				</td>			
			</tr>
		</c:if>
		<!-- 댓글 영역 session Id 가 있을 경우 표시됨 -->
		</table>
	
	</form>
	</div> <!-- 리뷰영역 끝 -->
	<hr>
	
	<!--평균평점과 영화 제목 표시 영역 -->
	<div id="avgStar">
	<span id="avg">
		평균 평점 : ${staravg }
	</span>
	
	<hr>
	
	<!-- replyViewArea 영역(댓글 표시 영역) -->
	<div id="reviewArea">
		<table id="commentList">
			<tr style="text-align: center; border-bottom: 1px solid gray;">
				<td width="50">별점</td>
				<td width="150">작성자</td>			
				<td width="500">내용</td>			
				<td width="150">작성일</td>			
<!-- 				<td>수정</td>			 -->
				<td></td>			
			</tr>
		
		<c:forEach var="review" items="${reviewList }">
			<tr>
			<c:set var="member_id" value="${review.member_id }" />
			<c:set var="sId" value="${sessionScope.sId }" />
				<td align="center">${review.comment_star }</td>
				<td align="center">${member_id }</td>
				<td>${review.comment_content }</td>
				<td align="center">${review.comment_date }</td>
<!-- 				session id 와 리뷰 쓴 아이디가 같을 때 삭제 버튼 표시 -->
				<c:if test="${sId eq member_id }">	
<!-- 				<td> -->
<!-- 				</td> -->
				<td>
					<input type="button" class="writeAndDelBTN" value="삭제" onclick="confirmDelete('${review.comment_idx }', '${review.movie_idx }')" style="border-radius: 4px;">
				</td>
				</c:if>
			</tr>
		</c:forEach>
		</table>
		</div> <!-- 평균 평점 끝 -->
</div>


<jsp:include page="../inc/bottom.jsp" />
</body>
</html>