<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<meta charset="UTF-8">
<script type="text/javascript">
function confirm_logout() {
	let result = confirm("로그아웃 하시겠습니까?");
	
	if(result) {
		location.href="./MemberLogout.sm";
	}
}
</script>
<style type="text/css">
.topLogo {
	padding-left: 20px;
}
</style>
<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "e7205392-7af0-48bf-a4f4-20c8962688b5"
  });
</script>
<!-- End Channel Plugin -->

</style>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.sId}">
	  <header id="header" class="d-flex align-items-center">
	    <div class="container d-flex align-items-center">
	    	<nav id="navbar" class="navbar">
	    	<li class="dropdown" style="list-style: none;">
              	<div style="margin-right: 10px;"><i class="fas fa-bars fa-2x menu"></i></div> 
              		<ul>
	          		<li class=""><h4>전체 메뉴</h4></li>
          			<li class="dropdown"><a href="MovieList.mv"><span>영화</span> <i class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="MovieList.mv">박스오피스</a></li>
							<li><a href="ComingMovieList.mv">개봉 예정작</a></li>
						</ul>
					</li>
	          		<li class="dropdown"><a href="Reserve.mv">예매<i class="bi bi-chevron-right"></i></a>
                    <li class="dropdown"><a href="Notice_list.ad">공지사항<i class="bi bi-chevron-right"></i></a>
                    <li class="dropdown"><a href="team.ad">조원소개<i class="bi bi-chevron-right"></i></a>
                    <li class="dropdown"><a href="teatherList.ad">영화관 소개<i class="bi bi-chevron-right"></i></a>
                    </li>
	          	</ul>
              </li>
	    	 </nav><!-- .navbar -->
	    	  <!-- 로고 -->
		      <h1 class="logo me-auto">
			      <a href="./">
			        <img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" class="topLogo">
			      </a>
		      </h1>
		        <!-- 로고 끝 -->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li class="dropdown"><a class="nav-link scrollto active" href="MovieList.mv">영화<i class="bi bi-chevron-down"></i></a>
	          	<ul>
	          		<li><a href="MovieList.mv">박스오피스</a></li>
                    <li><a href="ComingMovieList.mv">상영 예정작</a></li>
	          	</ul>
	          </li>
	          <li><a class="nav-link scrollto" href="teatherList.ad">극장</a></li>
	          <li><a class="nav-link scrollto" href="Notice_list.ad">공지</a></li>
              <li><a class="nav-link scrollto" href="MemberLoginForm.sm">로그인</a></li>
	          <li><a class="getstarted scrollto" href="Reserve.mv">빠른예매</a></li>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
	  </header><!-- End Header -->
	</c:when>
	<c:otherwise>
		<header id="header" class="d-flex align-items-center">
	    <div class="container d-flex align-items-center">
			<nav id="navbar" class="navbar">
			
	    	<li class="dropdown" style="list-style: none;">
              	<div style="margin-right: 10px;"><i class="fas fa-bars fa-2x menu"></i></div> 
              		<ul>
	          		<li class=""><h4>전체 메뉴</h4></li>
          			<li class="dropdown"><a href="MovieList.mv" style="text-decoration: none;"><span>영화</span> <i class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="MovieList.mv" style="text-decoration: none;">박스오피스</a></li>
							<li><a href="ComingMovieList.mv" style="text-decoration: none;">개봉 예정작</a></li>
						</ul>
					</li>
	          		<li class="dropdown"><a href="Reserve.mv" style="text-decoration: none;">예매<i class="bi bi-chevron-right"></i></a>
                    <li class="dropdown"><a href="Notice_list.ad" style="text-decoration: none;">공지사항<i class="bi bi-chevron-right"></i></a>
                    <li class="dropdown"><a href="team.ad" style="text-decoration: none;">조원소개<i class="bi bi-chevron-right"></i></a>
                    <li class="dropdown"><a href="teatherList.ad" style="text-decoration: none;">영화관 소개<i class="bi bi-chevron-right"></i></a>
                    </li>
	          	</ul>
              </li>
	    	 </nav><!-- .navbar -->
	    	  <!-- 로고 -->
	    	  <h1 class="logo me-auto">
		    	 <a href="./">
		     		<img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" class="topLogo">
		     	 </a>
		       <!-- 로고 -->
	      </h1>
	      <nav id="navbar" class="navbar">
	      <ul>
	          <li class="dropdown"><a href="MovieList.mv" style="text-decoration: none;"><span>영화</span><i class="bi bi-chevron-down"></i></a>
	          	 <ul>
	          		<li><a href="MovieList.mv" style="text-decoration: none;">박스오피스</a></li>
                    <li><a href="ComingMovieList.mv" style="text-decoration: none;">상영 예정작</a></li>
	             </ul>
	          </li>
	        <li><a class="nav-link scrollto" href="teatherList.ad">극장</a></li>
	        <li><a class="nav-link scrollto" href="Notice_list.ad">공지사항</a></li>
			<li class="dropdown"><a href="MyPageMain.my" style="text-decoration: none;">${sessionScope.sId } 님<i class="bi bi-chevron-down"></i></a>
		   	 <ul>
					<li class="dropdown"><a href="#" style="text-decoration: none;"><span>회원정보</span> <i class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="MemberModifyForm.sm" style="text-decoration: none;">회원정보수정</a></li>
							<li><a href="MemberDeleteForm" style="text-decoration: none;">회원탈퇴</a></li>
						</ul>
					</li>
					<c:if test='${sessionScope.sId eq "admin"}'> 
						<li  class="dropdown"><a class="nav-link scrollto" href="Admin.ad" style="text-decoration: none;">관리자페이지<i class="bi bi-chevron-right"></i></a>
							<ul>
								<li><a href="MemberList.ad" style="text-decoration: none;">회원관리</a></li>
								<li><a href="AdminMovieList.ad" style="text-decoration: none;">영화관리</a></li>
								<li><a href="AdminTheaterList.ad" style="text-decoration: none;">극장관리</a></li>
								<li><a href="Notice_list.ad" style="text-decoration: none;">공지관리</a></li>
							</ul>
						</li>
					</c:if>		
					<li><a href="Reserved.my" style="text-decoration: none;">예매내역</a></li>
					<li><a href="CouponList.my" style="text-decoration: none;">쿠폰함</a></li>
					<li><a href="MovieLikeList.my" style="text-decoration: none;">찜목록</a></li>
					<li><a href="ReviewList.my" style="text-decoration: none;">리뷰내역</a></li>
					<li><a href="QnaList.my" style="text-decoration: none;">문의내역</a></li>
				</ul>
			</li>
	          <li><a class="nav-link scrollto" href="MemberLogout.sm">로그아웃</a></li>
	          <li><a class="getstarted scrollto" href="Reserve.mv">빠른예매</a></li>
	        </ul>
	      </nav><!-- .navbar -->
	
	    </div>
	  </header><!-- End Header -->
	</c:otherwise>
</c:choose>

</body>
</html>