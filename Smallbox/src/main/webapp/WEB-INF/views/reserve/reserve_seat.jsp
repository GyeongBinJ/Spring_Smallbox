<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예매 좌석 선택</title>
<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/style.css">

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
    
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<style>
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

.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
     margin-bottom: 30px;
}

 .select_view {
	margin-left: 250px;
}


.select_seat_age {
   font-size: 12px;

}
.select_adult:hover,
.select_adult.active {
   background: #3B0B5F;
     color: white;
}
.select_adult:visited {
   background: #3B0B5F;
     color: white;
}
.select_adult {
   border: 0;
   width: 30px;
   height: 30px;
}
.select_teen:hover,
.select_teen.active {
   background: #3B0B5F;
     color: white;
}
.select_teen:visited {
   background: #3B0B5F;
     color: white;
}
.select_teen {
   border: 0;
   width: 30px;
   height: 30px;
}
.select_elderly:hover,
.select_elderly.active {
   background: #3B0B5F;
     color: white;
}
.select_elderly:visited {
   background: #3B0B5F;
     color: white;
}
.select_elderly {
   border: 0;
   width: 30px;
   height: 30px;
}


.seat-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.screen-view {
    width: 140px;
    color: #777777;
    padding-top: 30px;
    font-size: 30px;
    text-align: center;
    margin: 0 auto 30px auto;
    border-bottom: 1px solid #666666;
    letter-spacing: 4px;
}

.seat-wrapper {
    background-color: lightgray;
    width: 700px;
    height: 460px;
    /* padding-top: 120px; */
}

.selected-part {
   width: 300px;

}
.select_seat {
	float: left;
	margin-right: 15px;
}

/*혜연*/
#seatSelectWrapper {
	text-align: center;
}
/*ABCD 열 표시*/
.lineInfo { 
	display: inline-block;
	width: 50px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	margin-bottom: 5px;
}

/*체크박스 안보이게 함*/
input[type=checkbox] {
	display: none;
}

/*좌석 모양*/
input[type=checkbox] + label{
	display: inline-block;
	border: 1px solid;
	text-align: center;
	line-height: 30px;
	margin-bottom: 5px;
	width: 30px;
	height: 30px;
	border-radius: 4px;
}

/*좌석 클릭 시*/
input[type=checkbox]:checked + label{
	background-color: #3B0B5F;
}

/*이미 예약 된 좌석*/
input[type=checkbox]:disabled + label{
	background-color: gray;
}

/*좌석에 마우스 올림*/
.line:hover { 
 	background: #3B0B5F; 
   	color: white; 
 } 

/*결제버튼*/
#pagebtn {
	text-align: center; 
	margin-top: 30px; 
	margin-bottom: 10px;
	color: #3B0B5F;
	padding: 4px 10px;
	border-radius: 4px;
	border: 2px solid #3B0B5F;
	transition: 0.3s;
	font-size: 15px;
	background-color: white;
}
/*결제버튼 마우스 올림*/
#pagebtn:hover {
	text-align: center; 
	margin-top: 30px; 
	margin-bottom: 10px;
	color: #fff;
	padding: 4px 10px;
	border-radius: 4px;
	border: 2px solid #fff;
	transition: 0.3s;
	font-size: 15px;
	background-color: #3B0B5F;
}
/*예매확인창의 사진*/
/* .card-img-top { */
/* 		width: 300px; */
/* 		height: 350px; */
/* 		display: inline-block; */
/* 		float: right; */
/* 		margin-top: 20px; */
/* 		margin-right: 20px; */
/* 	} */

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
let adultPrice = 0;
let teenPrice = 0;
let elderyPrice = 0;
let allPrice = 0;

