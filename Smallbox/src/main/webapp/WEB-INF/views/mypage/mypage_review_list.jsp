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
<link href="${pageContext.request.contextPath }/resources/assets/css/couponlist.css" rel="stylesheet">

<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// 삭제버튼 클릭시
	function delete_comment(comment_idx) {
   	  if(confirm("리뷰를 삭제 하시겠습니까?")) { //확인 누르면 true, 취소 누르면 false
		$.ajax({
		      type: "POST",
		      url: "ReviewDelete.my", 
		      data: { 
		    	  comment_idx : comment_idx
		      }, 
		      success: function(result) {
		    	  // 리뷰내역에 리뷰가 하나도 없을때만 새로고침
				  if (document.querySelectorAll('#poster').length == 1) {
				   $("#comment_tr"+comment_idx).remove();
				  // 반복문으로 생성된 영역이기 때문에 각 comment_idx로 구분을 줘야함
				  // class 태그에 ${comment.comment_idx }를 같이 넘기면 각 comment_idx별 카드 삭제
				  
		    	  $("#sd-in").load(location.href+' #sd-in'); // 특정페이지 새로고침
// 		    	  console.log("새로고침O");
		    	  
		    	 } else { // 찜목록에 영화가 있다면 영화만 삭제
		    	   $("#comment_tr"+comment_idx).remove();
// 		    	   console.log("새로고침X");
		    	 }
		      }
	      });
   	    } else {
	        return false;
	    }
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
	
	 <!-- 본문 -->
	 <main id="main">
	 
	   <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>리뷰내역</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>리뷰내역</li>
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
	   
   
    <section class="inner-page3" style="display: inline-block;">
		<table style="text-align: center;margin-top: 80px;">
		    <thead>
			    <tr>
			        <th width="150">포스터</th>
			        <th width="200">내용</th>
			        <th width="100">평점</th>
			        <th width="150">작성일</th>
			        <th width="150"></th>
			    </tr>
		    </thead>
	    	<tbody>
				<!-- ReviewListProAction으로 부터 전달받은 request 객체의 reviewList(리뷰 정보)를 꺼내서 출력 -->
				<c:choose>
					<c:when test="${empty reviewList }">
						<tr><td colspan="5">작성한 리뷰 내역이 존재하지 않습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="comment" items="${reviewList }">
							<tr id="comment_tr${comment.comment_idx }">
								<td id="poster"><img src="${pageContext.request.contextPath }/resources/upload/${comment.movie_picture}"  width="150" height="200"></td>
								<td>${comment.comment_content }</td>
								<td>${comment.comment_star }</td>
								<td>${comment.comment_date }</td>
								<td><input type="button" class="pagebtn" value="삭제" onclick="delete_comment('${comment.comment_idx }')"></td>
							</tr>	
					    </c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</section> <!-- inner section 끝 -->
	
	<div id="mypageList"> <!-- 페이징 처리 영역 -->
		<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
		<c:choose>
			<c:when test="${empty param.pageNum }">
				<c:set var="pageNum" value="1" />
			</c:when>
			<c:otherwise>
				<c:set var="pageNum" value="${param.pageNum }" />
			</c:otherwise>
		</c:choose>
	
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" class="pagebtn" value="이전" onclick="location.href='ReviewList.my?pageNum=${pageNum - 1}'">
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
					<a href="ReviewList.my?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="pagebtn" value="다음" onclick="location.href='ReviewList.my?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="pagebtn" value="다음">
			</c:otherwise>
		</c:choose>
	</div> <!-- pageList div 끝 -->
  </main><!-- End #main -->
	  
	<!-- footer  -->
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>