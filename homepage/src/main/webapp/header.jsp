<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">
    
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/homepage/home.jsp">부산 맛집 지도</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/homepage/board/listPaging">강서구<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">금정구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">남구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">동구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">동래구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">부산진구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">북구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">사상구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">사하구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">서구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">수영구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">연제구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">영도구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">중구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">해운대구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">기장군</a>
      </li>
    </ul>
		<%
    	HttpSession session = request.getSession(false);
		//Object member = session.getAttribute("member"); 
		if(session != null && session.getAttribute("member") != null){%>
			<input type="button" class="btn btn-danger" value = "마이페이지" onclick = "location.href='./member/mypage.do'">
			<input type="button" class="btn btn-danger" value = "로그아웃"  onclick = "location.href='./member/logout.do'">
		<% 
		}
		else{%>
			<input type="button" class="btn btn-danger" value = "회원가입" onclick = "location.href = './member/memberJoinForm.do' ">
			<input type="button" class="btn btn-danger" value = "로그인"  onclick = "location.href='./member/login_form.do'">
		
		<% }%>
		
		<!--  
		<c:if test="${ member == null }">
			<input type = "button" class="btn btn-danger" value = "회원가입" onclick = "location.href = './member/memberJoinForm.do' ">
			<input type="button" class="btn btn-danger" value = "로그인 " onclick = "location.href='./member/login_form.do'">
		</c:if>	
		
		<c:if test="${ member != null}">
			<a href = "./member/mypage.do">마이페이지(${ member.id })</a>
			<input type="button" class="btn btn-danger" value = "로그아웃" onclick = "location.href='./member/logout.do'">
		</c:if>
		-->


  </div>
</nav>