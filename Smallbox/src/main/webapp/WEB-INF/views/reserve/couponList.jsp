<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/style.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	function confirmUse(coupon_rate, coupon_idx) {
		let result = confirm("쿠폰을 사용하시겠습니까?");
		if(result) {
			$("#coupon_rate").val(coupon_rate);
			var cRate = $("#coupon_rate").val();;
			var priceBeforeDc = opener.document.getElementById("priceBeforeDc").value;
// 			alert("제이쿼리로 불러온 할인율 " + cRate);
// 			alert("자스로 불러온 금액 " + priceBeforeDc);
			
			var dcPrice = cRate * 0.01 * priceBeforeDc;
// 			alert("dcPrice : " + dcPrice);
			
			document.getElementById("dcPrice").innerHTML = dcPrice;
			
			var totalPrice = priceBeforeDc - dcPrice;
			document.getElementById("price").innerHTML = totalPrice;
// 			alert("total Price : " + totalPrice);
			
			window.opener.$("#totalPrice").val(totalPrice);
			var win = window.opener.$("#totalPrice").val();
// 			alert("win : " + win);
			
			window.opener.$('input[name=res_price]').val(totalPrice);
			var inputpr = window.opener.$('input[name=res_price]').val();
// 			alert("inp : " + inputpr)
			
			window.opener.document.getElementById("totalPrice").innerHTML = totalPrice;
			
			
			$("#coupon_idx").val(coupon_idx);
			var cIdx = $("#coupon_idx").val();;
// 			alert("제이쿼리로 불러온 쿠폰번호  " + cIdx);
			
			window.opener.$('input[name=coupon_idx]').val(coupon_idx);
			var opennerCpIdx = window.opener.$('input[name=coupon_idx]').val();
// 			alert("opennerCpIdx : " + opennerCpIdx)
			
// 			window.opener.document.getElementById("couponIdx").innerHTML = cIdx;
			
			window.close();
		
		} // ~~~~confirm use end~~~~
	
		//=====0110 추가//
	}
		
		function notUse() {
			var priceBeforeDc = opener.document.getElementById("priceBeforeDc").value;
			
			document.getElementById("dcPrice").innerHTML = 0;
// 			alert("안쿠폰 일 때 dcPrice : " + dcPrice);
			
			var totalPrice = priceBeforeDc;
			document.getElementById("price").innerHTML = totalPrice;
// 			alert("안 쿠폰 일 때 total Price : " + totalPrice);
			
			window.opener.$('input[name=res_price]').val(totalPrice);
			var inputpr = window.opener.$('input[name=res_price]').val();
// 			alert("inp : " + inputpr)
			
			window.opener.document.getElementById("totalPrice").innerHTML = totalPrice;
			
			window.close();
		} // not use end
		
</script>
<style type="text/css">
* {
margin: 0;
padding: 0;
}

table {
    margin-left:auto; 
    margin-right:auto;
    text-align: center;
    border-collapse: collapse;
}
	
tr {
	border-bottom: 1px dashed gray;
   
}

td {
	padding: 3px 15px;
}
	

.usebtn {
	text-align: center; 
	color: #3B0B5F;
	border-radius: 4px;
	border: 2px solid #3B0B5F;
	background-color: white;
}

.usebtn:hover {
	text-align: center; 
	color: #fff;
	border-radius: 4px;
	border: 2px solid #3B0B5F;
	background-color: #3B0B5F;
}
header {
	background-color: #3B0B5F;
	height: 30px;
	margin-bottom: 5px;
	color: #fff;
	line-height: 30px;
	padding-left: 5px;
	
}

footer {
	color: #fff;
	height: 40px;
	background-color: #3B0B5F;
	margin-top: 10px;
	padding: 5px;
}
</style>
</head>
<body>
<header>
	보유 쿠폰
</header>
<table>
	<tr>
		<td>쿠폰 유형</td>
		<td>할인율</td>
		<td>쿠폰 만료일</td>
		<td></td>
	</tr>
<c:forEach var="coupon" items="${couponList }">
	<c:set var="coupon_idx" value="${coupon.coupon_idx }" />
	<c:set var="coupon_rate" value="${coupon.coupon_rate }" />
	<tr class="cpTableLine">
		<td>${coupon.coupon_type }</td>
		<td>${coupon_rate }</td>
		<td>${coupon.coupon_end_date }</td>
		<td>
			<input type="hidden" name="coupon_rate" id="coupon_rate" value ="${coupon_rate }">
			<input type="hidden" name="coupon_idx" id="coupon_idx" value ="${coupon_idx }">
			<input type="button" value="사용" class="usebtn" onclick="confirmUse('${coupon_rate }', '${coupon_idx }')">
		</td>
	</tr>
</c:forEach>
</table>
<!-- 사용 안하는 버튼 만들기 
만약 쿠폰 사용하지 않기 버튼을 누르면 함수 호출 -->
<input type="button" class="usebtn" style="margin-top: 5px; margin-left: 5px;" value="쿠폰 사용하지 않기" onclick="notUse()">

 <!-- 금액 표시 영역 -->
<footer>
할인 금액 : <span id="dcPrice"></span> 원 <br>
최종 결제 금액 : <span id="price"></span> 원 <br>
</footer>

</body>

</html>