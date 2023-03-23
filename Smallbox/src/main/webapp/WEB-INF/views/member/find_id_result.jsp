<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
         <h2>아이디찾기결과</h2>
         <ol>
           <li><a href="./">Home</a></li>
           <li>아이디찾기결과</li> 
         </ol>
       </div>
   
     </div>
   </section>
<!-- ======= Breadcrumbs ======= -->

<!--=========== Login 본문 =================-->

<form action="" method="post" style="margin-top: 100px;">   
   <div align="center">
      <div class="welcome">
         <img src="${pageContext.request.contextPath }/resources/assets/img/welcome.png">
      </div>
       <div>                                                               
        <c:choose>                                                                          
            <c:when test="${empty member}">  
            	<table border="2">
	                <h2><p class="mb-4">조회결과가 없습니다.</p></h2>                                        
            	</table>
   			        <td class="btn_login">
						<input type="button" value="홈으로" class="btn-log" style="margin-bottom: 10px; border-radius: 10px;" onclick="location.href='./'"> 
						<input type="button" value="아이디 찾기" class="btn-log" style="margin-bottom: 10px; border-radius: 10px;" onclick="location.href='FindIdForm.sm'"> 
					<br>
		         </td>                                               
            </c:when>                                                                         
            <c:otherwise> 
		        <h4>고객님의 아이디는</h4><br><br>                 
        		<table border="2">
                	<h2><p>${member.member_id}</p></h2> 
        		</table>                                                           
                <h2 style="padding-bottom: 50px;">입니다.</h2>                                              
		         <td class="btn_login">
					<input type="button" value="로그인하기" class="btn-log" style="margin-bottom: 10px; border-radius: 10px;" onclick="location.href='MemberLoginForm.sm'"> 
					<input type="button" value="비밀번호 찾기" class="btn-log" style="margin-bottom: 10px; border-radius: 10px;" onclick="location.href='FindPasswdForm.sm'"> 
					<br>
		         </td>
            </c:otherwise>                                                                    
        </c:choose>                                                                         
    </div>             
</form>
<!--=========== Login 본문 끝=================-->
	<!-- ---------------footer------------- -->
	<footer id="footer" style="margin-top: 250px;">
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</footer>
	<!-- ---------------footer------------- -->
</body>
</html>