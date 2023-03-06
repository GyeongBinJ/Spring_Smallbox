<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/css/style_admin.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->  
<title>관리자 - 상영 영화관 상세정보</title>
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
    		
<script type="text/javascript">
	function confirmDelete(theater_idx) {
		var result = confirm("상영일정을 삭제하시겠습니까?");
		
		if(result) {
			location.href = "AdminTheaterDeletePro.ad?theater_idx=" + theater_idx;
		}
	}
</script>
<!-- ----------------------------------------<관리자 페이지>에 들고다니세요--------------------------------------------------------- -->    
    <section class="breadcrumbs_admin">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li>관리자 페이지</li>
            <li><a href="AdminTheaterList.ad">상영일정</a></li>
            <!-- 페이지 주소, 이름 넣는곳 -->
            <li><a href="AdminTheaterDetail.ad"></a>상영일정 상세</li>
          </ol>
        </div>
      </div>
    </section>
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- --> 
            
<div id="layoutSidenav_content">
	    <main>
	         <div class="container-fluid px-4">
	             <h1 class="mt-4">상영일정 목록</h1>
		            <div class="card mb-4">
		                 <div class="card-body">
		                     - 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.
		                 </div>
		           	</div>
	           <table>
				  <thead>
				    <tr>
				       <th>상영 영화명</th>
				       <th>상영 날짜</th>
				       <th>영화 상영시각</th>
				       <th>잔여 좌석</th>
				    </tr>
				  </thead>
				  <tbody>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${theater.theater_title }</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${theater.theater_date }</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${theater.theater_time }</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${theater.theater_seat_cnt }</td>
						</tr>
						<tr>
							<td colspan="5">
								<i class="fas fa-table me-1"></i>
								<input type="button" class="pagebtn" value="상영일정 수정" onclick="location.href='AdminTheaterModifyForm.ad?theater_idx=${theater.theater_idx}'">&nbsp;
								<input type="button" class="pagebtn" value="상영일정 삭제" 
										onclick="confirmDelete('${theater.theater_idx}')">&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="5" id="td_center">
							<input type="button" class="pagebtn" value="목록" onclick="location.href='AdminTheaterList.ad'">
							</td>
						<tr>
		 			</tbody>
				</table>
				</div>
	        </main>
       </div>            
            
            

                
		
 			<!-- footer 영역 -->
                <footer id="footer">
      		<jsp:include page="../inc/bottom.jsp"></jsp:include>
      </footer>
    </body>
</html>

