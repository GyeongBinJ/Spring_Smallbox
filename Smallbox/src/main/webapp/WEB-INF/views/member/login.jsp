<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->  
<style type="text/css">
.btn_area {
   margin-top: 30px;
}
.table {
   width: 350px;
   height: 100px;
}
body table tr td {
   font-size: 20px;
   text-align: center;
}
th td {
   margin-top: 20px;
}

th {
   font-size: 20px;
   text-align: center;
   padding-left: 20px;
}

.welcome {
   width: 300px;
   height: 80px;
}
.btn-log{
   width: 350px;
   height: 50px;
   background: #3B0B5F;
   color: #fff;
}
input {
   width: 200px;
   height: 30px;
}
</style>  

</style>  
<title>스몰박스 - 로그인</title>
</head>
<body>
<!-- TOP -->
<header>
	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>
<!-- TOP -->
<!-- ======= Breadcrumbs ======= -->
	<section class="breadcrumbs">
	  <div class="container">
	
	    <div class="d-flex justify-content-between align-items-center">
	      <h2>로그인</h2>
	      <ol>
	        <li><a href="./">Home</a></li>
	        <li>Login</li> 
	      </ol>
	    </div>
	
	  </div>
	</section>
<!-- ======= Breadcrumbs ======= -->

<!--=========== Login 본문 =================-->

<form action="MemberLoginPro.sm" method="post" style="margin-top: 100px;">   
   <div align="center">
      <div class="welcome">
         <img src="${pageContext.request.contextPath }/resources/assets/img/welcome.png">
      </div>
      <table border="2"  class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id" required="required" value="${sessionScope.sId }"></td>
			</tr>	
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="member_passwd" required="required"></td>
			</tr>	
		</table>
			<tr class="submit"	style="text-align: center">
				<td class="btn_login">
					<input type="submit" value="로그인"  class="btn-log" style="border-radius: 10px;">
				</td>
			</tr>
		<div class="btn_area">
       		<a href="FindIdForm.sm">아이디 찾기</a> | 
       		<a href="FindPasswdForm.sm">비밀번호 찾기</a> | 
       		<a href="MemberTermsForm.sm">회원가입</a>
       	</div>
	</div>
</form>
<!--=========== Login 본문 끝=================-->

<!-- ---------------footer------------- -->
<footer id="footer" style="margin-top: 120px;">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>