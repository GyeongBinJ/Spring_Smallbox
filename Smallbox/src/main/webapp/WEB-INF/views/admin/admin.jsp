<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<!-- --------------------- 들고다니세요 ------------------------------------ -->
<!-- css -->
<link rel="stylesheet" href="./assets/css/reset.css">

<!-- Favicons -->
<link href="./assets/img/favicon.png" rel="icon">
<link href="./assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="./assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="./assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="./assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="./assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<link href="./assets/css/style_admin.css" rel="stylesheet">
<!-- --------------------- 들고다니세요 ------------------------------------ -->

<!-- 실험 중 -->
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
 <title>관리자 페이지</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link href="../assets/css/styles.css" rel="stylesheet" />
 <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- 실험 끝 -->

<title>SMALL BOX - 관리자</title>
</head>
<body class="sb-nav-fixed">
	<!-- 관리자 아니면 접근 불가 -->
	<c:if test='${empty sessionScope.sId or sessionScope.sId ne "admin"}'>
		<script type="text/javascript">
		 	alert("접근 불가합니다.");
		 	history.back();
		</script>
	</c:if>
	<!-- 관리자 아니면 접근 불가 -->

	<header id="header">
    	<jsp:include page="../inc/top_admin.jsp"></jsp:include>
    </header>
    
<!-- --------------------- <관리자 페이지> 들고다니세요 ------------------------------------ -->
    <section class="breadcrumbs_admin">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li><a href="Admin.ad">관리자 페이지</a></li>
            <!-- 페이지 주소, 이름 넣는곳 -->
<!--             <li><a href="#"></a>##</li> -->
          </ol>
        </div>
      </div>
    </section>
<!-- --------------------- <관리자 페이지> 들고다니세요 ------------------------------------ -->
            <!-- 본문 영역 시작 -->
           
<%--             <center> --%>
<!--             <h1>관리자 메인페이지입니다요 ~</h1> -->
<!--             <img src="./assets/img/roopy.jpeg"> -->
<%--             </center> --%>


  <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4" style="margin-top: 80px;">
                        <ol class="breadcrumb mb-4">
                        </ol>
                        <div class="row" style="width: 1000px; margin-left: 350px;">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">영화관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="AdminMovieList.ad">영화목록</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">회원관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="MemberList.ad">회원목록</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">극장관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="AdminTheaterList.ad">극장목록</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">공지관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="Notice_list.ad">공지목록</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="col-xl-6" style="margin-bottom: 200px; width: 1000px; margin-left: 350px;">
                                <div class="card mb-4">
                                    <div class="card-header" style="color: black">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        This Month's 예매 내역
                                        <div class="card mb-4">
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                        	<th>예매날짜</th>
                                            <th>영화명</th>
                                            <th>상영시각</th>
                                            <th>회원 아이디</th>
                                            <th>좌석</th>
                                            <th>최종가격</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                   		<c:forEach var="reserve" items="${reserve }">
                                        <tr>
                                            <td>${reserve.res_date }</td>
                                            <td>${reserve.theater_title }</td>
                                            <td>${reserve.res_time }</td>
                                            <td>${reserve.member_id }</td>
                                            <td>${reserve.res_seat }</td>
                                            <td>${reserve.res_price }</td>
                                        </tr>
                                    	</c:forEach>  
                                    </tbody>
                                </table>
                           
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                </main>
            </div>
           
      <footer id="footer">
      		<jsp:include page="../inc/bottom.jsp"></jsp:include>
      </footer>
    </body>
</html>
