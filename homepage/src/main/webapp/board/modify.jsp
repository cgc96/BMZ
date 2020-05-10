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

	$(document).ready(function () {
		
		// form 선택자
	    var formObj = $("form[role='form']");
	    console.log(formObj);
	    
	    // 수정버튼 클릭시
	    $(".modBtn").on("click", function () {
	        formObj.submit();
	    });
	    
	    // 취소 버튼 클릭시
	    $(".cancelBtn").on("click", function () {
	        history.go(-1);
	    });
	    
	    // 목록 버튼 클릭시
	    $(".listBtn").on("click", function () {
	        self.location = "../board/listPaging?page=${criteria.page}&criteria.perPageNum";
	        
	    });
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
      <form role="form" id ="writeForm" method="post" action ="${path}/board/modify">
      	<div class="box box-primary">
      		<div class="box-header with-border">
      			<h3 class="box-title"> 게시글 작성</h3>
      		</div>
   			<div class="box-body">
   				<input type="hidden" name="articleNo" value="${board.articleNo}">
   				<div class="form-group">
   					<label for="title"> 제목</label>
      				<input class="form-control" id = "title" name="title" placeholder="제목을 입력해주세요">
      			</div>
      			<div class="form-group">
                	<label for="content">내용</label>
                	<textarea class="form-control" name="content" id="content" placeholder="내용 입력.." rows="30"
                          style="resize: none;">${board.content}</textarea>
            	</div>
            	<div class="form-group">
                	<label for="writer">작성자</label>
                	<input class="form-control" name="writer" id="writer" value="${board.writer}" readonly>
            	</div>
      		</div>
      			
      		<div class="box-footer">
      			<form role="form" method="post">
       				<input type="hidden" name="articleNo" value="${board.articleNo}">
      	 			<input type="hidden" name="page" value="${criteria.page }">
    	   			<input type="hidden" name="perPageNum" value="${criteria.perPageNum }">
       		
				</form>
      			<button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
            	<div class="pull-right">
        			<button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
        		    <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
            
            	</div>
        	</div>
      	</div>
      </form>
</div>


</body>

</html>