<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- EL 에서 표기 방식(날짜 등)을 변경하려면 fmt(format) 라이브러리 필요  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
  <!--   답글아이콘 -->
  <script src="https://kit.fontawesome.com/5a85844b1b.js" crossorigin="anonymous"></script>
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
          <h2>1:1 문의내역</h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>1:1 문의내역</li>
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
			    <li class="animate"><a href="MemberModifyForm.sm?member_id=${sessionScope.sId }">회원정보수정</a></li>
			    <li class="animate"><a href="Reserved.my">예매내역</a></li>
			    <li class="animate"><a href="CouponList.my">쿠폰함</a></li>
			    <li class="animate"><a href="MovieLikeList.my">찜목록</a></li>
			    <li class="animate"><a href="ReviewList.my">리뷰내역</a></li>
			    <li class="animate"><a href="QnaList.my">문의내역</a></li>
			    <li class="animate"><a href="MemberDelete.sm?member_id=${sessionScope.sId }">회원탈퇴</a></li>
	  		</ul>
  		</dropdown>
  	<!-- 사이드바 -->
   <section class="inner-page" style="display: inline-block;">
   <div>
	<table style="text-align: center; margin-top: 80px; margin-left: 220px;" >
	<thead>
	<tr>
		<th width="100px">문의 번호</th>
		<th width="400px">제목</th>
		<th width="150px">날짜</th>
	</tr>
	</thead>
	<tbody>
	<!-- JSTL 과 EL 활용하여 글목록 표시 작업 반복 -->
	<%-- for(QnaBean qna : qnaList) {} --%>
	<c:forEach var="qna" items="${qnaList }">
		<tr>
			<td>${qna.qna_idx }</td>
			<!-- 제목 하이퍼링크(QnaDetail.me) 연결 -> 파라미터 : 글번호, 페이지번호 -->
			<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
			<c:choose>
				<c:when test="${empty param.pageNum }">
					<c:set var="pageNum" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="pageNum" value="${param.pageNum }" />
				</c:otherwise>
			</c:choose>
			<td id="subject">
				<%-- ======================== 답글 관련 처리 ======================= --%>
				<%-- qna_re_lev 값이 0보다 크면 답글이므로 들여쓰기 후 이미지 추가 --%>
				<c:if test="${qna.qna_re_lev > 0 }">
					<%-- 반복문을 통해 qna_re_lev 값 만큼 공백 추가 --%>
					<c:forEach var="i" begin="1" end="${qna.qna_re_lev }">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<%-- 답글 제목 앞에 아이콘 추가 --%>
					<i class="fa-brands fa-replyd"></i> [상담완료]
				</c:if>
				<%-- =============================================================== --%>
				<a href="QnaDetail.my?qna_idx=${qna.qna_idx }&pageNum=${pageNum }">
					${qna.qna_subject }
				</a>
			</td>
			<td>
				<%-- JSTL 의 fmt 라이브러리를 활용하여 날짜 표현 형식 변경 --%>
				<%-- fmt:formatDate - Date 타입 날짜 형식 변경 --%>
				<%-- fmt:parseDate - String 타입 날짜 형식 변경 --%>
				<fmt:formatDate value="${qna.qna_date }" pattern="yy-MM-dd HH:mm"/>
			</td>
		</tr>
	</c:forEach>
	</table>
	<section id="pageList" style="text-align: center; margin-right:-450px; margin-top: -50px;"> <!-- 페이징 처리 영역 -->
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 QnaList.me 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" class="pagebtn" value="이전" onclick="location.href='QnaList.my?&pageNum=${pageNum - 1}'">
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
					<a href="QnaList.my?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="pagebtn" value="다음" onclick="location.href='QnaList.my?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="pagebtn" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
	</div>
	<section style="margin-left: 220px; margin-top: -190px;">
		<input type="button" class="pagebtn" value="문의 작성하기" onclick="location.href='QnaWriteForm.my'">
	</section>
	<br>
	</section>
</div>
</main>
  
	<!-- 본문 -->
	
	 <footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>













