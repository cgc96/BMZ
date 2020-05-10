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
			location.href='../yeongdo/yeongdo';
		})
	})
</script>

 <jsp:include page = "../../header.jsp" /> 
 
</head>

<div class="jumbotron">
  <h1 class="display-3">yeongdo지도자리</h1>
  <p class="lead">준희 화이팅 </p>
</div>

 <div class="col-lg-12">
      <form role="form" id ="writeForm" method="post" action ="../yeongdo/write">
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
                	<input class="form-control" name="writer" id="writer" readonly value = "${ member.id }" >
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