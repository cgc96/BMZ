
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">


<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	$(function(){
		$("#writeBtn").click(function(){
			location.href='../board/write.do';
		})
	})
</script>
<script>
	var result ="$msg";
	if(result == "regSuccess") {
		alert("게시글 등록이 완료되었습니다.");
	} else if(result == "modSuccess"){
		alert("게시글 수정이 완료되었습니다.");
	} else if(result == "delSuccess"){
		alert("게시글 삭제가 완료되었습니다.");
	}
</script>
</head>

<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="../MainPage.jsp">부산 맛집 지도</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../board/list">강서구<span class="sr-only">(current)</span></a>
      
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
  <h1 class="display-3">강서구 지도자리</h1>
  <p class="lead">준희 화이팅 </p>
</div>

<div class="col-lg-12">
  <div class="box box-primary">
      <div class="box-header with-border">
          <h3 class="box-title">게시글 목록</h3>
      </div>
         <div class="box-body">
               <%--게시글 목록 영역--%>
                <table class="table table-bordered">
                  <thead>
                   <tr>
                     <th style="width: 60px">번호</th>
                 	 <th>제목</th>                 	 
                	 <th style="width: 150px">작성자</th>
                 	 <th style="width: 200px">작성시간</th>
                 	 <th style="width: 60px">조회</th>
                   </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${boards}" var="board">
                  <tr>
                     <td><a href="../board/read?articleNo=${board.articleNo}">${board.articleNo}</a></td>
                     <td><a href="../board/read?articleNo=${board.articleNo}">${board.title}</a></td>
                     <td>${board.writer} </td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value ="${board.regDate}"/></td>
                     <td>${board.viewCnt}</td>
                  </tr>
                  </c:forEach>
                  </tbody>
             </table>
       </div>
    <div class="box-footer">
       <div class="pull-right">
           <button type="button" class="btn btn-success btn-flat" id="writeBtn">
               <i class="fa fa-edit"></i> 글쓰기
           </button>
       </div>
    
  	</div>
  </div>
</div>

</body>

</html>