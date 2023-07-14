<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 예약</title>
</head>
<body>
	<form action="user_booking_insert.jsp"  name="bookingForm"  method="post">
	<div id="container">
		<h3>숙소 예약</h3>
		 
		<div>
			<select name="room">
				<option disabled selected hidden>선택</option>
                <option value="room1">숙소1</option>
                <option value="room2">숙소2</option>
                <option value="room3">숙소3</option>
                <option value="room4">숙소4</option>
         </select>
		</div>
		<div><input type="text" name="uName" placeholder="이름"></div>
		<div><input type="text" name="phone" placeholder="휴대전화번호"></div>
		<div><input type="text" name="birth" placeholder="생년월일"></div>
		<div>결제방식
			<select id="payment" name="payment">
				<option disabled selected hidden>선택</option>
				<option value="카드">신용카드</option>
				<option value="카카오페이">카카오페이</option>
				<option value="무통장">무통장입금</option>
			</select>
		</div>
		<div>인원
			<select name="person_num">
				<option disabled selected hidden>선택</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
         	</select>
		</div>
		<div>예약날짜</div>
		<div><input type="date" name="checkIn">~<input type="date" name="checkOut"></div>
		<div><input type="button" onclick="booking()" value="예약하기" ></div>
	</div>
	</form>
</body>
</html>
<script>
	function booking(){
		var form = document.bookingForm;
		if(form.uName.value == "" || form.uName.value == undefined){
			alert("이름은 필수값입니다.");
			form.uName.focus();
			return;
		}
		if(form.phone.value == "" || form.phone.value == undefined){
			alert("휴대전화번호는 필수값입니다.");
			form.phone.focus();
			return;
		}
		if(form.birth.value == "" || form.birth.value == undefined){
			alert("생년월일은 필수값입니다.");
			form.birth.focus();
			return;
		}
		
		var payment = document.getElementById("payment");
		var value = payment.value;
		if(value == ""){
			alert("결제방식을 선택해주세요.");
		}
		
		if(form.checkIn.value == "" || form.checkIn.value == undefined){
			alert("체크인 날짜를 선택해주세요.");
			form.checkIn.focus();
			return;
		}
		if(form.checkOut.value == "" || form.checkOut.value == undefined){
			alert("체크아웃 날짜를 선택해주세요.");
			form.checkOut.focus();
			return;
		}
		alert("예약하시겠습니까?")
		form.submit();
	}
	
</script>