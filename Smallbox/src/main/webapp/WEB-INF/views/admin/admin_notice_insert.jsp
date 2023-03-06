<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

  <!-- Template Main CSS File -->
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
          <h2>공지사항 등록</h2>
          <ol>
            <li><a href="Admin.ad">관리자 페이지</a></li>
            <li><a href="Notice_list.ad">공지사항</a></li>
            <li>공지 등록</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
      <main>
         <div class="container-fluid px-4">
             <h1 class="mt-4">공지 등록</h1>
	            <div class="card mb-4" style="margin-bottom: 30px;">
	                 <div class="card-body">
	                     - 관리자로 등록된 회원만 조회할 수 있는 페이지입니다.
	                 </div>
	           	</div>  
	           	
			<form action="Admin_notice_writePro.ad" name="fr" method="post" enctype="multipart/form-data" >
				<table style="border: 1;border-radius: 4px;">
					<!-- 글쓴이는 관리자로 고정 -->
					<th style="text-align: center;height: 40">공지 정보</th>
					<tr><td>제목</td><td><input type="text" name="notice_subject" required="required"></td></tr>
					<tr>
						<td>내용</td>
						<td><textarea name="notice_content" cols="50" rows="10"></textarea></td>
					</tr>
					<tr>
						<td>파일</td>
						<td><input type="file" name="file" id="file"></td>
					</tr>
					<tr>
						<td colspan="2">
						<div style="text-align: center;">
							<input class="pagebtn2" type="submit" value="등록">
						</div>
						</td>
					</tr>
				</table>
			</form>
	</main>
</body>
</html>