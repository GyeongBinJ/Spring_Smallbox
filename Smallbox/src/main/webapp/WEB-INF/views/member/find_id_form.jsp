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
<title>스몰박스 - 아이디 찾기</title>
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
function fnSubmit() {
	 
	var phone_regex = /^01\d\d{3,4}\d{4}$/;
	 
	if ($("#member_name").val() == null || $("#member_name").val() == "") {
	alert("이름을 입력해주세요.");
	$("#member_name").focus();
	return false;
	}
	 
	if ($("#member_phone").val() == null || $("#member_phone").val() == "") {
	alert("전화번호를 입력해주세요.");
	$("#member_phone").focus();
	return false;
	}
	 
	if(!phone_regex.exec($("#member_phone").val())){
	alert("옳바르지 않은 전화번호입니다.");
	return false;
	}
	 
	 
	if(confirm("아이디를 찾으시겠습니까?")) {
	$("#findIdForm").submit();
	return false;
	}
}
</script>
<style type="text/css">
.btnLow {
   text-decoration: none;
}
input[type=text] {
   border-radius: 5px;
   border: solid 1px #dadada;
}
</style>
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
         <h2>아이디찾기</h2>
         <ol>
           <li><a href="./" class="btnLow">Home</a></li>
           <li>아이디찾기</li> 
         </ol>
       </div>
   
     </div>
   </section>
<!-- ======= Breadcrumbs ======= -->

<!--=========== Login 본문 =================-->
<form commandName="member" id="findIdForm" action="findIdPro.sm" method="post" style="margin-top: 100px;">
   <div align="center">
      <div class="welcome">
         <img src="${pageContext.request.contextPath }/resources/assets/img/welcomeLogo.png">
      </div>
      <table border="2"  class="table">
         <tr>
            <th>이름</th>
            <td><input type="text" name="member_name" id="member_name" required="required"></td>
         </tr>   
         <tr>
            <th>전화번호</th>
            <td><input type="text" name="member_phone" id="member_phone" required="required"></td>
         </tr>   
      </table>
         <tr class="submit" style="text-align: center">
            <td class="btn_login">
				<input type="button" value="아이디 찾기" class="btn-log" style="margin-bottom: 10px; border-radius: 10px;" onclick="fnSubmit(); return false;"> 
				<br>
            </td>
         </tr>
</form>
<!--=========== Login 본문 끝=================-->
	<!-- ---------------footer------------- -->
	<footer id="footer" style="margin-top: 170px;">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	<!-- ---------------footer------------- -->
</body>
</html>