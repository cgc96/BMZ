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
	        self.location = "../suyeong/suyeong?page=${criteria.page}&criteria.perPageNum";
	        
	    });
	})
	
</script>
 <jsp:include page = "../../header.jsp" /> 

</head>

<body>


<div class="jumbotron">
  <h1 class="display-3">suyeong 지도자리</h1>
  <p class="lead">준희 화이팅 </p>
</div>

 <div class="col-lg-12">
      <form role="form" id ="writeForm" method="post" action ="${path}/suyeong/modify">
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