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
 <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	
	 <!-- 첨부파일 삭제 -->
	 function deleteFile(notice_file) {
		$.ajax({
			type: "POST",
			url: "DeleteFile",
			data: {
				"notice_idx": ${notice.notice_idx},
				"notice_file": notice_file
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
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top_admin.jsp"></jsp:include>
	</header>
	  <!-- ======= header ======= -->
	
	<main id="main">
	
	<!-- ======= Breadcrumbs ======= -->
   <section class="breadcrumbs_admin">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지사항 수정</h2>
          <ol>
            <li><a href="Admin.ad">관리자 페이지</a></li>
            <li><a href="Notice_list.ad">공지사항</a></li>
            <li>공지 수정</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	<form action="Admin_notice_modifyPro.ad" name="fr" method="post" enctype="multipart/form-data" >
	<input type="hidden" value="${notice.notice_idx }" name="notice_idx">
	<input type="hidden" value="${pageNum }" name="pageNum">
		<table border="1">
			<!-- 글쓴이는 관리자로 고정 -->
			<tr><td>제목</td><td><input type="text" name="notice_subject" required="required" value="${notice.notice_subject }"></td></tr>
			<tr>
				<td>내용</td>
				<td><textarea name="notice_content" cols="50" rows="10">${notice.notice_content }</textarea></td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
						<div id="fileArea">
						<c:choose>
							<c:when test="${not empty notice.notice_file }">
								<img src="${pageContext.request.contextPath }/resources/upload/${notice.notice_file }" width="150" height="150">
								<input type="button" value="삭제" onclick="deleteFile('${notice.notice_file }')">
								<input type="hidden" name="notice_file" value="${notice.notice_file }">
							</c:when>
							<c:otherwise>
								<input type="file" name="file" id="file">
							</c:otherwise>									
						</c:choose>
						</div>
					</td>
				
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기">&nbsp;&nbsp;
				<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
	</main>
</body>
</html>