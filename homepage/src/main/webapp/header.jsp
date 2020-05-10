<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.Date" %>
<%@ page import="javax.servlet.http.HttpServlet"%>
<%@ page import = "org.justking.homepage.member.db.MemberDTO" %>


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
        <a class="nav-link" href="/homepage/Gu/gangseo/gangseo">강서구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/geumjeong/geumjeong">금정구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/namgu/namgu">남구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/donggu/donggu">동구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/dongnae/dongnae">동래구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/busanjin/busanjin">부산진구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/bukgu/bukgu">북구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/sasang/sasang">사상구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/saha/saha">사하구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/seogu/seogu">서구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/suyeong/suyeong">수영구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/yeonje/yeonje">연제구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/yeongdo/yeongdo">영도구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/junggu/junggu">중구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/haeundae/haeundae">해운대구</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/homepage/Gu/gijang/gijang">기장군</a>
      </li>
    </ul>
		<% 
		
    	HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("member") != null){
			MemberDTO member = (MemberDTO)session.getAttribute("member"); 
			if(member != null){%>
				<%= member.getId() %>
				<input type="button" class="btn btn-danger" value = "마이페이지" onclick = "location.href='/homepage/member/mypage.do'">
				<input type="button" class="btn btn-danger" value = "로그아웃"  onclick = "location.href='/homepage/member/logout.do'">
				<% 
			}
		}
		else{%>
			<input type="button" class="btn btn-danger" value = "회원가입" onclick = "location.href = '/homepage/member/memberJoinForm.do' ">
			<input type="button" class="btn btn-danger" value = "로그인"  onclick = "location.href='/homepage/member/login_form.do'">
		
		<% }%>
		


  </div>
</nav>