<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserve</title>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/reset.css">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">

<link href="./assets/css/style.css" rel="stylesheet">
    
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<style>


#movie-select {
	width: 200px; 
	padding: .8em .5em; 
	font-size: 15px;
	appearance: none;
}
.reserve-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    height: 800px;
    /* border: 1px solid #dddddd; */
}

.reserve-container>div {
    border: 1px solid #dddddd;
}

.reserve-sId {
    color: #444444;
    padding: 5px;
    font-size: 18px;
    margin-top: 50px;
    margin-left: 210px;

}
.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.movie-part {
    width: 284px;
}

.theater-part {
    width: 264px;
}

.day-part {
    width: 91px;
}

.time-part {
    width: 384px;
}

.sort-wrapper {
    margin: 10px 6px 6px 10px;
    /* padding: 3px; */
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}

.sort-wrapper>div {
    padding: 3px;
}

/* .sort-wrapper>div:hover { */
/*     border-bottom: 1px solid #111111; */
/* } */

.sort-selected {
    font-weight: bold;
    border-bottom: 1px solid #111111;
}

.reserve-date {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 770px;
    overflow: scroll;
    overflow-x: hidden;
}

.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
}

.movie-week-of-day {
    margin-left: 5px;
    font-size: 10px;
    width: 12px;
    height: 22px;
    line-height: 22px;
}

.movie-day {
    text-align: center;
    width: 34px;
    height: 22px;
    font-size: 17px;
    font-weight: bold;
}

.saturday {
    color: #31597E;
    font-weight: bold;
}

.sunday {
    color: #AF2D2D;
    font-weight: bold;
}

.movie-date-wrapper-active {
    background-color: #333333;
}

.movie-date-wrapper-active>* {
    color: white;
}

.timeButton:hover,
.timeButton.active {
	background: #3B0B5F;
  	color: white;
}
.timeButton:visited {
	background: #3B0B5F;
  	color: white;
}
.timeButton {
	border: 0;
	width: 90px;
	height: 40px;
}
.submit_btn {
  position: relative;
  border: 0;
  padding: 15px 25px;
  display: inline-block;
  text-align: center;
  color: white;
  background-color: black;
  border-radius: 10px;
}
.submit_btn:hover,
.submit_btn:active {
  background-color: #3B0B5F; 
}
</style>
<script type="text/javascript">
	$(function() {
		// for문을 사용하여 현재부터 마지막날까지의 시간 값을 구함
		for(let i = 0; i <= $(".movie-date-wrapper").length; i++) {
			// 날짜 버튼 클릭시 해당 일의 날짜와 선택된 영화 값을 선택하여 ajax로 보냄
			$(".movie-date-wrapper").eq(i).on("click", function() {
				// 클릭한 날짜를 yyyy-mm-dd의 형식으로 바꿈, toISOString() 지정시 한국 시간과 9시간이 차이나기 때문에
				// 별도로 시간값을 +9 해주면 현재 시간이 된다. 코드 구구절절 레전드
				let clickDate = new Date(date.getFullYear(), date.getMonth(), $(".movie-day").eq(i).html(), date.getHours() + 9).toISOString().split("T")[0];
// 				alert(clickDate);
// 				alert($(".movie-select > option:selected").val());
			
				$.ajax({
					type: "get", // AJAX 로 요청 시 HTTP 요청 방식(GET or POST) 지정
					url: "ReserveSelectPro.mv", // 컨트롤러로 보낼 주소를 지정
					data: { // 전송할 데이터(파라미터) 지정(일반 파라미터일 경우 중괄호로 묶음)
						// 폼 데이터를 가져와서 파라미터로 표현(전송)하는 경우
						// 파라미터명: 데이터 형식으로 지정
						movie_title: $("#movie-select").val(), // select option에서 선택한 값
						reserve_date: clickDate // 선택한 날짜
					},
					dataType: "text", // 응답 데이터에 대한 타입 지정(일반 데이터는 text 이며 HTML 코드도 포함 가능, 자바스크립트 포함되면 html 사용)
					success: function(response) { // 요청에 대한 처리 성공 시(= 정답 응답) 처리할 함수 정의
						// 익명 함수 파라미터로 응답 데이터가 전달됨(처리 페이지의 응답 결과)
								$(".theater-list").html(response);
					}, 
					error: function(xhr, textStatus, errorThrown) { 
						// 요청에 대한 처리 실패 시(= 에러 발생 시) 실행되는 이벤트
						$("#resultArea").html("xhr = " + xhr + "<br>textStatus = " + textStatus + "<br>errorThrown = " + errorThrown);
					}
				});
				
			});
			
			
		};

		// 상영 시간 값을 지정할 때 영화 제목, 상영 날짜, 상영시간을 모두 선택하지 않으면 좌석 페이지로 넘어갈 수 없도록 제어
	          $('#reserveForm').submit(function() {
	        	  
// 	        	 alert($("input[name=reserved_date]").val());
	             if($("#movie-select").val() == "" || $("input[name=reserved_date]").val() == null || $(".timeButton.active").val() == null) {
	                 alert("영화와 상영날짜와 상영시간을 모두 선택하세요!");
	                return false;
	             }
	             
	          });
		
	          var url_href = window.location.href;
	          var url = new URL(url_href); // URL 객체 선언
	          const urlParams = new URLSearchParams(location.search); // URL에서 파라미터만 가져와서 객체 생성
// 	          alert(location.search);
	          // 파라미터에 영화 제목에 해당되는 값이 있을 경우 selectBox에 해당되는 값을 넣음
	         if(urlParams.has('movie_title')) {
				$("#movie-select").val(url.searchParams.get("movie_title"));       	 
	         }
	          

	});
