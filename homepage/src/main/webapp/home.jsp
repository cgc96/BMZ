<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">

 <jsp:include page = "./header.jsp" /> 

</head>

<body>

            
<div class="container">
      <div class="row">
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 사하구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${saha_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/saha/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 부산진구
            </div>
		 <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${busanjin_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		
	            		 <a href="./Gu/busanjin/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 	
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 해운대구
            </div>
		 <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${haeundae_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/haeundae/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <p></p>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 동구
            </div>
		 <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${donggu_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/donggu/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 북구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${bukgu_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/bukgu/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 동래구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${dongnae_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/haeundae/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 강서구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${gangseo_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/gangseo/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 금정구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
	         <tbody>
	         
		         <c:forEach items="${geumjeong_boards}" var="board">
		         	 <tr>
		            	<td>${board.articleNo}</td>
		            	<td>
		            		 <a href="./Gu/geumjeong/read?&articleNo=${board.articleNo}">${board.title}</a>
		                 </td>
		                <td>${board.viewCnt} </td>
		             </tr>
		         </c:forEach>
	        
	         </tbody>        
         </table>
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 기장군
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${gijang_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/gijang/read?&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 중구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${junggu_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/junggu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 남구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${namgu_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/namgu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 사상구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${sasang_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/sasang/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
       <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 서구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${seogu_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/seogu/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
      <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 수영구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${suyeong_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            	<c:if test = "${board.title} == idx}">
	            	
					</c:if>
					<c:if test = "${pageMaker.criteria.page != idx}">
					  <li class= "page-item">
							<a class="page-link" href="./bukgu${pageMaker.makeQuery(idx)}">${idx}</a>
						</li>
					</c:if>
	            		 <a href="./Gu/suyeong/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
       <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 연제구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${yeonje_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/yeonje/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
<div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
                 영도구
            </div>
            <div class="card-body">
         <table class = "table table-hover">
         <tbody>
            
            <c:forEach items="${yeongdo_boards}" var="board">
		        <tr>
	            	<td>${board.articleNo}</td>
	            	<td>
	            		 <a href="./Gu/yeongdo/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=${board.articleNo}">${board.title}</a>
	                 </td>
	                <td>${board.viewCnt} </td>
	             </tr>
	         </c:forEach>
         </tbody>        
         </table>
            </div>
          </div>
        </div>
      </div>
</div>



<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://js/bootstrap.js"></script>
</body>

</html>