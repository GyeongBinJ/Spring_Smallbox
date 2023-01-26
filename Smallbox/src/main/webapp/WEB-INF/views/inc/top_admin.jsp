<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
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
#dropdown-menu {
	width: 1300px;
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

</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.sId}">
	  <header id="header" class="d-flex align-items-center">
	    <div class="container d-flex align-items-center">
	    	<nav id="navbar" class="navbar">
              	<div><i class="fas fa-bars fa-2x"></i></div> 
	    	 </nav><!-- .navbar -->
	    	  <!-- 로고 -->
		      <h1 class="logo me-auto">
			      <a href="./">
			        <img src="${pageContext.request.contextPath }/resources/assets/img/logo.png">
			      </a>
		      </h1>
		      <!-- 로고 끝 -->
		      
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	    </div>
	  </header><!-- End Header -->
	</c:when>
	<c:otherwise>
		<header id="header" class="d-flex align-items-center">
	    <div class="container d-flex align-items-center">
	    	  <!-- 로고 -->
	    	  <h1 class="logo me-auto">
		    	 <a href="./">
		     		<img src="${pageContext.request.contextPath }/resources/assets/img/logo.png">
		     	 </a>
		       <!-- 로고 -->
	      </h1>
	      <nav id="navbar" class="navbar">
	      <ul>
	      	<li class="dropdown">영화관리 <i class="bi bi-chevron-down">&nbsp; &nbsp;</i>
		   		<ul>
					<li><a href="AdminMovieList.ad"><span>영화 조회</span></a></li>
					<li><a href="MovieInsertForm.ad"><span>영화 등록</span></a></li>
<!-- 					<li><a href="#"><span>3</span></a></li> -->
	        	</ul>
	        </li>
	      	<li class="dropdown">회원관리 <i class="bi bi-chevron-down">&nbsp; &nbsp;</i>
		   		<ul>
					<li><a href="MemberList.ad"><span>회원목록</span></a></li>
					<li><a href="CouponListTotal.ad"><span>쿠폰 목록</span></a></li>
					<li><a href="QnaList.ad"><span>1:1 문의관리</span></a></li>
	        	</ul>
	        </li>
	      	<li class="dropdown">극장관리 <i class="bi bi-chevron-down">&nbsp; &nbsp;</i>
		   		<ul>
					<li><a href="AdminTheaterList.ad"><span>상영일정 조회</span></a></li>
					<li><a href="AdminTheaterInsertForm.ad"><span>상영일정 등록</span></a></li>
	        	</ul>
	        </li>
	      	<li class="dropdown">공지관리 <i class="bi bi-chevron-down">&nbsp; &nbsp;</i>
		   		<ul>
					<li><a href="Notice_list.ad"><span>공지사항 목록</span></a></li>
					<li><a href="Admin_notice_write.ad"><span>공지사항 등록</span></a></li>
	        	</ul>
	        </li>
	        <li><a class="nav-link scrollto" href="MemberLogout.sm">로그아웃</a></li>
	        <li><a class="getstarted scrollto" href="./">메인 홈</a></li>
	        </ul>
<!-- 	        <i class="bi bi-list mobile-nav-toggle"></i> -->
	      </nav><!-- .navbar -->
	    </div>
	  </header><!-- End Header -->
	</c:otherwise>
</c:choose>
<!-- ======= Header ======= -->
</body>
</html>