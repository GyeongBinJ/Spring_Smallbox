<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/swiper.css">

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
<title>스몰박스 - 비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById('submit').onclick = function() {
		if ( document.pfrm.member_id.value.trim() == '' ) {
			alert( 'ID를 입력해주세요' );
			return false;
		} else if (document.pfrm.member_mail.value.trim() == '') {
			
		}
		if ( document.pfrm.member_mail.value.trim() == '' ) {
			alert( '메일을 입력해주세요' );
			return false;
		}
		alert("이메일 전송이 완료되었습니다.")
		
		document.pfrm.submit();
	}
}
</script>
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
         <h2>비밀번호 찾기</h2>
         <ol>
           <li><a href="./">Home</a></li>
           <li>비밀번호 찾기</li> 
         </ol>
       </div>
   
     </div>
   </section>
<!-- ======= Breadcrumbs ======= -->
<form action="FindPasswdPro.sm" method="post" style="margin-top: 100px;" name="pfrm">
	<div align="center">
		<div class="welcome">
			<img src="${pageContext.request.contextPath }/resources/assets/img/welcome.png">
		</div>
		<table border="2" class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" id="member_id" placeholder="아이디를 입력하세요." required="required">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="member_email" id="member_email" placeholder="메일을 입력하세요." required="required">
				</td>
			</tr>
		</table>
		<tr class="submit" style="text-align: center; ">
			<td class="btn_login">
				<button type="submit" id="submit" class="btn-log">비밀번호 찾기</button>
				<br>
			</td>
		</tr>
	</div>
</form>
<!-- BOTTOM -->
<header>
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</header>
<!-- BOTTOM -->
</body>
</html>