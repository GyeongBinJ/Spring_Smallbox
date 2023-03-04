<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  
<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<style type="text/css">
table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
};
</style>
</head>
<body>
	<header>
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>
	  <!-- ======= header ======= -->
	
	<main id="main">
	
	<!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지</h2>
          <ol>
            <li><a href="./">Home</a></li>
            <li><a href="Notice_list.ad">공지</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	
	 <!-- ======= 찐 본문영역 ======= -->
	<section class="inner-page" style="display: inline;">
	
	<section id="articleForm">
		<section id="basicInfoArea">
			<table>
				<tr><th width="500"><h1>${notice.notice_subject }</h1>
				<hr width="800"></th></tr>
				
				<tr>
					<td><fmt:formatDate value="${notice.notice_date }" pattern="yy-MM-dd HH:mm:SS" /></td>
					<td width="50">조회수</td>
					<td>${notice.notice_readCount }</td>
				</tr>
				
				
				<tr>
					<td>
						<img src="${pageContext.request.contextPath }/resources/upload/${notice.notice_file}">
					
					
						${notice.notice_content }
					</td>
				</tr>
				<tr>
				
				</tr>
				<tr>
					<td>
					<c:if test="${not empty sessionScope.sId and sessionScope.sId eq 'admin'}">
					<input type="button" value="수정" onclick="location.href='NoticeModifyForm.ad?notice_idx=${param.notice_idx}&pageNum=${param.pageNum }'">
					<input type="button" value="삭제" onclick="location.href='NoticeDeleteForm.ad?notice_idx=${param.notice_idx}&pageNum=${param.pageNum }'">
					</c:if>
					<input type="button" value="목록" onclick="location.href='Notice_list.ad?pageNum=${param.pageNum}'">
					</td>
				</tr>	
			</table>
		</section>
	</section>
	</section>
	</main>
		  <!-- ======= 본문영역 ======= -->
		
		  <!-- ======= Footer ======= -->
		<jsp:include page="inc/bottom.jsp" />
</body>
</html>