</script>	
</head>

<body>

<header id="header">
 	<jsp:include page="../inc/top.jsp"></jsp:include>
</header>

<!-- --------------------- 들고다니세요 ------------------------------------ -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>예매</h2>
          <ol>
            <li><a href="Reserve.mv">예매</a></li>
            <!-- 페이지 주소, 이름 넣는곳 -->
            <li><a href="Reserve.mv">빠른 예매</a></li>
          </ol>
        </div>
      </div>
    </section>
<!-- --------------------- 들고다니세요 ------------------------------------ -->
<div class="reserve-sId" style="margin-left: 580px;">
	<c:choose>
		<c:when test="${empty sessionScope.sId }">
				Guest 님,
			</c:when>
			<c:otherwise>
				${sessionScope.sId }님,
			</c:otherwise>
	</c:choose>

</div>

    <div class="reserve-container">
        <div class="movie-part">
            <div class="reserve-title">영화</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">예매율순</div>
            </div>
            <div class="movie-list">
            <select id="movie-select" name="selectName">
				<option value="">영화를 선택하세요.</option>
<!-- 			이 밑으로는 디비에서 불러온 값을 넣습니다. 반복문을 사용하여 작업해주시면 됩니다. -->
				<c:forEach var="movie" items="${movieList }">
					
					<option value="${movie.movie_title }">	${movie.movie_grade }
							<a href="MovieDetail.mv?movie_idx=${movie.movie_idx }">${movie.movie_title }</a>
					</option>		
				</c:forEach>
				

		</select>
				<div class="movie_picture">
				</div>
			</div>
        </div>
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
<!--         </form> -->
    <form action="ReserveSeat.mv" method="post" id="reserveForm">
        <div class="time-part">
            <div class="reserve-title">시간</div>
            <div class="theater-list">
	        
	         </div>
	        <input type="hidden" name="session_id" value="${sessionScope.sId }">
	        <c:choose>
				<c:when test="${empty sessionScope.sId }">
					로그인해주세요.
				</c:when>
				<c:otherwise>
			        <input type="submit" value="좌석 선택하기" class="submit_btn">
				</c:otherwise>
	</c:choose>
        </div>
    </form>
    </div>
    <script>
		// 현재 날짜를 불러올 Date 객체 생성
		// Mon Dec 26 2022 16:07:25 GMT+0900 (한국 표준시)
        const date = new Date();
        //  마지막 날짜(현재 날짜로부터 일주일간)를 불러오기 위해 새로운 객체, 년도와 월을 가져옴(getMonth()는 1월이 0으로 처리되기 때문에)
		//  필수로 +1를 처리해야한다.
		//  Sat Dec 31 2022 00:00:00 GMT+0900 (한국 표준시)
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        // 예매 날짜를 넣을 클래스 요소 선택(위에서 설정한 <div class="reserve-date"></div> 부분에 넣을 값)
        const reserveDate = document.querySelector(".reserve-date");

      // 요일값을 불러오기 위한 배열 생성과, 연도, 월을 가져올 변수를 지정한다. 월에는 +1 필수
            const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
            const year = date.getFullYear();
            const month = date.getMonth() + 1;
        //  현재 날짜의 일부터 lastDay()까지 +시켜가며 반복
        //  그만큼 버튼과 span영역을 만들기
            for (i = date.getDate(); i <= lastDay.getDate(); i++) {

                const button = document.createElement("button");
                const spanWeekOfDay = document.createElement("span");
                const spanDay = document.createElement("span");

                // class넣고 이름 지정하기
                button.classList = "movie-date-wrapper"
                // 해당 일 + 요일값을 출력할 버튼
                spanWeekOfDay.classList = "movie-week-of-day";
                spanDay.classList = "movie-day";

                //weekOfDay
                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                //요일 넣기
                if (dayOfWeek == "토") {
                    spanWeekOfDay.classList.add("saturday");
                    spanDay.classList.add("saturday");
                } else if (dayOfWeek == "일") {
                    spanWeekOfDay.classList.add("sunday");
                    spanDay.classList.add("sunday");
                }
                spanWeekOfDay.innerHTML = dayOfWeek;
                button.append(spanWeekOfDay);
                //날짜 넣기
                spanDay.innerHTML = i;
                button.append(spanDay);
                //button.append(i);
                reserveDate.append(button);

                dayClickEvent(button);
            }

        


        function dayClickEvent(button) {
            button.addEventListener("click", function() {
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                })
                button.classList.add("movie-date-wrapper-active");
            })
// 			alert($(button).attr("id"));
			$(".movie-date-wrapper-active").attr("id", "btn_selected");
        }
        
        
        function change_btn(e) {
			  var btns = document.querySelectorAll(".timeButton");
			  btns.forEach(function (btn, i) {
			    if (e.currentTarget == btn) {
			      btn.classList.add("active");
// 			      alert($(".timeButton").val());
					$("input[name=selected_time]").val($(".timeButton.active").val());
			    } else {
			      btn.classList.remove("active");
			    }
			  });
			  console.log(e.currentTarget);
		}
    </script>
<footer id="header">
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
</body>

</html>































