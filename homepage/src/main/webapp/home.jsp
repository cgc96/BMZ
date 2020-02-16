<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/homepage/resources/bootstrap/css/bootstrap.css">
<%@ include file = "./resources/header.jsp" %>
</head>

<body>


<div class="jumbotron">
  <h1 class="display-2">지도자리</h1>
  <p class="lead">준희 화이팅 (${ member.id }) </p>
  
</div>
	
 <div class="container">
      <div class="row">
        <div class="col-4">
          <div class="card border-primary mb-3">
            <div class="card-header">
             	 사하구
            </div>
            
            <table class="table table-bordered">
                  <tbody>
                  <%
       			 Class.forName("com.mysql.jdbc.Driver");
       			 Connection conn = null;
       			 PreparedStatement pstmt = null;
       			 ResultSet rs = null;
         
      			  try{
       			     	String jdbcDriver = "jdbc:mysql://localhost:3306/homepage?useUnicode=true&characterEncoding=utf8";
			            String dbUser = "root";
			            String dbPwd = "1234";
			             
			            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
			             
			            pstmt = conn.prepareStatement("select * from article");
			             
			            rs = pstmt.executeQuery();
			             
			            while(rs.next()){
			            	int no = rs.getInt("article_no");
			    %>
			        <tr>
			            <td><%= no %></td>
			            <td>
                     	<a href="./board/read?${pageMaker.makeQuery(pageMaker.criteria.page)}&articleNo=<%=no%>"><%= rs.getString("title") %></a>
                    	</td>
			            <td><%= rs.getString("viewcnt") %></td>
			        </tr>
			    <%
			            }
			        }catch(SQLException se){
			            se.printStackTrace();
			        }finally{
			            if(rs != null) rs.close();
			            if(pstmt != null) pstmt.close();
			            if(conn != null) conn.close();
			        }
			    %>
                  </tbody>
             </table>
    			
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