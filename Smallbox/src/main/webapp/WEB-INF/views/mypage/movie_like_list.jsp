<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">

	// 찜해제 버튼 클릭시 찜해제 작업
	function cancleLike(movie_idx) {
		if(confirm("찜해제 하시겠습니까?")) { //확인 누르면 true, 취소 누르면 false
		let member_id = "${sessionScope.sId}";
		
			$.ajax({
			      type: "POST",
			      url: "CancelMovieLikePro.mv", 
			      data: { 
			    	  member_id : member_id,
			    	  movie_idx : movie_idx 
			      }, 
			      success: function(result) {
					  alert("찜해제 되었습니다!");
					  
					  // 찜목록에 영화가 하나도 없을때만 새로고침
					  if (document.querySelectorAll('.col').length == 1) {
			    	  $("#moviecard"+movie_idx).remove();
					  // 반복문으로 생성된 영역이기 때문에 각 movie_idx로 구분을 줘야함
					  // class 태그에 ${movie.movie_idx }를 같이 넘기면 각 movie_idx별 카드 삭제
					  
			    	  $("#sd-in").load(location.href+' #sd-in'); // 특정페이지 새로고침
// 			    	  console.log("새로고침O");
			    	  
			    	 } else { // 찜목록에 영화가 있다면 영화만 삭제
			    	  $("#moviecard"+movie_idx).remove();
// 			    	  console.log("새로고침X");
			    	 }
			      }
		      });
		  } else {
		        return false;
	      }
	}
	
	// 찜목록에 사용될 페이지 번호값 설정
	let pageNum = 1;
	
	$(function() {
		// 찜목록 조회를 처음 수행하기 위해 load_list() 함수 호출
		load_movielist();
		
		// 무한스크롤 기능
		// window 객체에서 scroll 동작 시 기능 수행(이벤트 처리)을 위해 scroll() 함수 호출
		$(window).scroll(function() {
			// 스크롤바 현재 위치, 문서 표시되는 창의 높이, 문서 전체 높이
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
			
			if(scrollTop + windowHeight + 160 >= documentHeight) {
				pageNum++; // 다음 페이지 목록 로딩
				load_movielist();
			}
		});
	});
	
	// 마이페이지 찜목록
    function load_movielist() {
    	
   		// 찜목록 조회해서 가져오기
		$.ajax({
			type: "GET",
			url: "MovieLikeListJson.my?pageNum=" + pageNum,
			dataType: "json"
		})
		.done(function(likemovieList) { // 요청 성공 시
	      var html = "";
	    	  
	      $.each(likemovieList, function(i, movie) { // starmovieList에서 하나씩 꺼내 movie에 저장
	        html += '<div class="col" id="moviecard' + movie.movie_idx + '">';
	        html += '  <div class="card">';
	        html += '    <img src="${pageContext.request.contextPath }/resources/upload/' + movie.movie_picture + '" width="300" height="350" class="card-img-top" alt="..." >';
	        html += '    <div class="card-body">';
	        html += '      <h5 class="card-title" style="text-align: center;">' + movie.movie_title + '</h5>';
	        html += '      <div class="text-center">';
	        html += '      	<button class="btn btn-outline-dark mt-auto" id="btn_like" onclick="cancleLike(\'' + movie.movie_idx + '\')">찜해제</button>';
	        html += '      </div>';
	        html += '    </div>';
	        html += '  </div>';
	        html += '</div>';
	      });
	      $("#movieCard").append(html);
	    }) // 영화리스트 조회
		.fail(function() { // likemovieList 조회 실패 시
    	    console.log("likemovieList 조회 실패");
	    });
	  }
</script>
<!-- jquery -->
</head>
<body>
	<!-- 비회원 접근 불가 -->
	<c:if test="${empty sessionScope.sId }">
		<script type="text/javascript">
		 	alert("접근 불가합니다.");
		 	history.back();
		</script>
	</c:if>
	<!-- 비회원 접근 불가 -->

	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>Collection</h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>Collection</li> 
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
	
	<!-- 본문 -->
	<!-- 사이드바 -->
    <div id="sd-in">
  		<dropdown>
  		<input id="toggle1" type="checkbox" checked>
  		<label class="animate">MENU<i class="fa fa-bars float-right"></i></label>
	  		<ul class="animate">
			    <li class="animate"><a href="MyPageMain.my">마이페이지</a></li>
			    <li class="animate"><a href="MemberModifyForm.sm">회원정보수정</a></li>
			    <li class="animate"><a href="Reserved.my">예매내역</a></li>
			    <li class="animate"><a href="CouponList.my">쿠폰함</a></li>
			    <li class="animate"><a href="MovieLikeList.my">찜목록</a></li>
			    <li class="animate"><a href="ReviewList.my">리뷰내역</a></li>
			    <li class="animate"><a href="QnaList.my">문의내역</a></li>
			    <li class="animate"><a href="MemberDeleteForm.sm">회원탈퇴</a></li>
	  		</ul>
  		</dropdown>
  	<!-- 사이드바 -->
   
    <div class="inner-page2">
		<c:choose>
			<c:when test="${empty likeMovieList }">
				<div class="emptyLike">
				<span><img src="${pageContext.request.contextPath }/resources/assets/img/icon/movie-ticket-icon.png" width="160" height="160" ></span>
				<span>&nbsp;&nbsp;&nbsp; 관심있는 영화를 추가해주세요!</span>
				</div>
			</c:when>
			<c:otherwise>
      			<div class="container" style="margin-left: 35px;margin-top: 7px;">
        			<section class="py-5">
        				<div class="wrap">
       						 <div class="row row-cols-1 row-cols-md-4 g-4" id="movieCard">
       						 	<!-- ajax로 조회한 데이터가 추가될 영역 -->
   	 						 </div>
    					</div>
    				</section>
    			</div>
			</c:otherwise>
        </c:choose>
    </div>
  <!-- 본문 -->
  </main><!-- End #main -->
  
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>