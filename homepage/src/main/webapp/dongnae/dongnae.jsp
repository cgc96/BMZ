
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
			location.href='../dongnae/write';
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
<%@ include file = "../header.jsp" %>
</head>

<body>



<div class="jumbotron">
  <h1 class="display-3">동래 지도자리</h1>
  <p class="lead">준희 화이팅  (,${ login.id }, ${ member.id }) </p>
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
                 	 <th style="width: 60px">추천</th>
                 	 <th style="width: 80px">비추천</th>
                 	                  	 
                   </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${boards}" var="board">
                  <tr>
                     <td>${board.articleNo}</td>
                     <%--<td><a href="../board/read?articleNo=${board.articleNo}">${board.title}</a></td> --%>
                     <td>
                     	<a href="./read${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
                     <td>${board.writer} </td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value ="${board.regDate}"/></td>
                     <td><span class="badge bg-aqua">${board.viewCnt}</span></td>
                     <td><span class="badge bg-aqua">${board.likes}</span></td>
                     <td><span class="badge bg-aqua">${board.dislikes}</span></td>
                     
                  </tr>
                  </c:forEach>
                  </tbody>
             </table>
       </div>
       <div class ="box-footer">
       	<div class ="text-center">
       		<ul class="pagination">
       			<c:if test="${pageMaker.prev}" >
       				<%--<li><a href="./listPaging?page=${pageMaker.startPage - 1}">이전</a></li> --%>
					<li><a href="./dongnae${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
					<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ' ' }"/>>
						<%-- <a href="./listPaging?page=${idx}">${idx}</a>--%>
						<a href="./dongnae${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>					
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<%--<li><a href="./listPaging?page=${pageMaker.endPage + 1}">다음</a></li> --%>
					<li><a href="./dongnae${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
       		</ul>
       	</div>
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