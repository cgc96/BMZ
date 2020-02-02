<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	$(function(){
		$("#listbtn").click(function(){
			location.href='../board/listPaging';
		})
	})
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
        <a class="nav-link" href="../board/listPaging">강서구<span class="sr-only">(current)</span></a>
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
      <form role="form" id ="writeForm" method="post" action ="../board/write">
      	<div class="box box-primary">
      		<div class="box-header with-border">
      			<h3 class="box-title"> 게시글작성</h3>
      		</div>
   			<div class="box-body">
   				<div class="form-group">
   					<label for="title"> 제목</label>
      				<input class="form-control" id = "title" name="title" placeholder="제목을 입력해주세요">
      			</div>
      			<div class="form-group">
                	<label for="content">내용</label>
                	<textarea class="form-control" name="content" id="content" placeholder="내용 입력.." rows="30"
                          style="resize: none;"></textarea>
            	</div>
            	<div class="form-group">
                	<label for="writer">작성자</label>
                	<input class="form-control" name="writer" id="writer" placeholder="작성자 입력..">
            	</div>
      		</div>
      			
      		<div class="box-footer">
      			<button type="button" class="btn btn-primary" id="listbtn"><i class="fa fa-list"></i> 목록</button>
            	<div class="pull-right">
        			<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
        		    <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 작성</button>
            
            	</div>
        	</div>
      	</div>
      </form>
</div>

</body>

</html>