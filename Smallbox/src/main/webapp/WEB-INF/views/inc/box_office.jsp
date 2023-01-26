<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<style type="text/css">
*{
	magin: 0;
	padding: 0;
}
 #wrap { 
 	width: 250px; 
 	border: 1px solid red; 
 	margin: 0 auto; 
 	overflow: hidden; 
 	padding-top: 10px; 
 }
.btn {
  font-family: "Raleway", sans-serif;
  font-weight: 500;
  font-size: 14px;
  letter-spacing: 1px;
  display: inline-block;
  padding: 10px 15px;
  border-radius: 4px;
  transition: 0.5s;
  line-height: 1;
  color: #fff;
  -webkit-animation-delay: 0.8s;
  animation-delay: 0.8s;
  background: rgb(192, 130, 255);
}
. poster-list {
	width: 20px;
	margin-left: auto;
	margin-right: auto;
}
.poster {
	width: 400px;
	text-align: center;
	display: block;
	text-decoration: none;
	float: left;
	text-align: center;
}
</style>
</head>
<body>
<section>
<div class="poster-list">
	<div class="poster">
		<img src="${pageContext.request.contextPath }/resources/assets/img/poster/avatar_poster.jpg" >
			<div class="portfolio-info poster ">
				<h4>아바타</h4>
				<div class="portfolio-links">
					<a href="#about" class="btn">찜 하기</a>
					<a href="#about" class="btn">예매하기</a>
				</div>
			</div>
		</div>
		<div class="poster">
		<img src="${pageContext.request.contextPath }/resources/assets/img/poster/cat_poster.jpeg">
			<div class="portfolio-info poster ">
				<h4>장화신은 고양이: 끝내주는 모험</h4>
				<div class="portfolio-links">
					<a href="#about" class="btn">찜 하기</a>
					<a href="#about" class="btn">예매하기</a>
				</div>
			</div>
		</div>
		<div class="poster">
		<img src="${pageContext.request.contextPath }/resources/assets/img/poster/hero_poster.jpg">
			<div class="poster">
				<h4>영웅</h4>
				<div class="portfolio-links">
					<a href="#about" class="btn">찜 하기</a>
					<a href="#about" class="btn">예매하기</a>
				</div>
			</div>
		</div>
</div>
</section>
</body>
</html>