let adultNumber = 0;
let teenNumber = 0;
let elderyNumber = 0;
var allNumber = 0;

	function change_adult(e) {
        var btns = document.querySelectorAll(".select_adult");
        btns.forEach(function (btn, i) {
          if (e.currentTarget == btn) {
            btn.classList.add("active");
//             alert($(".select_adult.active").val());
            $("input[name=select_number_adult]").val($(".select_adult.active").val());
            adultNumber = $(".select_adult.active").val();
//            alert(adultNumber + "명");
            adultPrice = 15000 * adultNumber;
//             alert("성인: " + adultPrice + "원");
//             $(".adult_price_result").text(adultPrice);
            allPrice = adultPrice + teenPrice + elderyPrice;
            $(".price_result").text(allPrice);
            
          } else {
            btn.classList.remove("active");
          }
        });
   }
	
	function change_teen(e) {
        var btns = document.querySelectorAll(".select_teen");
        btns.forEach(function (btn, i) {
          if (e.currentTarget == btn) {
            btn.classList.add("active");
//             alert($(".select_teen.active").val());
            $("input[name=select_number_teen]").val($(".select_teen.active").val());
            teenNumber = $(".select_teen.active").val();
            teenPrice = 13000 * teenNumber;
            allPrice = adultPrice + teenPrice + elderyPrice;
            $(".price_result").text(allPrice);
          } else {
            btn.classList.remove("active");
          }
        });
   }
	
	function change_elderly(e) {
        var btns = document.querySelectorAll(".select_elderly");
        btns.forEach(function (btn, i) {
          if (e.currentTarget == btn) {
            btn.classList.add("active");
//             alert($(".select_elderly.active").val());
            $("input[name=select_number_elderly]").val($(".select_elderly.active").val());
            elderyNumber = $(".select_elderly.active").val();
            elderyPrice = 8000 * elderyNumber;
            allPrice = adultPrice + teenPrice + elderyPrice;
            $(".price_result").text(allPrice);
          } else {
            btn.classList.remove("active");
          }
        });
   }
	
//~~~~~~~혜연~~~~~~~~~~~~
//제이쿼리 시작부분
$(document).ready(function() {
        // 버튼 클릭 이벤트

        $("input[type='checkbox']").on("change", function() {
         
          // 체크한 항목을 담을 배열 선언
          const arr = [];
          // 체크한 항목만 배열안에 넣음
          var seat = $("input[name='seat']:checked");
         // 체크된 놈 표시할 반복문. 
         let che = 0;
         $(seat).each(function() {
             arr.push($(this).val());
             che += 1;
             //체크 된 놈 hidden으로 넘길 변수에 저장
            document.seatForm.selectedSeat.value=arr;
             
          });
         $("#result").text(arr);
         //만약 인원을 3명만 선택했을 경우
          if (che > 4){
                alert("좌석 4개만 선택해 주세요");
                return;
              }
         //지금 3명까지 선택하고 4명 선택할 경우 알림은 뜨는데 넘어가는 값은 4개임..
         
         
        });
        
        $("#seatFormId").submit(function() {
        	  
//       	 alert($("input[name=reserved_date]").val());
           if($(".price_result").text() == 0) {
               alert("인원을 선택하세요!");
              return false;
           } else if($("#result").text() == "") {
           	alert("좌석을 선택하세요!");
              return false;
           }
           
           allNumber = parseInt(adultNumber) + parseInt(teenNumber) + parseInt(elderyNumber);
//            alert("전체인원수 " + allNumber);
           var seatCount = parseInt(document.seatForm.selectedSeat.value.length / 3);
//            alert("좌석의 개수 " + seatCount);
           
           if(allNumber != seatCount) {
        	   alert("좌석과 인원의 수는 동일해야합니다!");
	           return false;   
           }
        });
        
        
      });
</script>
</head>
<body>
<c:if test="${empty sessionScope.sId }">
		<script type="text/javascript">
		 	alert("접근 불가합니다.");
		 	history.back();
		</script>
</c:if>
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
            <li>좌석선택</li>
          </ol>
        </div>
      </div>
    </section>
<!-- --------------------- 들고다니세요 ------------------------------------ -->
   <!-- 인원 선택 구간 -->
