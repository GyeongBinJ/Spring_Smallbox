<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/swiper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/terms.css">

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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(function(){
	// 다음단계버튼 활성화
    $("#nextBtn").click(function(){    
        if($(":checkbox").is(":checked") == false){
            alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
            return false;
        }else{
            $("#terms_form").submit();
        }
    });    
    
    // 전체 체크, 전체체크 해제
    $("#check_all").on("change", function() {
    	
		if($("#check_all").is(":checked")) { // 전체선택 체크박스 상태가 checked 인지 판별
			
			$(":checkbox").each(function(index, item) {
				$(item).prop("checked", true);
			});
		
		} else {
			$(":checkbox").prop("checked", false);
		}
	});
    
	
});
</script>
<style type="text/css">
#btn {
	transform: translateX(-48%);
}
</style>
<!-- ------------------------------------------------------------------------------------------ -->
<title>스몰박스 - 약관동의</title>
</head>

<body>
	<header id="header">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<hr>
	<!-- //header -->

	<form id="terms_form" class="f" align="center" action="MemberJoinForm.sm">
		<br><br><br><br>
		<p class="page-info-txt" align="center">
			<strong>약관동의 및 정보활용동의</strong><br> 
			<span>스몰박스 서비스 이용을 위한 약관에 동의해주세요.</span>
		</p>
		<div>
			<h4 class="scheme-g">●개인정보 처리방침</h4>
			<textarea style="font-size: 1em;" readonly="readonly">
           		<jsp:include page="../terms/PersonInfo.jsp"></jsp:include>
            </textarea>
			<p>
				<label><input type="checkbox" id="check1" /> 약관에 동의 합니다.</label><br>
			</p>
			<h4 class="scheme-g">●서비스 이용약관 동의</h4>
			<textarea style="font-size: 1em;" readonly="readonly">
				<jsp:include page="../terms/ServiceInfo.jsp"></jsp:include>
            </textarea>
			<p>
				<label><input type="checkbox" id="check2" /> 약관에 동의 합니다.</label><br>
			</p>
			<hr>
			<p>
				<label><input type="checkbox" id="check_all" name="check_all" /> 위의 약관에 동의합니다.</label><br>
			</p>
			<p id="btn">
				<input type="button" id="nextBtn" class="button_big" value="다음단계">
			</p>
		</div>
	</form>
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>