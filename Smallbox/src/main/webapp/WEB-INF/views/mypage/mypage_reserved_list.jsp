<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- EL 에서 표기 방식(날짜 등)을 변경하려면 fmt(format) 라이브러리 필요  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>SMALLBOX</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/css/couponlist.css" rel="stylesheet">
  <!--   아이콘 -->
  <script src="https://code.iconify.design/iconify-icon/1.0.2/iconify-icon.min.js"></script>
<!-- 	예매취소 전 확인confirm하는 Javascript -->
  <script type="text/javascript">
   function cancelReserve(idx,title) {
	   if(confirm(title+"의 예매취소를 진행하시겠습니까? \n예약번호 : "+idx)) {
		   alert("예매취소를 진행합니다.");
		   location.href="ReserveCancel.my?res_idx="+idx;
	   } else {
	   }
   }
   function whereIsMySeat(res_seat) {
	   let row = res_seat.charAt(0);
	   let column = res_seat.substring(1);

	   if (column === "10") {
	   // Do nothing
	   } else {
	   if (column.startsWith("0")) {
	   column = column.substring(1);
	   }
	   }

	   console.log("row: " + row);
	   console.log("column: " + column);

	   switch (row) {
	   case "1":
	   row = "A";
	   break;
	   case "2":
	   row = "B";
	   break;
	   case "3":
	   row = "B";
	   break;
	   case "4":
	   row = "C";
	   break;
	   case "5":
	   row = "E";
	   break;
	   case "6":
	   row = "F";
	   break;
	   default:
	   row = "G";
	   }

	   res_seat = row + "행 " + column + "열";
	   return res_seat;
	   }
  </script>
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
          <h2>예매내역</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>예매내역</li>
          </ol>
        </div>
      </div>
	</section><!-- End Breadcrumbs -->
	
	<!-- 본문 -->
	<!-- 사이드바 -->
    <div id="sd-in" style="width:1560px;margin: 0 auto;margin-bottom: 50px;">
   		<dropdown style="display: inline-block;width:200px;vertical-align: top !important; margin-top: 8em;">
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
   
   <section class="inner-page" style="display: inline-block;">
   
	<table style="text-align: center;margin-top: 80px;"><!-- 왼쪽공간이 너무 넓어서 margin-left설정 -->
		<thead>
		<tr>
			<th width="100">예약 번호</th>
			<th width="150">영화 제목</th>
			<th width="100">상영관</th>
			<th width="100">상영일</th>
			<th width="100">상영시간</th>
			<th width="100">좌석</th>
			<th width="100">예매취소</th>
			<th width="100">리뷰작성</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${not empty reserveList}">
				<c:forEach var="reserve" items="${reserveList }">
					<tr>
						<td>${reserve.res_idx }</td>
						<td>${reserve.theater_title }</td>
						<td>${reserve.theater_idx }관</td>
						<td>
		<!-- 					JSTL 의 fmt 라이브러리를 활용하여 날짜 표현 형식 변경 -->
		<!-- 					fmt:formatDate - Date 타입 날짜 형식 변경 -->
		<!-- 					fmt:parseDate - String 타입 날짜 형식 변경 -->
							<fmt:formatDate value="${reserve.res_date }" pattern="yy-MM-dd"/>
						</td>
						<td>${reserve.res_time }</td>
						<td>
							${reserve.res_seat }
						</td>
						<td>
							<button class="pagebtn" onclick="cancelReserve('${reserve.res_idx }','${reserve.theater_title }')"><iconify-icon icon="mdi:movie-off" style="color: #3b0b5f;"></iconify-icon></button>
<%-- 							<button class="pagebtn" onclick="location.href='ReserveCancel.my?res_idx=${reserve.res_idx }&pageNum=${pageNum }'"><iconify-icon icon="mdi:movie-off" style="color: #3b0b5f;"></iconify-icon></button> --%>
						</td>
						<td>
							<button class="pagebtn" onclick="location.href='ReserveToReview.my?res_idx=${reserve.res_idx }'"><iconify-icon icon="jam:write-f" style="color: #3b0b5f;"></iconify-icon></button>
						</td>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<th style="text-align: center;" colspan="8"><h3>예매 내역이 없습니다.</h3></th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<c:choose>
			<c:when test="${not empty reserveList}">
		<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
			<c:choose>
				<c:when test="${empty param.pageNum }">
					<c:set var="pageNum" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="pageNum" value="${param.pageNum }" />
				</c:otherwise>
			</c:choose>
			
			<section id="pageList" style="text-align: center;margin-left: 320px;"> <!-- 페이징 처리 영역 -->
				<!-- 
				현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
				=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
				   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
				-->
				<c:choose>
					<c:when test="${pageNum > 1}">
						<input type="button" class="pagebtn" value="이전" onclick="location.href='Reserved.my?pageNum=${pageNum - 1}'">
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
							<a href="Reserved.my?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		
				<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
				<c:choose>
					<c:when test="${pageNum < pageInfo.maxPage}">
						<input type="button" class="pagebtn" value="다음" onclick="location.href='Reserved.my?pageNum=${pageNum + 1}'">
					</c:when>
					<c:otherwise>
						<input type="button" class="pagebtn" value="다음">
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
			</c:otherwise>
	</c:choose>
	</section>
	</section>
  </main><!-- End #main -->
	<!-- 본문 -->
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>