<!--    <h1>빠른예매</h1> -->
   
   <hr>
   
            <div class="select_view">
            관람인원선택
            
           <div class="select_seat">
            <div class="select_seat_number">
            <div class="select_seat_age">성인</div>
            
               <input type="button" class="select_adult" name="select_adult" value="0" onclick="change_adult(event)">
               <input type="button" class="select_adult" name="select_adult" value="1" onclick="change_adult(event)">
               <input type="button" class="select_adult" name="select_adult" value="2" onclick="change_adult(event)">
               <input type="button" class="select_adult" name="select_adult" value="3" onclick="change_adult(event)">
               <input type="button" class="select_adult" name="select_adult" value="4" onclick="change_adult(event)">
               
            </div>
         </div>
         &nbsp;&nbsp;&nbsp;
           <div class="select_seat">
            <div class="select_seat_number">
            <div class="select_seat_age">청소년</div>
            
               <input type="button" class="select_teen" name="select_teen" value="0" onclick="change_teen(event)">
               <input type="button" class="select_teen" name="select_teen" value="1" onclick="change_teen(event)">
               <input type="button" class="select_teen" name="select_teen" value="2" onclick="change_teen(event)">
               <input type="button" class="select_teen" name="select_teen" value="3" onclick="change_teen(event)">
               <input type="button" class="select_teen" name="select_teen" value="4" onclick="change_teen(event)">
               
            </div>
         </div>
         &nbsp;&nbsp;&nbsp;
           <div class="select_seat">
            <div class="select_seat_number">
            <div class="select_seat_age">우대</div>
            
               <input type="button" class="select_elderly" name="select_elderly" value="0" onclick="change_elderly(event)">
               <input type="button" class="select_elderly" name="select_elderly" value="1" onclick="change_elderly(event)">
               <input type="button" class="select_elderly" name="select_elderly" value="2" onclick="change_elderly(event)">
               <input type="button" class="select_elderly" name="select_elderly" value="3" onclick="change_elderly(event)">
               <input type="button" class="select_elderly" name="select_elderly" value="4" onclick="change_elderly(event)">
               
            </div>
         </div>
            
         </div>   
            
            <br>
            <br>
            
    <div class="reserve-container">
        
        <div class="seat-part">
            <div class="reserve-title">좌석 선택</div>
            <div class="reserve-date">
            
            <div class="seat-container">

            <div class="seat-wrapper">
               <div class="screen-view-wrapper">
                  <div class="screen-view">SCREEN</div>
