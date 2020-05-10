<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpServlet"%>

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

<div class="jumbotron">
  <h1 class="display-2">지도자리</h1>
  <p class="lead">준희 화이팅 ((${ member.id }), (${ login.id })) </p>
</div>
  
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
			<% 
    		try {
       			Class.forName("com.mysql.jdbc.Driver");
       			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/homepage", "root", "1234");
       			Statement stmt = conn.createStatement();
       			String sql = "SELECT article_no, title, viewcnt FROM article";
       		 	ResultSet rs = stmt.executeQuery(sql);
       			while(rs.next()) {
       				int num = rs.getInt("article_no");
       				%>
       				<tr>
       					<td><%= num %></td>
       					<td>
       					<a href="./board/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=num%>"><%=rs.getString("title")%></a>
       					</td>
       					<td><%=rs.getInt("viewcnt")%></td>
       				</tr>
       				<%
       			}
		    } catch (Exception e) {
		       e.printStackTrace();
		    }
            %>
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