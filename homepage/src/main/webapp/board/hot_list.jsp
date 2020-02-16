
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
                  <c:forEach items="${hotboards}" var="hotboard">
                  <tr>
                     <td>${hotboard.hot_articleNo}</td>
                     <%--<td><a href="../board/read?articleNo=${board.articleNo}">${board.title}</a></td> --%>
                     <td>
                     	<a href="./read${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${hotboard.hot_articleNo}">${hotboard.hot_title}</a>
                     <td>${hotboard.hot_writer} </td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd a HH:mm" value ="${hotboard.hot_regDate}"/></td>
                     <td><span class="badge bg-aqua">${hotboard.hot_viewCnt}</span></td>
                     <td><span class="badge bg-aqua">${hotboard.hot_likes}</span></td>
                     <td><span class="badge bg-aqua">${hotboard.hot_dislikes}</span></td>
                     
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
					<li><a href="./listPaging${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="idx">
					<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ' ' }"/>>
						<%-- <a href="./listPaging?page=${idx}">${idx}</a>--%>
						<a href="./listPaging${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>					
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<%--<li><a href="./listPaging?page=${pageMaker.endPage + 1}">다음</a></li> --%>
					<li><a href="./listPaging${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
       		</ul>
       	</div>
       </div>

  </div>
</div>

</body>

</html>