<!-- ========================================================================================= -->                  
<!-- 혜연 추가한곳 -->
   <form action="ReservePayment.mv" method="post" name="seatForm" id="seatFormId">
		<c:set var="selectedSeatList" value="${selectedSeatList}"></c:set>	
		<div id="seatSelectWrapper">
		<div> <!-- 1열 1~4번 반복문 -->
		<span class="lineInfo">
		A열 → 
		</span>
			<c:forEach var="seatNo" begin="101" end="104" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
						${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 1열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="105" end="108" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 1열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="109" end="110" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 choose 안에 주석쓰니까 오류남ㅜㅜ -->
					<c:choose>
					    <c:when test="${seatNo eq 109}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div> <!-- 1열 끝  -->
		
		<div> <!-- 2열 1~4번 반복문 -->
		<span class="lineInfo">
		B열 → 
		</span>
			<c:forEach var="seatNo" begin="201" end="204" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 2열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="205" end="208" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 2열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="209" end="210" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 -->
					<c:choose>
					    <c:when test="${seatNo eq 209}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div><!-- 2열 끝  -->
		
		<div> <!-- 3열 1~4번 반복문 -->
		<span class="lineInfo">
		C열 → 
		</span>
			<c:forEach var="seatNo" begin="301" end="304" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
		</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 3열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="305" end="308" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 3열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="309" end="310" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 -->
					<c:choose>
					    <c:when test="${seatNo eq 309}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div> <!-- 3열 끝  -->
		
		<div> <!-- 4열 1~4번 반복문 -->
		<span class="lineInfo">
		D열 → 
		</span>
			<c:forEach var="seatNo" begin="401" end="404" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 4열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="405" end="408" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 4열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="409" end="410" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 -->
					<c:choose>
					    <c:when test="${seatNo eq 409}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div> <!-- 4열 끝  -->
		
		<div> <!-- 5열 1~4번 반복문 -->
		<span class="lineInfo">
		E열 → 
		</span>
			<c:forEach var="seatNo" begin="501" end="504" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 5열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="505" end="508" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 5열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="509" end="510" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 -->
					<c:choose>
					    <c:when test="${seatNo eq 509}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div> <!-- 5열 끝  -->
		
		<div> <!-- 6열 1~4번 반복문 -->
		<span class="lineInfo">
		F열 → 
		</span>
			<c:forEach var="seatNo" begin="601" end="604" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 6열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="605" end="608" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 6열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="609" end="610" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 -->
					<c:choose>
					    <c:when test="${seatNo eq 609}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div> <!-- 6열 끝  -->
		
		<div> <!-- 7열 1~4번 반복문 -->
		<span class="lineInfo">
		G열 → 
		</span>
			<c:forEach var="seatNo" begin="701" end="704" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 7열 5~8번 반복문 -->
			<c:forEach var="seatNo" begin="705" end="708" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					${fn:substring(seatNo,2,3) } 
				</label>
			</c:forEach>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 7열 9, 10번 반복문 -->
			<c:forEach var="seatNo" begin="709" end="710" step="1">
				<c:choose>
					<c:when test="${fn:contains(selectedSeatList, seatNo)}">
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }" disabled="disabled">
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="seat" value="${seatNo }" id="${seatNo }">
					</c:otherwise>
				</c:choose>
				<label for="${seatNo }" class="line">
					<!-- 좌석 번호가 9일 때, 10일 떄 판별해서 9일 때 한자리만 출력 10일 때 두자리 출력 -->
					<c:choose>
					    <c:when test="${seatNo eq 709}">
							${fn:substring(seatNo,2,3) } 
					    </c:when>
					    <c:otherwise>
							${fn:substring(seatNo,1,3) }
					    </c:otherwise>
					</c:choose>
				</label>
			</c:forEach>
		</div> <!-- 7열 끝  -->
		
		</div><!-- seatSelectWrapper 끝 -->
      
   
<!-- 혜연 추가한곳 끝 -->
<!-- ========================================================================================= -->                  
               </div>
            </div>
         </div>
            </div>
        </div>
<!--         </form> -->
        <div class="selected-part">
            <div class="reserve-title">예매 확인</div>
             <div class="selected-list">
			     영화 제목 : ${param.movie_title }<br>
			     상영 날짜 : ${param.reserved_date }<br>
			     상영 시간 : ${param.selected_time }<br>
	            <p>선택한 좌석 :<span id="result"></span></p>
           
            총결제금액: <span class="price_result">0</span>원
	      <input type="hidden" name="selectedSeat" >
	<!--       session id -->
	      <input type="hidden" name="sId" value="${sessionScope.sId }">
	<!--       movie_title -->
	      <input type="hidden" name="movie_title" value="${param.movie_title }">
	<!--       reserved_date -->
	      <input type="hidden" name="reserved_date" value="${param.reserved_date }">
	      
	      <input type="hidden" name="selected_time" value="${param.selected_time }">
            <input type="hidden" name="select_number_adult" value="0">
            <input type="hidden" name="select_number_teen" value="0">
            <input type="hidden" name="select_number_elderly" value="0">
            <input type="hidden" name="theater_idx" value="${theater_idx }">
            </div>
           <input type="submit" value="결제하기" class="movie-date-wrapper" id="pagebtn">
        </div>
    </form>
    </div>
   
<footer id="footer">
      		<jsp:include page="../inc/bottom.jsp"></jsp:include>
      </footer>
    </body>
</html>
