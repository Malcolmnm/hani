<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리</title>
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/shop_setup.css?v=2">
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section style="width: 1000px; height: auto;margin: auto;">
	<div class="shopdiv">
	<!-- 배너관리 -->
	<div class="shopsub"><a>■</a> 쇼핑몰 메인 배너관리</div>
	<ul class="shopul">
		<li>메인 배너 등록</li>
		<li><input type="text"></li>
		<li>배너1 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>배너2 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>배너3 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>배너4 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	
	<div class="shopbtn">
		<input type="button" value="배너 번경">
	</div>
	
	<!-- 쇼핑몰 팝업 -->
	<div class="shopsub"><a>■</a> 쇼핑몰 메인 팝업관리</div>
	<ul class="shopul">
		<li>메인 팝업 등록</li>
		<li><input type="text"></li>
		<li>팝업 <a>※ 팝업 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li class="popset"><input type="checkbox">팝업창 사용</li>
		<li></li>
	</ul>
	
	<div class="shopbtn">
		<input type="button" value="팝업창 변경">
	</div>
	<!-- 쇼핑몰 AD 배너 -->
	
	<div class="shopsub"><a>■</a> 쇼핑몰 AD 배너</div>
	<ul class="shopul">
		<li>AD 배너 등록</li>
		<li><input type="text"></li>
		<li>AD 배너1 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>AD 배너2 <a>※ 배너 이미지 URL을 입력하세요.</a></li>
	</ul>
	<ul class="shopul">
		<li></li>
		<li><input type="text"></li>
		<li>링크 URL</li>
	</ul>
	
	<div class="shopbtn">
		<input type="button" value="AD 배너 변경">
	</div>
	</div>
</section>
<section style="height: 100px;">
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>


</body>
</html>