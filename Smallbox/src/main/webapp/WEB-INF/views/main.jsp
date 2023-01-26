<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<script src="https://kit.fontawesome.com/db377c3d46.js" crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<meta content="" name="description">
<meta content="" name="keywords">

<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/top.css">
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
<!-- 메인페이지 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<!-- 메인페이지 아이콘 -->
<style type="text/css">
.resurve-btn {
	font-family: 'ONE-Mobile-Regular';
    font-weight: 500;
    font-size: 14px;
    letter-spacing: 1px;
    display: inline-block;
    padding: 14px 32px;
    border-radius: 4px;
    transition: 0.5s;
    line-height: 1;
    color: #fffff;
    -webkit-animation-delay: 0.8s;
    animation-delay: 0.8s;
    background: rgb(192, 130, 255);
    text-decoration: none;
}
.search { 
 	padding-top: 50px; 
 	border: 5; 
}
.input-text {
	height: 30px;
}

</style>
<title>스몰박스</title>
</head>

<body>

<header id="header">
 	<jsp:include page="inc/top.jsp"></jsp:include>
</header>

<!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(${pageContext.request.contextPath }/resources/assets/img/slide/avatar.jpeg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">아바타 - 물의길 (4D)</h2>
              <p class="animate__animated animate__fadeInUp">
              	판도라 행성에서 '제이크 설리'와 '네이티리'가 이룬 가족이 겪게 되는 무자비한 위협과 살아남기 위해 떠나야 하는 긴 여정과 전투, 
              	그리고 견뎌내야 할 상처에 대한 이야기를 그렸다. 월드와이드 역대 흥행 순위 1위를 기록한 전편 "아바타"에 이어 
              	제임스 카메론 감독이 13년만에 선보이는 영화로, 샘 워싱턴, 조 샐다나, 시고니 위버, 스티븐 랭, 케이트 윈슬렛이 출연하고 존 랜도가 프로듀싱을 맡았다.</p>
              <a href="Reserve.mv" class="btn-get-started animate__animated animate__fadeInUp scrollto">예매하기</a>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath }/resources/assets/img/slide/hero.jpeg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">영웅</h2>
              <p class="animate__animated animate__fadeInUp">
              	적진 한복판에서 목숨을 걸고 정보를 수집하던 독립군의 정보원 ‘설희’(김고은)는 
              	이토 히로부미가 곧 러시아와의 회담을 위해 하얼빈을 찾는다는 일급 기밀을 다급히 전한다. 
              	드디어 1909년 10월 26일, 이날만을 기다리던 안중근은 하얼빈역에 도착한 이토 히로부미를 향해 주저 없이 방아쇠를 당긴다. 
              	현장에서 체포된 그는 전쟁 포로가 아닌 살인의 죄목으로, 조선이 아닌 일본 법정에 서게 되는데… 누가 죄인인가, 누가 영웅인가!</p>
              <a href="Reserve.mv" class="btn-get-started animate__animated animate__fadeInUp scrollto">예매하기</a>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(${pageContext.request.contextPath }/resources/assets/img/slide/bootsCat.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animate__animated animate__fadeInDown">장화신은 고양이: 끝내주는 모험</h2>
              <p class="animate__animated animate__fadeInUp">
              	아홉 개의 목숨 중 단 하나의 목숨만 남은 장화신은 고양이. 
              	마지막 남은 목숨을 지키기 위해 히어로의 삶 대신 반려묘의 삶을 선택한 그에게 찾아온 마지막 기회, 
              	바로 소원을 들어주는 소원별이 있는 곳을 알려주는 지도! 
              	잃어버린 목숨을 되찾고 다시 히어로가 되기를 꿈꾸는 장화신은 고양이는 뜻밖의 동료가 된 앙숙 파트너 '키티 말랑손', 
              	그저 친구들과 함께 라면 모든 게 행복한 강아지 '페로'와 함께 소원별을 찾기 위해 길을 떠난다. 
              	그리고 소원별을 노리는 또 다른 빌런들과 마주치게 되는데… 새해를 여는 끝내주는 모험이 시작된다!
              </p>
              <a href="Reserve.mv" class="btn-get-started animate__animated animate__fadeInUp scrollto">예매하기</a>
            </div>
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>
  </section><!-- End Hero -->

	<!-- ====================== 박스오피스 ============================ -->
	<section >
		<div class="container">
		
			<div class="section-title">
				<h2>개봉작 순위</h2>
			</div>
			
			<div class="row" style="padding-left: 60px;">
			
				<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" >
					<div class="icon-box iconbox-yellow">
						<div class="icon" style="text-align: center;">
							<a href="MovieDetail.mv?movie_idx=7"><img src="${pageContext.request.contextPath }/resources/assets/img/poster/avatar.jpg"  style="width: 363px;"></a>
							<h4 style="font-family: 'ONE-Mobile-Regular';">아바타 : 물의 길</h4>
								<div>
									<a href="Reserve.mv" class="getstarted scrollto">예매하기</a>
								</div>
						</div>
					</div>
				</div>
					
				<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4"> 
					<div class="icon-box iconbox-yellow">
						<div class="icon" style="text-align: center;">
							<a href="MovieDetail.mv?movie_idx=14"><img src="${pageContext.request.contextPath }/resources/assets/img/poster/captain_marvel.jpg" style="width: 350px;"></a>
							<h4 style="font-family: 'ONE-Mobile-Regular';">캡틴마블</h4>
								<div>
									<a href="Reserve.mv" class="getstarted scrollto">예매하기</a>
								</div>
						</div>
					</div>
				</div>
					
				<div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 " >
					<div class="icon-box iconbox-yellow">
						<div class="icon" style="text-align: center;">
							<a href="MovieDetail.mv?movie_idx=12"><img src="${pageContext.request.contextPath }/resources/assets/img/poster/wakanda.jpg" style="width: 350px;"></a>
							<h4 style="font-family: 'ONE-Mobile-Regular';">블랙팬서 : 와칸다 포에버</h4>
								<div>
									<a href="Reserve.mv" class="getstarted scrollto">예매하기</a>
								</div>
						</div>
					</div>
				</div>
			
			</div>
		
		</div>
	</section>
	<!-- ====================== 박스오피스 ============================ -->

<main id="main">  
<!-- ======= Featured Services Section ======= -->
<section id="featured-services" class="featured-services section-bg ">
	<div class="container">
		<div class="row no-gutters" align="center">
			<div class="col-lg-4 col-md-6">
				<form action="MovieList.mv" style="width: 600px;">
					<div>
						<input type="text" name="keyword" class="input_box" placeholder="영화명을 입력하세요">
						<button class="btn" id="btnSearch">
							<i class="fa-solid fa-magnifying-glass " class="btn" id="btnSearch"></i>
						</button>
					</div>
			    </form>
			</div>
			<div class="col-lg-4 col-md-6" align="center">
				<div class="icon-box">
					<div class="icon">
						<i class="fas fa-box-open"></i>
					</div>
					<h4 class="title"><a href="MovieList.mv" style="text-decoration: none;">박스오피스</a></h4>
				</div>
			</div>
			<div class="col-lg-4 col-md-6" align="center">
				<div class="icon-box">
					<div class="icon">
						<i class="fas fa-ticket-alt"></i>
					</div>
					<h4 class="title"><a href="Reserve.mv" style="text-decoration: none;">빠른예매</a></h4>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Featured Services Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row no-gutters">

          <div class="col-lg-4 col-md-6 content-item">
            <span>01</span>
            <h4>DOLBY CINEMA</h4>
            <p>보고, 듣는 영화에 만족할 수 없는 당신을 위해! 드라마틱한 이미지, 입체적인 사운드, 몰입에 최적화 된 공간까지!</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>02</span>
            <h4>PRIVATE ROOM</h4>
            <p>전용 라운지와 총 8석의 상영관</p>
			<p>전담 룸 서비스와 호텔급 어매니티 (코트 체크, 스타일러, 미니바)</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>03</span>
            <h4>MX - THE TRUE SOUND</h4>
            <p>DCI기준 17(ft-L)을 충족하는 스크린 밝기와 와이드 시트를 통해 최적의 영화 경험을 선사합니다.</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>04</span>
            <h4>THE BOUTIQUE SUITE</h4>
			<p>편안한 관람을 위해 제공되는 스위트 패키지</p>
			<p>에스코트 서비스와 컨시어지 서비스</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>05</span>
            <h4>COMFORT SEAT FOR YOU</h4>
            <p>당신을 위해 특별히 준비한 다양한 타입의 여유 공간을 통해서 편안한 관람 환경을 제공합니다.</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>06</span>
            <h4>PUPPY CINEMA</h4>
            <p>강아지와 함께 앉도록 배려한 서비스를 담은 진정한 의미의 세계 최초 반려동물 동반 영화관</p>
          </div>

        </div>

      </div>
    </section><!--End Why Us Section-->


    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2>고객지원</h2>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box iconbox-yellow">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5" d="M300,503.46388370962813C374.79870501325706,506.71871716319447,464.8034551963731,527.1746412648533,510.4981551193396,467.86667711651364C555.9287308511215,408.9015244558933,512.6030010748507,327.5744911775523,490.211057578863,256.5855673507754C471.097692560561,195.9906835881958,447.69079081568157,138.11976852964426,395.19560036434837,102.3242989838813C329.3053358748298,57.3949838291264,248.02791733380457,8.279543830951368,175.87071277845988,42.242879143198664C103.41431057327972,76.34704239035025,93.79494320519305,170.9812938413882,81.28167332365135,250.07896920659033C70.17666984294237,320.27484674793965,64.84698225790005,396.69656628748305,111.28512138212992,450.4950937839243C156.20124167950087,502.5303643271138,231.32542653798444,500.4755392045468,300,503.46388370962813"></path>
                </svg>
                <i class="fas fa-user-headset"></i>
              </div>
              <h4><a href="Notice_list.ad" style="text-decoration: none;">공지사항</a></h4>
              <p>This is the customer inquiry board. If you have any questions or questions about our small box, please feel free to contact us.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box iconbox-red">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5" d="M300,532.3542879108572C369.38199826031484,532.3153073249985,429.10787420159085,491.63046689027357,474.5244479745417,439.17860296908856C522.8885846962883,383.3225815378663,569.1668002868075,314.3205725914397,550.7432151929288,242.7694973846089C532.6665558377875,172.5657663291529,456.2379748765914,142.6223662098291,390.3689995646985,112.34683881706744C326.66090330228417,83.06452184765237,258.84405631176094,53.51806209861945,193.32584062364296,78.48882559362697C121.61183558270385,105.82097193414197,62.805066853699245,167.19869350419734,48.57481801355237,242.6138429142374C34.843463184063346,315.3850353017275,76.69343916112496,383.4422959591041,125.22947124332185,439.3748458443577C170.7312796277747,491.8107796887764,230.57421082200815,532.3932930995766,300,532.3542879108572"></path>
                </svg>
              <i class="fas fa-building"></i>
              </div>
              <h4><a href="team.ad" style="text-decoration: none;">조원 소개</a></h4>
              <p>This is the introduction space of the team members who worked on the project togethe</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box iconbox-teal">
              <div class="icon">
                <svg width="100" height="100" viewBox="0 0 600 600" xmlns="http://www.w3.org/2000/svg">
                  <path stroke="none" stroke-width="0" fill="#f5f5f5" d="M300,566.797414625762C385.7384707136149,576.1784315230908,478.7894351017131,552.8928747891023,531.9192734346935,484.94944893311C584.6109503024035,417.5663521118492,582.489472248146,322.67544863468447,553.9536738515405,242.03673114598146C529.1557734026468,171.96086150256528,465.24506316201064,127.66468636344209,395.9583748389544,100.7403814666027C334.2173773831606,76.7482773500951,269.4350130405921,84.62216499799875,207.1952322260088,107.2889140133804C132.92018162631612,134.33871894543012,41.79353780512637,160.00259165414826,22.644507872594943,236.69541883565114C3.319112789854554,314.0945973066697,72.72355303640163,379.243833228382,124.04198916343866,440.3218312028393C172.9286146004772,498.5055451809895,224.45579914871206,558.5317968840102,300,566.797414625762"></path>
                </svg>
                <i class="fas fa-camera-movie"></i>
              </div>
              <h4><a href="teatherList.ad" style="text-decoration: none;">영화관 소개</a></h4>
              <p>Let me introduce our movie theater facilities! It's gonna be awesome!</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Cta Section ======= -->
    <section id="cta" class="cta">
      <div >

        <div class="row">
          <div class="col-lg-9 text-center text-lg-start" style="padding-left: 300px;">
            <h3>지금 예매하세요!</h3>
            <p> 돌비사운드의 웅장한 사운드와 프라이빗룸으로 되어 있는 스몰박스가 당신을 초대합니다.</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center" style="padding-right: 280px;">
            <a class="cta-btn align-middle" href="Reserve.mv">예매하러 가기</a>
          </div>
        </div>

      </div>
    </section><!-- End Cta Section -->

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="section-title">
          <h2>스틸컷</h2>
        </div>

        <div class="row">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">AVATAR</li>
              <li data-filter=".filter-card">MARVEL</li>
              <li data-filter=".filter-web">DC</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/avatar1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>아바타</h4>
                <p>아바타</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/avatar1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/dc1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>DC</h4>
                <p>DC</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/dc1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/avatar2.webp" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>아바타</h4>
                <p>아바타</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/avatar2.webp" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/marvel1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>MARVEL</h4>
                <p>MARVEL</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/marvel1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/dc2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>DC</h4>
                <p>DC</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/dc2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 2"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/avatar3.avif" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>아바타</h4>
                <p>아바타</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/avatar3.avif" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/marvel2.webp" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>MARVEL</h4>
                <p>MARVEL</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/marvel2.webp" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/marvel3.jpeg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>MARVEL</h4>
                <p>MARVEL</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/marvel3.jpeg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="${pageContext.request.contextPath }/resources/assets/img/portfolio/dc3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>DC</h4>
                <p>DC</p>
                <div class="portfolio-links">
                  <a href="${pageContext.request.contextPath }/resources/assets/img/portfolio/dc3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Section -->


  </main><!-- End #main -->

<!-- ---------------footer------------- -->
<footer id="header">
	<jsp:include page="inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

</body>

</html>