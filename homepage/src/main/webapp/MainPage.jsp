<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">
    
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="/homepage/MainPage">부산 맛집 지도</a>
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
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<div class="jumbotron">
  <h1 class="display-2">지도자리</h1>
  <p class="lead">준희 화이팅 (${ member.id }) </p>
</div>
	<div class ="container">
		<c:if test = "${ member == null }">
			<input type="button" value="회원가입" onclick="location.href='./member/memberJoinForm'">
		</c:if>	
		
		<c:if test = "${ member == null }">
			<input type="button" value = "로그인 " onclick = "location.href='./member/login_form'">
		</c:if>	
		
		<c:if test = "${ member != null }">
			<a href = "./mypage.do">마이페이지(${ member.id })</a>
			<input type="button" value = "로그아웃" onclick = "location.href='./logout'">
		</c:if>
		
		</div>
 <div class="container">
      <div class="row">
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
             	 사하구
            </div>
            <div class="card-body">
              <p class="card-text">사하구.jsp내용 들고옵시다. </p>
              <p class="card-text">사하구.jsp내용 들고옵시다. </p>
              <p class="card-text">사하구.jsp내용 들고옵시다. </p>
              <p class="card-text">사하구.jsp내용 들고옵시다. </p>
              <p class="card-text">사하구.jsp내용 들고옵시다. </p>
                            
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
             	 부산진구
            </div>
            <div class="card-body">
              <p class="card-text">부산진구.jsp내용 들고옵시다. </p>
              <p class="card-text">부산진구.jsp내용 들고옵시다. </p>
              <p class="card-text">부산진구.jsp내용 들고옵시다. </p>
              <p class="card-text">부산진구.jsp내용 들고옵시다. </p>
              <p class="card-text">부산진구.jsp내용 들고옵시다. </p>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
            	  해운대구
            </div>
            <div class="card-body">
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
            </div>
          </div>
        </div>
        <p></p>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
              	빵구
            </div>
            <div class="card-body">
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
              <p class="card-text">해운대구.jsp내용 들고옵시다. </p>
            </div>
          </div>
        </div>
        
      </div>
</div>



<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://js/bootstrap.js"></script>
</body>

</html>