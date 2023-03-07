<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/swiper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->    
<title>스몰박스 - 로그인</title>
</head>
<body>
<!-- TOP -->
<header>
	<jsp:include page="${pageContext.request.contextPath }/inc/top.jsp"></jsp:include>
</header>
<!-- TOP -->
	<hr>
    <!-- //header -->
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">ID</label>
					<input id="user" type="text" class="input" value="${sessionScope.sId }">
				</div>
				<div class="group">
					<label for="member_passwd" class="label">password</label>
					<input id="member_passwd" name="member_passwd" type="password" class="input" value="member_passwd">
				</div>
				<div class="group">
					<input type="submit" class="button" value="로그인">
				</div>
				<div class="hr"></div>
				<div class="foot-lnk">
					<div align="center">
		           		<a href="FindIdForm.sm">아이디 찾기</a>|<a href="FindPasswdForm.sm">비밀번호 찾기</a>|<a href="MemberTermsForm.sm">회원가입</a>
		        	</div>
				</div>
			</div>
		</div>
	</div>
</div>

		
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="${pageContext.request.contextPath }/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</div>
</body>
</html>