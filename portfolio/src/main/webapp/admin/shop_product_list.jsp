<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="app" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/default.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/font.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/shop_product_list.css?v=1">
<title>상품리스트</title>
</head>
<body>
<header>
<%@ include file="./admin_header.jsp" %>
</header>
<section>
<%@ include file="./admin_menu.jsp" %>
</section>
<section class="smbox">
	<div class="stop"><a style="color:red;">■</a> 상품관리 페이지</div>
	<div class="stop2">
		<select>
			<option></option>
			<option></option>
			<option></option>
		</select>
		<input type="text">
		<input type="button" value="검색">
	</div>
	<ul class="stopul">
		<li><input type="checkbox" id="checkall" onclick="allck()"></li>
		<li>상품코드</li>
		<li>이미지</li>
		<li>상품명</li>
		<li>대 카테고리</li>
		<li>판매가격</li>
		<li>할인가격</li>
		<li>할인율</li>
		<li>재고현황</li>
		<li>판매유/무</li>
		<li>관리</li>
	</ul>
	<ul class="snoul" id="noul">
		<li>등록된 회원이 없습니다.</li>
	</ul>
<form id="delsul">
	<ul class="stopul sacul">
		<li><input type="checkbox" id="ck${w}" onclick="ckk(${w})" value="${top['mid']}"></li>
		<li>${top["mid"]}</li>
		<li>${top["mnm"]}</li>
		<li>${top["mcel"]}</li>
		<li>${top["mtel"]}</li>
		<li>${top["mlevel"]}</li>
		<li>${top["mpoint"]}</li>
		<li>${top["mcalldate"]}</li>
		<li>${top["mindate"]}</li>
		<li>${top["memag"]}</li>
		<li><input type="button" value="수정" onclick="memshi(${top['midx']})"></li>
	</ul>
	<input type="hidden" id="sul${w}" name="sul${w}">
</form>
	<div class="snextbox">
		<input type="button" onclick="pageing()" value="">
	</div>
	<input type="button" value="상품등록" class="sdelbtn2" onclick="delbtn()">
	<input type="button" value="선택삭제" class="sdelbtn" onclick="delbtn()">
</section>
<section style="height: 800px;">
	
</section>
<footer>
<%@ include file="./admin_footer.jsp" %>
</footer>
</body>
<script src="./js/member_list.js?v=2"></script>
<script>
	if("${ml[0]['mid']}" != ""){
		document.getElementById("noul").style.display = "none";
	}
	else{
		document.getElementById("noul").style.display = "block";
	}
	
	function allck(){
		var checkall = document.getElementById("checkall");
		var ww = ${w+1};
		if(checkall.checked == true){
			while(ww <= ${w+4}){
				var ck = document.getElementById("ck"+ ww);
				var sul = document.getElementById("sul"+ww);
				if(ck != null){
					sul.value = ck.value;
					ck.checked = true;
				}
				ww++;
			}
		}
		else{
			while(ww <= ${w+4}){
				var ck = document.getElementById("ck"+ ww);
				var sul = document.getElementById("sul"+ww);
				if(ck != null){
					sul.value = "";
					ck.checked = false;
				}
				ww++;
			}
		}
	}
	function pageing(no){
		location.href = "./member_list.do?page=" + no;
	}
	
	function ckk(no){
		var tec = document.getElementById("ck"+ no);
		var tic = document.getElementById("sul"+ no);
		if(tec.checked == true){
			tic.value = tec.value;
		}
		else if(tec.checked == false){
			tic.value = "";
		}
	}

	
	function delbtn(){
		var ww = ${w+1};
		var count = 0;
		while(ww <= ${w+4}){
			var ck = document.getElementById("ck"+ ww);
			if(ck != null){
				if(document.getElementById("sul"+ ww).value != ""){
					count++;
				}
			}
			ww++;
		}
		if(count == 0){
			alert("삭제하실 계정을 선택해주세요.");
		}
		else{
			if(confirm("선택하신 계정을 삭제하시겠습니까?") == true){
				alert("삭제되었습니다.");
				delsul.method = "post";
				delsul.action = "./member_list.do";
				delsul.submit();
			}
			else{
				alert("취소되었습니다.");
			}
		}
	}
	function memshi(no){
		var url = "./member_modify.do?midx="+ no;
        var option = "width = 550, height = 450"
        window.open(url ,"", option);
	}

</script>
</html>