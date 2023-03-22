<%@page import="java.util.List"%>
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
<!-- Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
 
<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	var member_id = "${sessionScope.sId}"; // 회원아이디 전역변수에 저장
	
	// 비회원이 찜버튼 누르면 작동
	function login_need() {
		alert("로그인 후 이용 가능 합니다.");
	}
	
	// 회원이 찜 버튼 또는 찜 해제 버튼 클릭시 이벤트
	function changeLike(movie_idx) {
			$.ajax({
			   type: "POST",
			   url: "MovieLikePro.mv", 
			   data: { member_id : member_id, movie_idx : movie_idx }, 
			   success: function(result) {
		    	  if(result === "찜") { // 찜해제 버튼을 누르면 삭제 쿼리 실행 -> 찜해제되었으므로 찜버튼 반환
		    		   alert("찜목록에서 삭제되었습니다.");
		    	  } else if(result === "찜해제") { // 찜 버튼을 누르면 삽입 쿼리 실행 -> 찜되었으므로 찜해제 버튼 반환
		    		   alert("찜목록에 추가되었습니다.");
		    	  }
		    	  
		    	  $("#btn_like"+movie_idx).html(result);
// 			    	  console.log(movie_idx);
			      }
	       });
	}
	
	// 박스오피스 목록에 사용될 페이지 번호값 설정
	let pageNum = 1;
	
	$(function() {
		// 검색어(keyword) 값 가져와서 변수에 저장
		let keyword = $("#keyword").val();
		
		// 영화 목록 조회를 처음 수행하기 위해 load_list() 함수 호출
		load_movielist(keyword);
		
		// 무한스크롤 기능
		// window 객체에서 scroll 동작 시 기능 수행(이벤트 처리)을 위해 scroll() 함수 호출
		$(window).scroll(function() {
			// 스크롤바 현재 위치, 문서 표시되는 창의 높이, 문서 전체 높이
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
			
			if(scrollTop + windowHeight + 150 >= documentHeight) {
				pageNum++; // 다음 페이지 목록 로딩
				load_movielist(keyword);
			}
		});
	});
	
	// 박스오피스(누적관람객순) 목록
    function load_movielist(keyword) {
    	
   		// 박스오피스 목록 조회해서 가져오기
		$.ajax({
			type: "GET",
			url: "MovieListJson.mv?pageNum=" + pageNum + "&keyword=" + keyword,
			dataType: "json"
		})
		.done(function(starmovieList) { // 요청 성공 시
	      var html = "";
		
	      // 찜여부를 판단하기 위해서 likeList 조회해서 가져오기
	      $.ajax({
	        type: "GET",
	        url: "LikeListJson.mv",
	        data: { "member_id" : member_id },
	        dataType: "json"
	      })
	      .done(function(likeListArray) { // likeList 조회 성공 시
	    	  
	    	  // 분명 잘 넘어왔는데.. 왜 안될까..
	      	  console.log(likeListArray) // JSON 배열로 잘 넘어왔음
	    	  // likeList 배열 맞지?
	      	  console.log(Array.isArray(likeListArray)) // true 
//       		console.log(Object.values(likeList)) // 값에 접근해봤자 JSON 배열이라서 쌍으로 뱉어냄

			  // *** map()을 이용해서 값 추출해서 배열 생성 ***
	          var likeList = likeListArray.map(function(likeobj) { return likeobj.like; });
	    	  
		      $.each(starmovieList, function(i, movie) { // starmovieList에서 하나씩 꺼내 movie에 저장
		        html += '<div class="col">';
		        html += '  <div class="card" style="object-fit:cover">';
		        html += '    <a href="MovieDetail.mv?movie_idx=' + movie.movie_idx + '&pageNum=${pageNum }"><img src="${pageContext.request.contextPath }/resources/upload/' + movie.movie_picture + '" width="300" height="350" class="card-img-top" alt="..."></a>';
		        html += '    <div class="card-body">';
		        html += '      <h5 class="card-title" style="text-align: center;">' + movie.movie_title + '</h5>';
		        html += '      <h5 class="card-date" style="text-align: center;font-size: 16px">개봉일 ' + movie.movie_open_date + '</h5>';
		        html += '      <p class="card-star" style="text-align: center;">평점 ' + movie.comment_star + '</p>';
		        html += '      <div class="text-center">';
    	     	// 영화목록 페이지 로딩시 찜 여부 판별
		        if(member_id != null && member_id != "") { // 로그인이 되어있을 경우
			          // likeList가 movie.movie_idx를 포함하면 찜해제 출력
		        		console.log(likeList.includes(movie.movie_idx)) // 여전히 false임.. --> * includes()는 ===로 비교하기때문 *
		        	  if(likeList.includes(movie.movie_idx.toString())) { // contains() 사용할 수 없으므로 includes() 사용
		        	    html += '      <button class="btn btn-outline-dark mt-auto" id="btn_like' + movie.movie_idx + '" onclick="changeLike(\'' + movie.movie_idx + '\')">찜해제</button>';
		        	  } else { // likeList가 movie.movie_idx를 포함하지않으면 찜 출력
		        	    html += '      <button class="btn btn-outline-dark mt-auto" id="btn_like' + movie.movie_idx + '" onclick="changeLike(\'' + movie.movie_idx + '\')">찜</button>';
		        	  }
		       	} else { // 로그인이 안되어있을 경우 찜버튼 클릭시 알림창
		        	  html += '      <button class="btn btn-outline-dark mt-auto" id="btn_like" onclick="login_need()">찜</button>';
		       	}
		        html += '        <a class="btn btn-outline-dark mt-auto" href="Reserve.mv?movie_title=' + movie.movie_title + '">예매하기</a>';
		        html += '      </div>';
		        html += '    </div>';
		        html += '  </div>';
		        html += '</div>';
		      });
		      $("#movieCard").append(html);
		    }) // likeList 조회
	        .fail(function() { // likeList 조회 실패 시
	    	    console.log("likeList 조회 실패");
    	    });
	    }) // 영화리스트 조회
		.fail(function() { // likeList 조회 실패 시
    	    console.log("starmovieList 조회 실패");
	    });
	  }
</script>
<!-- jquery -->
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	  <!-- ======= header ======= -->
	
	<main id="main">
	<!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>전체 영화 </h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li>전체 영화</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
	
	 <!-- ======= 찐 본문영역 ======= -->
	<section class="inner-page" style="display: inline;">
	
      <!-- 박스오피스 / 상영예정작 탭 -->
	  <div style="text-align: center;">	
		<button class="Listbtn" onclick="location.href='MovieList.mv'">박스오피스</button>
		<button class="Listbtn" onclick="location.href='ComingMovieList.mv'">상영 예정작</button>
	  </div>	
	  
      <div class="container">
        <p>
       	  <section class="py-5">
       	   <!-- 검색 -->
       	   <form action="MovieList.mv" >
       	  	 <div style="margin-bottom: 10px;">
				<input type="text" class="cssinput" id="keyword" name="keyword" value="${param.keyword }">
				<input type="submit" value="Search" class="btn">
			 </div>
		   </form>
		   
   		  <!-- 영화 카드 -->
           <div class="wrap">
       			<div class="row row-cols-1 row-cols-md-4 g-4" id="movieCard">
       				<!-- ajax로 조회한 데이터가 추가될 영역 -->
   				</div>
    		</div>
    	</section>
       </p>
   	 </div>
   </section>
  </main>
		   
	<footer>
		<jsp:include page="../inc/bottom.jsp" />
	</footer>
</body>
</html>