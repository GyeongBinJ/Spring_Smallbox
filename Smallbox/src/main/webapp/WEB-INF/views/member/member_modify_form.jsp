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
  <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
<style type="text/css">
input[type=password] {
   font-family: "굴림";
}
 *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
*{
	font-family: 'ONE-Mobile-Regular';
}
.formDiv {
	padding-left: 250px;	
	font-family: 'ONE-Mobile-Regular';
}

body {
  font-family: 'ONE-Mobile-Regular';
  color: #384047;
  
}

.joinForm {
	padding-top: 20px;	
	padding-left: 30px;	
	font-family: 'ONE-Mobile-Regular';

}

form {
  max-width: 1000px;
  width: 1000px; 
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
  margin-top: 10px;
  font-family: 'ONE-Mobile-Regular';
}

h1 {
  margin: 0 0 10px 0;
  font-family: 'ONE-Mobile-Regular';
}

.inputBox,
select {
  background: #000000;
  font-size: 12px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 5px;
  width: 30%;
  background-color: #ffffff;
  color: #000000;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
  font-family: 'ONE-Mobile-Regular';
}

input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;
}

select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
  font-family: 'ONE-Mobile-Regular';
}

button {
  background-color: #3B0B5F;
  border: none;
  color: white;
  padding: 0px 80px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  margin-left: 100px;
  font-family: 'ONE-Mobile-Regular';
  border-radius: 5px;
}

legend {
  font-size: 0.5em;
  margin-bottom: 100px;
  font-family: 'ONE-Mobile-Regular';
}


label.light {
  font-weight: 100;
  display: inline;
  font-family: 'ONE-Mobile-Regular';
}
.joinBtn{
	background-color: #3B0B5F;
	border-radius: 5px;
	color: white;
	font-family: 'ONE-Mobile-Regular';
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
  font-family: 'ONE-Mobile-Regular';
}

@media screen and (min-width: 480px) {

  form {
    max-width: 1000px;
    font-family: 'ONE-Mobile-Regular';
  }

}
#sub-btn {
	margin-right: 100px;
	height: 40px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	
	 <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원정보수정</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="MyPageMain.my">MyPage</a></li>
            <li>회원정보수정</li>
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
  	
  	<section class="inner-page" style="display: inline-block; margin-left: 200px; padding-top: 150px;">
  <!-- 로그인 화면 폼 -->
    <div id ="sform" align="center">
		<form action="MemberModifyPro.sm" method="post" onsubmit="return submitCheck();" >
	    	<h4 align="center"><b>회원 정보</b></h4>
			         <table style="text-align: center;">
				         <tr>
				        	 <td align="right">이름</td>
				        	 <td style="padding-left: 20px;">
				        	 	<input type="text" name="member_name" value="${member.member_name }" readonly="readonly">
				        	 </td>
				         </tr>
				         <tr>
				       		 <td align="right">아이디</td>
				       		 <td style="padding-left: 20px;">
				       			 <input type="text" name="member_id" value="${member.member_id }" readonly="readonly">
				       		 </td>
				         </tr>
				         <tr>
				         	 <td align="right">이메일</td>
				         	 <td style="padding-left: 20px;">
				         	 	<input type="text" name="member_email" value="${member.member_email }" readonly="readonly" >
				         	 </td>
				         </tr>
				         <tr>
				             <td align="right">전화번호</td>
				             <td style="padding-left: 20px;">
				             	<input type="text" name="member_phone" value="${member.member_phone }" readonly="readonly">
				             </td>
				         </tr>
				         <tr> <!-- 기존 패스워드 -->
				        	 <td align="right">비밀번호</td>
				        	 <td style="padding-left: 20px;">
				        		 <input type="password" placeholder="기존 비밀번호" name="oldPasswd" >
				        	 </td>
				         </tr>
				         <tr> <!-- 새 패스워드 -->
				         	<td align="right">새 비밀번호</td>
				         	<td style="padding-left: 20px;">
				         		<input type="password" name="newPasswd" id="newPasswd"placeholder="새 비밀번호" ><br>
				        	    <span id="checkPasswdResult"></span>
				         	</td>
				         </tr>
				         <tr> 
			         	<!-- 새 패스워드 확인 -->
			        	 <td align="right">새 비밀번호 확인</td>
			        	 <td style="padding-left: 20px;">
			        		 <input type="password" name="newPasswdCheck" id="newPasswdCheck" placeholder="새 비밀번호 확인" ><br>
			         		 <span id="checkPasswdConfirmResult"></span>
			        	 </td>
			     </table>
         		 <button type="submit" id="sub-btn" onclick="confirm('회원정보를 변경하시겠습니까?');">변경하기</button>
        </form>
    </div>
	</section>
  </main><!-- End #main -->
<footer>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>
<!-- ------------------------------------------------------------------------------------------------------------>

<!-- 비밀번호 수정 -->
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
// 비밀번호 정규표현식
$(function() {
	
	// 비밀번호 유효성 검사
	var passResult = false;
	$("#newPasswd").on("change", function() {
		let passwd = $("#newPasswd").val();
		let lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
		
		let engUpperRegex = /[A-Z]/; 
		let engLowerRegex = /[a-z]/; 
		let numRegex = /[0-9]/; 
		let specRegex = /[!@#$%]/; 
		
		if(!lengthRegex.exec(passwd)) {
			$("#checkPasswdResult").html("8~16자 영문 대 소문자, 숫자, 특수문자(!@#$%) 필수").css("color", "red");
		} else {
			let count = 0;
			
			if(engUpperRegex.exec(passwd)) { count++ };
			if(engLowerRegex.exec(passwd)) { count++ };
			if(numRegex.exec(passwd)) { count++ };
			if(specRegex.exec(passwd)) { count++ };
			
			switch(count) {
			case 4 : 
				$("#checkPasswdResult").html("안전").css("color", "purple");
				passResult = true;
				break;
			case 3 : 
				$("#checkPasswdResult").html("보통").css("color", "green");
				passResult = true;
				break;
			case 2 : 
				$("#checkPasswdResult").html("위험").css("color", "orange"); 
				passResult = true;
				break;
			case 1 : 
				$("#checkPasswdResult").html("사용불가").css("color", "red");
				passResult = false;
			}
		}
	});
	$("#sub-btn").click(function submitCheck(){
		if(passResult==false){ //인증이 완료되지 않았다면
			alert("변경된 비밀번호를 다시 확인해주세요.");
			return false;
		}
	});
	
});	
//비밀번호 재확인
$(function(){
    $('#newPasswdCheck').change(function(){

        if($('#newPasswd').val() != $('#newPasswdCheck').val()){
        	$("#checkPasswdConfirmResult").html("불일치").css("color", "red");
        } else{
        	$("#checkPasswdConfirmResult").html("일치").css("color", "purple");
        }
    });
});


</script>
</body>
</html>
