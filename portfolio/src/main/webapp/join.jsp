<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/join.css?v=1"></link>
<title></title>
</head>
<body>
	<div class="joinbox">
		<div class="join_tag">HOME > 회원가입 > 정보입력</div>
		
		<ul class="join_ul">
			<li>회원가입</li>
			
			<li>03 가입완료</li>
			<li></li>
			<li>02 정보입력</li>
			<li></li>
			<li>01 약관동의</li>
		</ul>
		
		<div class="join_tep">기본정보</div>
		
		<div class="join_ulcss">
			<ul>
				<li>아이디</li>
				<li><input type="text"></li>
			</ul>
			<ul>
				<li>비밀번호</li>
				<li><input type="text"></li>
			</ul>
			<ul>
				<li>비밀번호 확인</li>
				<li><input type="text"></li>
			</ul>
			<ul>
				<li>이름</li>
				<li><input type="text"></li>
			</ul>
			<ul>
				<li>이메일</li>
				<li>
					<input type="text">
					<select>
						<option value="">직접입력</option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				<a><input type="checkbox">정보/이벤트 메일 수신에 동의합니다.</a>
				</li>
			</ul>
			<ul>
				<li>휴대폰번호</li>
				<li>
					<input type="text" placeholder="-없이 입력하세요.">
				<a><input type="checkbox">정보/이벤트 SMS 수신에 동의합니다.</a>
				</li>
			</ul>
			
			<ul>
				<li>전화번호</li>
				<li><input type="text" placeholder="-없이 입력하세요."></li>
			</ul>
			
			<ul>
				<li>주소</li>
				<li>
					<a><input type="text"><input type="button" value="우편번호검색"></a>
					<a><input type="text"></a>
					<a><input type="text"></a>
				</li>
			</ul>
			
			<div class="join_btn">
				<input type="button" value="취소">
				<input type="button" value="회원가입">
			</div>
		</div>
	</div>
</body>
</html>