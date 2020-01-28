<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63af563efb4a5b900f7a504eaa67fd82"></script>
</head>
<body>
	<a href="./board/board list.do">게시판</a>
	<input type="button" value="회원가입" onclick="location.href='./member/memberJoinForm.do'">
	
	<c:if test = "${ member == null }">
		<input type="button" value = "로그인" onclick = "location.href='./member/login_form.do'">
	</c:if>	
	<c:if test = "${ member != null }">
		<a href = "./member/mypage.do">마이페이지(${ member.id })</a>
		<input type="button" value = "로그아웃" onclick = "location.href='./member/logout.do'">
	</c:if>
	<div id="map" style="width:500px;height:400px;"></div>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(35.17944,129.07556), //지도의 중심좌표.
			level:10 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도
	</script>
</body>
</html>